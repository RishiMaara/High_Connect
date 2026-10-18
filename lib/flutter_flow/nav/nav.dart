import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';
import '/components/animated_splash_widget.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? HomePageWidget() : OnboardingWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? HomePageWidget() : OnboardingWidget(),
        ),
        FFRoute(
          name: HomePageWidget.routeName,
          path: HomePageWidget.routePath,
          builder: (context, params) => HomePageWidget(),
        ),
        FFRoute(
          name: OnboardingWidget.routeName,
          path: OnboardingWidget.routePath,
          builder: (context, params) => OnboardingWidget(),
        ),
        FFRoute(
          name: SignUpWidget.routeName,
          path: SignUpWidget.routePath,
          builder: (context, params) => SignUpWidget(
            provider: params.getParam(
              'provider',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: OTPCodeVerificationWidget.routeName,
          path: OTPCodeVerificationWidget.routePath,
          builder: (context, params) => OTPCodeVerificationWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
            otpCode: params.getParam(
              'otpCode',
              ParamType.String,
            ),
            provider: params.getParam(
              'provider',
              ParamType.bool,
            ),
            isSignup: params.getParam(
              'isSignup',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: SiggInWidget.routeName,
          path: SiggInWidget.routePath,
          builder: (context, params) => SiggInWidget(
            provider: params.getParam(
              'provider',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: ProfileWidget.routeName,
          path: ProfileWidget.routePath,
          builder: (context, params) => ProfileWidget(),
        ),
        FFRoute(
          name: MessagesWidget.routeName,
          path: MessagesWidget.routePath,
          builder: (context, params) => MessagesWidget(),
        ),
        FFRoute(
          name: MyBookingsWidget.routeName,
          path: MyBookingsWidget.routePath,
          builder: (context, params) => MyBookingsWidget(),
        ),
        FFRoute(
          name: EditProfileWidget.routeName,
          path: EditProfileWidget.routePath,
          builder: (context, params) => EditProfileWidget(),
        ),
        FFRoute(
          name: NotificationsManagerWidget.routeName,
          path: NotificationsManagerWidget.routePath,
          builder: (context, params) => NotificationsManagerWidget(),
        ),
        FFRoute(
          name: MyPaymentMethodsWidget.routeName,
          path: MyPaymentMethodsWidget.routePath,
          builder: (context, params) => MyPaymentMethodsWidget(),
        ),
        FFRoute(
          name: AddCreditCardWidget.routeName,
          path: AddCreditCardWidget.routePath,
          asyncParams: {
            'serviceDoc': getDoc(['services'], ServicesRecord.fromSnapshot),
          },
          builder: (context, params) => AddCreditCardWidget(
            serviceDoc: params.getParam(
              'serviceDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: LanguageWidget.routeName,
          path: LanguageWidget.routePath,
          builder: (context, params) => LanguageWidget(),
        ),
        FFRoute(
          name: SecurityWidget.routeName,
          path: SecurityWidget.routePath,
          builder: (context, params) => SecurityWidget(),
        ),
        FFRoute(
          name: ResetPasswordWidget.routeName,
          path: ResetPasswordWidget.routePath,
          builder: (context, params) => ResetPasswordWidget(
            provider: params.getParam(
              'provider',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: FaqWidget.routeName,
          path: FaqWidget.routePath,
          builder: (context, params) => FaqWidget(),
        ),
        FFRoute(
          name: PrivacyPolicyWidget.routeName,
          path: PrivacyPolicyWidget.routePath,
          builder: (context, params) => PrivacyPolicyWidget(),
        ),
        FFRoute(
          name: TermOfServiceWidget.routeName,
          path: TermOfServiceWidget.routePath,
          builder: (context, params) => TermOfServiceWidget(),
        ),
        FFRoute(
          name: RefundPolicyWidget.routeName,
          path: RefundPolicyWidget.routePath,
          builder: (context, params) => RefundPolicyWidget(),
        ),
        FFRoute(
          name: SupportWidget.routeName,
          path: SupportWidget.routePath,
          builder: (context, params) => SupportWidget(),
        ),
        FFRoute(
          name: ChatWidget.routeName,
          path: ChatWidget.routePath,
          builder: (context, params) => ChatWidget(
            userRef: params.getParam(
              'userRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['users'],
            ),
          ),
        ),
        FFRoute(
          name: BookingsDetailsWidget.routeName,
          path: BookingsDetailsWidget.routePath,
          asyncParams: {
            'bookingDoc':
                getDoc(['users', 'my_bookings'], MyBookingsRecord.fromSnapshot),
          },
          builder: (context, params) => BookingsDetailsWidget(
            bookingDoc: params.getParam(
              'bookingDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ServicePageWidget.routeName,
          path: ServicePageWidget.routePath,
          asyncParams: {
            'serviceDoc': getDoc(['services'], ServicesRecord.fromSnapshot),
          },
          builder: (context, params) => ServicePageWidget(
            serviceDoc: params.getParam(
              'serviceDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'ServicePageDynamic',
          path: '/service/:serviceDoc',
          asyncParams: {
            'serviceDoc': getDoc(['services'], ServicesRecord.fromSnapshot),
          },
          builder: (context, params) => ServicePageWidget(
            serviceDoc: params.getParam(
              'serviceDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ReviewsListWidget.routeName,
          path: ReviewsListWidget.routePath,
          builder: (context, params) => ReviewsListWidget(
            serviceRef: params.getParam(
              'serviceRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['services'],
            ),
          ),
        ),
        FFRoute(
          name: LocationWidget.routeName,
          path: LocationWidget.routePath,
          asyncParams: {
            'serviceDoc': getDoc(['services'], ServicesRecord.fromSnapshot),
            'addressDoc':
                getDoc(['users', 'addresses'], AddressesRecord.fromSnapshot),
          },
          builder: (context, params) => LocationWidget(
            serviceDoc: params.getParam(
              'serviceDoc',
              ParamType.Document,
            ),
            addressDoc: params.getParam(
              'addressDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: BookingRoomsWidget.routeName,
          path: BookingRoomsWidget.routePath,
          asyncParams: {
            'serviceDoc': getDoc(['services'], ServicesRecord.fromSnapshot),
          },
          builder: (context, params) => BookingRoomsWidget(
            serviceDoc: params.getParam(
              'serviceDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: BookingPayWidget.routeName,
          path: BookingPayWidget.routePath,
          asyncParams: {
            'serviceDoc': getDoc(['services'], ServicesRecord.fromSnapshot),
          },
          builder: (context, params) => BookingPayWidget(
            fromAddress: params.getParam(
              'fromAddress',
              ParamType.bool,
            ),
            serviceDoc: params.getParam(
              'serviceDoc',
              ParamType.Document,
            ),
            totalPrice: params.getParam(
              'totalPrice',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: ProgressBookingWidget.routeName,
          path: ProgressBookingWidget.routePath,
          builder: (context, params) => ProgressBookingWidget(),
        ),
        FFRoute(
          name: AllCategoriesWidget.routeName,
          path: AllCategoriesWidget.routePath,
          builder: (context, params) => AllCategoriesWidget(),
        ),
        FFRoute(
          name: ServicesListWidget.routeName,
          path: ServicesListWidget.routePath,
          builder: (context, params) => ServicesListWidget(),
        ),
        FFRoute(
          name: WelcomeWidget.routeName,

          path: WelcomeWidget.routePath,
          builder: (context, params) => WelcomeWidget(),
        ),
        FFRoute(
          name: MyAddressesWidget.routeName,
          path: MyAddressesWidget.routePath,
          builder: (context, params) => MyAddressesWidget(),
        ),
        FFRoute(
          name: AddAddressMapWidget.routeName,
          path: AddAddressMapWidget.routePath,
          asyncParams: {
            'serviceDoc': getDoc(['services'], ServicesRecord.fromSnapshot),
          },
          builder: (context, params) => AddAddressMapWidget(
            backPage: params.getParam(
              'backPage',
              ParamType.int,
            ),
            serviceDoc: params.getParam(
              'serviceDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: AddressDetailsWidget.routeName,
          path: AddressDetailsWidget.routePath,
          asyncParams: {
            'serviceDoc': getDoc(['services'], ServicesRecord.fromSnapshot),
          },
          builder: (context, params) => AddressDetailsWidget(
            address: params.getParam(
              'address',
              ParamType.String,
            ),
            geopoint: params.getParam(
              'geopoint',
              ParamType.LatLng,
            ),
            city: params.getParam(
              'city',
              ParamType.String,
            ),
            backPage: params.getParam(
              'backPage',
              ParamType.int,
            ),
            serviceDoc: params.getParam(
              'serviceDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: EditAddressWidget.routeName,
          path: EditAddressWidget.routePath,
          asyncParams: {
            'addressDoc':
                getDoc(['users', 'addresses'], AddressesRecord.fromSnapshot),
          },
          builder: (context, params) => EditAddressWidget(
            addressDoc: params.getParam(
              'addressDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: EditAddressMapWidget.routeName,
          path: EditAddressMapWidget.routePath,
          asyncParams: {
            'addressDoc':
                getDoc(['users', 'addresses'], AddressesRecord.fromSnapshot),
          },
          builder: (context, params) => EditAddressMapWidget(
            addressDoc: params.getParam(
              'addressDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: CreditCardPageWidget.routeName,
          path: CreditCardPageWidget.routePath,
          asyncParams: {
            'paymentDoc': getDoc(['users', 'payment_methods'],
                PaymentMethodsRecord.fromSnapshot),
          },
          builder: (context, params) => CreditCardPageWidget(
            paymentDoc: params.getParam(
              'paymentDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: MyReviewsWidget.routeName,
          path: MyReviewsWidget.routePath,
          builder: (context, params) => MyReviewsWidget(),
        ),
        FFRoute(
          name: RateExperienceWidget.routeName,
          path: RateExperienceWidget.routePath,
          asyncParams: {
            'bookingDoc':
                getDoc(['users', 'my_bookings'], MyBookingsRecord.fromSnapshot),
          },
          builder: (context, params) => RateExperienceWidget(
            bookingDoc: params.getParam(
              'bookingDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: MyNotificationsWidget.routeName,
          path: MyNotificationsWidget.routePath,
          builder: (context, params) => MyNotificationsWidget(),
        ),
        FFRoute(
          name: SettingsWidget.routeName,
          path: SettingsWidget.routePath,
          builder: (context, params) => SettingsWidget(),
        ),
        FFRoute(
          name: DoNotDisturbWidget.routeName,
          path: DoNotDisturbWidget.routePath,
          builder: (context, params) => DoNotDisturbWidget(),
        ),
        FFRoute(
          name: DefaultBrowserWidget.routeName,
          path: DefaultBrowserWidget.routePath,
          builder: (context, params) => DefaultBrowserWidget(),
        ),
        FFRoute(
          name: HelpCenterWidget.routeName,
          path: HelpCenterWidget.routePath,
          builder: (context, params) => HelpCenterWidget(),
        ),
        FFRoute(
          name: OurSocialsWidget.routeName,
          path: OurSocialsWidget.routePath,
          builder: (context, params) => OurSocialsWidget(),
        ),
        FFRoute(
          name: SetNewPasswordWidget.routeName,
          path: SetNewPasswordWidget.routePath,
          builder: (context, params) => SetNewPasswordWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
            provider: params.getParam(
              'provider',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: SmsPhoneVerificationWidget.routeName,
          path: SmsPhoneVerificationWidget.routePath,
          builder: (context, params) => SmsPhoneVerificationWidget(
            phoneNumber: params.getParam(
              'phoneNumber',
              ParamType.String,
            ),
            provider: params.getParam(
              'provider',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: RecomendationsListWidget.routeName,
          path: RecomendationsListWidget.routePath,
          builder: (context, params) => RecomendationsListWidget(),
        ),
        FFRoute(
          name: SearchWidget.routeName,
          path: SearchWidget.routePath,
          builder: (context, params) => SearchWidget(),
        ),
        FFRoute(
          name: BookingOfferingsWidget.routeName,
          path: BookingOfferingsWidget.routePath,
          asyncParams: {
            'serviceDoc': getDoc(['services'], ServicesRecord.fromSnapshot),
          },
          builder: (context, params) => BookingOfferingsWidget(
            serviceDoc: params.getParam(
              'serviceDoc',
              ParamType.Document,
            ),
          ),
        ),

        FFRoute(
          name: RescheduleBookingWidget.routeName,
          path: RescheduleBookingWidget.routePath,
          asyncParams: {
            'bookingDoc':
                getDoc(['users', 'my_bookings'], MyBookingsRecord.fromSnapshot),
            'serviceDoc': getDoc(['services'], ServicesRecord.fromSnapshot),
          },
          builder: (context, params) => RescheduleBookingWidget(
            bookingDoc: params.getParam(
              'bookingDoc',
              ParamType.Document,
            ),
            serviceDoc: params.getParam(
              'serviceDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: FavoritesWidget.routeName,
          path: FavoritesWidget.routePath,
          builder: (context, params) => FavoritesWidget(),
        ),
        FFRoute(
          name: GalleryWidget.routeName,
          path: GalleryWidget.routePath,
          builder: (context, params) => GalleryWidget(
            gallery: params.getParam<String>(
              'gallery',
              ParamType.String,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: AllCategoriesPageWidget.routeName,
          path: AllCategoriesPageWidget.routePath,
          builder: (context, params) => AllCategoriesPageWidget(),
        ),

        FFRoute(
          name: MainInformationWidget.routeName,
          path: MainInformationWidget.routePath,
          builder: (context, params) => MainInformationWidget(),
        ),
        FFRoute(
          name: BecomeProviderWidget.routeName,
          path: BecomeProviderWidget.routePath,
          builder: (context, params) => BecomeProviderWidget(),
        ),
        FFRoute(
          name: PersonalInformationWidget.routeName,
          path: PersonalInformationWidget.routePath,
          builder: (context, params) => PersonalInformationWidget(),
        ),
        FFRoute(
          name: PaymentSetupWidget.routeName,
          path: PaymentSetupWidget.routePath,
          builder: (context, params) => PaymentSetupWidget(
            serviceCategory: params.getParam(
              'serviceCategory',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: TermsAndConditionsWidget.routeName,
          path: TermsAndConditionsWidget.routePath,
          builder: (context, params) => TermsAndConditionsWidget(
            serviceCategory: params.getParam(
              'serviceCategory',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SubmittedWidget.routeName,
          path: SubmittedWidget.routePath,
          builder: (context, params) => SubmittedWidget(),
        ),
        FFRoute(
          name: ServiceClientsWidget.routeName,
          path: ServiceClientsWidget.routePath,
          builder: (context, params) => ServiceClientsWidget(
            serviceRef: params.getParam(
              'serviceRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['services'],
            ),
          ),
        ),
        FFRoute(
          name: TransactionPageWidget.routeName,
          path: TransactionPageWidget.routePath,
          builder: (context, params) => TransactionPageWidget(
            transactionData: params.getParam(
              'transactionData',
              ParamType.DataStruct,
              isList: false,
              structBuilder: TransactionStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: ServiceDetailsWidget.routeName,
          path: ServiceDetailsWidget.routePath,
          asyncParams: {
            'serviceDoc': getDoc(['services'], ServicesRecord.fromSnapshot),
          },
          builder: (context, params) => ServiceDetailsWidget(
            serviceDoc: params.getParam(
              'serviceDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: SeviceAddressWidget.routeName,
          path: SeviceAddressWidget.routePath,
          asyncParams: {
            'serviceAddress': getDoc(['services', 'service_address'],
                ServiceAddressRecord.fromSnapshot),
          },
          builder: (context, params) => SeviceAddressWidget(
            serviceAddress: params.getParam(
              'serviceAddress',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: PricingPaymentsWidget.routeName,
          path: PricingPaymentsWidget.routePath,
          asyncParams: {
            'serviceDoc': getDoc(['services'], ServicesRecord.fromSnapshot),
          },
          builder: (context, params) => PricingPaymentsWidget(
            serviceDoc: params.getParam(
              'serviceDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: HourlyRatesWidget.routeName,
          path: HourlyRatesWidget.routePath,
          asyncParams: {
            'serviceDoc': getDoc(['services'], ServicesRecord.fromSnapshot),
          },
          builder: (context, params) => HourlyRatesWidget(
            serviceDoc: params.getParam(
              'serviceDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: PaymentMethodsWidget.routeName,
          path: PaymentMethodsWidget.routePath,
          asyncParams: {
            'serviceDoc': getDoc(['services'], ServicesRecord.fromSnapshot),
          },
          builder: (context, params) => PaymentMethodsWidget(
            serviceDoc: params.getParam(
              'serviceDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: PayoutScheduleWidget.routeName,
          path: PayoutScheduleWidget.routePath,
          asyncParams: {
            'serviceDoc': getDoc(['services'], ServicesRecord.fromSnapshot),
          },
          builder: (context, params) => PayoutScheduleWidget(
            serviceDoc: params.getParam(
              'serviceDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: ServiceBookingsWidget.routeName,
          path: ServiceBookingsWidget.routePath,
          builder: (context, params) => ServiceBookingsWidget(),
        ),
        FFRoute(
          name: Allcatagories2Widget.routeName,
          path: Allcatagories2Widget.routePath,
          builder: (context, params) => Allcatagories2Widget(),
        ),
        FFRoute(
          name: ResetPasswordCopyWidget.routeName,
          path: ResetPasswordCopyWidget.routePath,
          builder: (context, params) => ResetPasswordCopyWidget(
            provider: params.getParam(
              'provider',
              ParamType.bool,
            ),
          ),
        ),
        FFRoute(
          name: SiggInCopyWidget.routeName,
          path: SiggInCopyWidget.routePath,
          builder: (context, params) => SiggInCopyWidget(
            provider: params.getParam(
              'provider',
              ParamType.bool,
            ),
          ),
        ),

        FFRoute(
          name: RealcategoryWidget.routeName,
          path: RealcategoryWidget.routePath,
          builder: (context, params) => RealcategoryWidget(),
        ),
        FFRoute(
          name: RealcategoryCopyWidget.routeName,
          path: RealcategoryCopyWidget.routePath,
          builder: (context, params) => RealcategoryCopyWidget(),
        ),
        FFRoute(
          name: LastcategorypageWidget.routeName,
          path: LastcategorypageWidget.routePath,
          builder: (context, params) => LastcategorypageWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/onboarding';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? AnimatedSplashWidget()
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 280),
      );
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
