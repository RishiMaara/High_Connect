import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'components/z_auth_loading_overlay.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'auth/firebase_auth/firebase_user_provider.dart';
import 'auth/firebase_auth/auth_util.dart';

import 'backend/firebase/firebase_config.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'services/push_notification_service.dart';
import 'services/fcm_background_handler.dart';

import 'components/animated_splash_widget.dart';
import 'components/in_app_notification_banner.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb) {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }

  // Show initial splash screen to avoid gray screen
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const AnimatedSplashWidget(),
  ));

  try {
    GoRouter.optionURLReflectsImperativeAPIs = true;
    usePathUrlStrategy();

    await initFirebase();

    await FlutterFlowTheme.initialize();

    final appState = FFAppState(); // Initialize FFAppState
    await appState.initializePersistedState();

    // Initialize FCM for push notifications (mobile only)
    if (!kIsWeb) {
      await PushNotificationService.initialize();
      
      // Register booking callback for badge updates
      PushNotificationService.registerBookingCallback(() {
        appState.hasNewBookings = true;
      });
    }

    if (!kIsWeb) {
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    }

    runApp(ChangeNotifierProvider(
      create: (context) => appState,
      child: MyApp(),
    ));
  } catch (e) {
    runApp(MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, color: Colors.red, size: 60),
                SizedBox(height: 20),
                Text("App Initialization Failed", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text(e.toString(), textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class MyAppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  // In-app notification banner state
  String? _notifTitle;
  String? _notifBody;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;
  String getRoute([RouteMatch? routeMatch]) {
    final RouteMatch lastMatch =
        routeMatch ?? _router.routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : _router.routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }

  List<String> getRouteStack() =>
      _router.routerDelegate.currentConfiguration.matches
          .map((e) => getRoute(e))
          .toList();
  late Stream<BaseAuthUser> userStream;

  final authUserSub = authenticatedUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);

    String? _lastLoggedInUid;
    userStream = hIGHConnectFirebaseUserStream()
      ..listen((user) {
        _appStateNotifier.update(user);
        if (!kIsWeb && user.loggedIn) {
          final uid = user.uid;
          // Only refresh token when a NEW user logs in (not on every stream event)
          if (uid != _lastLoggedInUid) {
            _lastLoggedInUid = uid;
            // Delay slightly to ensure Firestore user doc is ready after login
            Future.delayed(const Duration(seconds: 2), () {
              PushNotificationService.refreshToken();
            });
          }
        } else if (!user.loggedIn) {
          _lastLoggedInUid = null;
        }
      });
    jwtTokenStream.listen((_) {});
    // Future.delayed(
    //   const Duration(milliseconds: 2000),
    //   () => _appStateNotifier.stopShowingSplashImage(),
    // );

    // Register banner callback for foreground FCM messages
    if (!kIsWeb) {
      PushNotificationService.registerBannerCallback((title, body) {
        if (mounted) {
          safeSetState(() {
            _notifTitle = title;
            _notifBody = body;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  void setLocale(String language) {
    safeSetState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => safeSetState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'HIGH Connect',
      scrollBehavior: MyAppScrollBehavior(),
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FallbackMaterialLocalizationDelegate(),
        FallbackCupertinoLocalizationDelegate(),
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
      ],
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: _themeMode,
      routerConfig: _router,
      builder: (context, child) {
        return Stack(
          children: [
            child!,
            const ZAuthLoadingIndicator(),
            // Animated Splash Screen overlay
            if (_appStateNotifier.showSplashImage)
              Positioned.fill(
                child: AnimatedSplashWidget(
                  onFinished: () {
                    if (mounted) {
                      _appStateNotifier.stopShowingSplashImage();
                      setState(() {});
                    }
                  },
                ),
              ),
            // In-app notification banner overlay
            if (_notifTitle != null)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: InAppNotificationBanner(
                  title: _notifTitle!,
                  body: _notifBody ?? '',
                  onDismiss: () {
                    if (mounted) {
                      safeSetState(() {
                        _notifTitle = null;
                        _notifBody = null;
                      });
                    }
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}
