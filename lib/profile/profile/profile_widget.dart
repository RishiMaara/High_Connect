import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/buttons/settings_button/settings_button_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home/components/z_nawbar/z_nawbar_widget.dart';
import '/loading/l_bookingdetails_copy/l_bookingdetails_copy_widget.dart';
import '/profile/components/z_continue_as_provider/z_continue_as_provider_widget.dart';
import '/profile/components/z_logout/z_logout_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'profile_model.dart';
export 'profile_model.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  static String routeName = 'Profile';
  static String routePath = '/profile';

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget>
    with TickerProviderStateMixin {
  late ProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileModel());

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: Offset(0.95, 0.95),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FFAppState().NavBar = 4;
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).optionalColor2,
        appBar: !valueOrDefault<bool>(currentUserDocument?.inService, false)
            ? AppBar(
                backgroundColor: FlutterFlowTheme.of(context).optionalColor2,
                automaticallyImplyLeading: false,
                title: Text(
                  'Profile',
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .fontStyle,
                      ),
                ),
                actions: [],
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).optionalColor2,
                    ),
                  ),
                ),
                centerTitle: true,
                elevation: 0.0,
              )
            : null,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Builder(
                      builder: (context) {
                        if (valueOrDefault<bool>(
                                currentUserDocument?.inService, false) &&
                            currentUserDocument?.service != null) {
                          return StreamBuilder<ServicesRecord>(
                            stream: ServicesRecord.getDocument(
                                currentUserDocument!.service!),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData || snapshot.data == null) {
                                return LBookingdetailsCopyWidget();
                              }

                              final columnServicesRecord = snapshot.data!;

                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 140.0,
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          child: columnServicesRecord.image.isNotEmpty
                                              ? Image.network(
                                                  columnServicesRecord.image,
                                                  width: double.infinity,
                                                  height: 100.0,
                                                  fit: BoxFit.cover,
                                                  loadingBuilder: (context, child, loadingProgress) {
                                                    if (loadingProgress == null) return child;
                                                    return Container(
                                                      width: double.infinity,
                                                      height: 100.0,
                                                      color: FlutterFlowTheme.of(context).alternate,
                                                      child: Center(
                                                        child: CircularProgressIndicator(
                                                          value: loadingProgress.expectedTotalBytes != null
                                                              ? loadingProgress.cumulativeBytesLoaded /
                                                                  loadingProgress.expectedTotalBytes!
                                                              : null,
                                                          valueColor: AlwaysStoppedAnimation<Color>(
                                                            FlutterFlowTheme.of(context).primary,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  errorBuilder: (context, error, stackTrace) {
                                                    return Container(
                                                      width: double.infinity,
                                                      height: 100.0,
                                                      color: FlutterFlowTheme.of(context).alternate,
                                                      child: Icon(
                                                        Icons.image_not_supported_outlined,
                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                        size: 32.0,
                                                      ),
                                                    );
                                                  },
                                                )
                                              : Container(
                                                  width: double.infinity,
                                                  height: 100.0,
                                                  color: FlutterFlowTheme.of(context).alternate,
                                                  child: Icon(
                                                    Icons.image_outlined,
                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                    size: 32.0,
                                                  ),
                                                ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 15.0, 0.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 3.0,
                                                    color: Color(0x24000000),
                                                    offset: Offset(
                                                      0.0,
                                                      1.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(15.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary,
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: Image.network(
                                                            currentUserPhoto !=
                                                                        ''
                                                                ? currentUserPhoto
                                                                : FFAppConstants
                                                                    .userImage,
                                                          ).image,
                                                        ),
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              currentUserDisplayName,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .fontStyle,
                                                                    lineHeight:
                                                                        1.0,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                'Service provider',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .inter(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                      lineHeight:
                                                                          1.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 24.0, 15.0, 0.0),
                                    child: Center(
                                      child: Text(
                                        'Service Profile',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .fontStyle,
                                              lineHeight: 1.5,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 8.0, 15.0, 0.0),
                                    child: Center(
                                      child: Text(
                                        columnServicesRecord.category,
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold,
                                              ),
                                              color: FlutterFlowTheme.of(context).primary,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 24.0, 15.0, 0.0),
                                    child: Text(
                                      'General',
                                      style: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                            lineHeight: 1.0,
                                          ),
                                    ),
                                  ),
                                  InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                            EditProfileWidget.routeName);
                                      },
                                      child: wrapWithModel(
                                        model: _model.profileInformationModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: SettingsButtonWidget(
                                          title: 'Profile Information',
                                          description: 'Manage your details',
                                          icon: Icon(
                                            FFIcons.kuser03,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                          showDivider: true,
                                        ),
                                      ),
                                  ),
                                  InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          ServiceDetailsWidget.routeName,
                                          queryParameters: {
                                            'serviceDoc': serializeParam(
                                              columnServicesRecord,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'serviceDoc': columnServicesRecord,
                                          },
                                        );
                                      },
                                      child: wrapWithModel(
                                        model: _model.serviceDetailModel,
                                        updateCallback: () =>
                                            safeSetState(() {}),
                                        child: SettingsButtonWidget(
                                          title: 'Service Details',
                                          description: 'Set up your services',
                                          icon: Icon(
                                            FFIcons.krollerBrush,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24.0,
                                          ),
                                          showDivider: true,
                                        ),
                                      ),
                                  ),

                                ],
                              );
                            },
                          );
                        } else {
                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(15.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context
                                        .pushNamed(EditProfileWidget.routeName);
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      AuthUserStreamWidget(
                                        builder: (context) => Container(
                                          width: 64.0,
                                          height: 64.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .optionalColor,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: Image.network(
                                                currentUserPhoto != ''
                                                    ? currentUserPhoto
                                                    : FFAppConstants.userImage,
                                              ).image,
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15.0, 0.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AuthUserStreamWidget(
                                                builder: (context) => Text(
                                                  currentUserDisplayName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .fontStyle,
                                                        ),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .fontStyle,
                                                        lineHeight: 1.0,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'Edit Profile',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                                lineHeight: 1.0,
                                                              ),
                                                    ),
                                                    Icon(
                                                      FFIcons.kchevronRight,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .icons,
                                                      size: 18.0,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              if (currentUserDocument?.service != null)
                                Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: wrapWithModel(
                                    model: _model.zContinueAsProviderModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: ZContinueAsProviderWidget(),
                                  ),
                                ),
                              if (currentUserDocument?.service == null)
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed(BecomeProviderWidget.routeName);
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            FlutterFlowTheme.of(context).primary,
                                            FlutterFlowTheme.of(context).primary.withValues(alpha: 0.75),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        borderRadius: BorderRadius.circular(16.0),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 12.0,
                                            color: FlutterFlowTheme.of(context).primary.withValues(alpha: 0.30),
                                            offset: Offset(0.0, 4.0),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 52.0,
                                              height: 52.0,
                                              decoration: BoxDecoration(
                                                color: Colors.white.withValues(alpha: 0.18),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.handshake_rounded,
                                                color: Colors.white,
                                                size: 28.0,
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(14.0, 0.0, 0.0, 0.0),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Become a Provider',
                                                      style: GoogleFonts.inter(
                                                        fontSize: 16.0,
                                                        fontWeight: FontWeight.w700,
                                                        color: Colors.white,
                                                        height: 1.3,
                                                      ),
                                                    ),
                                                    SizedBox(height: 4.0),
                                                    Text(
                                                      'Join our network & start earning',
                                                      style: GoogleFonts.inter(
                                                        fontSize: 13.0,
                                                        fontWeight: FontWeight.w400,
                                                        color: Colors.white.withValues(alpha: 0.85),
                                                        height: 1.4,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 32.0,
                                              height: 32.0,
                                              decoration: BoxDecoration(
                                                color: Colors.white.withValues(alpha: 0.18),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                Icons.arrow_forward_ios_rounded,
                                                color: Colors.white,
                                                size: 16.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 15.0, 15.0, 0.0),
                                child: Text(
                                  'General',
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                        lineHeight: 1.0,
                                      ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context
                                      .pushNamed(MyAddressesWidget.routeName);
                                },
                                child: wrapWithModel(
                                  model: _model.myAddressesModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: SettingsButtonWidget(
                                    title: 'My addresses',
                                    description: 'Save and manage locations',
                                    icon: Icon(
                                      FFIcons.kmarkerPin01,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    showDivider: true,
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(FavoritesWidget.routeName);
                                },
                                child: wrapWithModel(
                                  model: _model.myReviewModel1,
                                  updateCallback: () => safeSetState(() {}),
                                  child: SettingsButtonWidget(
                                    title: 'Favourites',
                                    description:
                                        'Access your saved services anytime',
                                    icon: Icon(
                                      FFIcons.kheart,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    showDivider: true,
                                  ),
                                ),
                              ),
                                InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context
                                        .pushNamed(MyReviewsWidget.routeName);
                                  },
                                  child: wrapWithModel(
                                    model: _model.myReviewModel2,
                                    updateCallback: () => safeSetState(() {}),
                                    child: SettingsButtonWidget(
                                      title: 'My reviews',
                                      description:
                                          'View and manage your feedback',
                                      icon: Icon(
                                        FFIcons.kmessageTextSquare02,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 24.0,
                                      ),
                                      showDivider: true,
                                    ),
                                  ),
                                ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed(
                                      MyNotificationsWidget.routeName);
                                },
                                child: wrapWithModel(
                                  model: _model.myNotificationsModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: SettingsButtonWidget(
                                    title: 'My notifications',
                                    description:
                                        'Manage your alerts and updates',
                                    icon: Icon(
                                      FFIcons.kbell01,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                    showDivider: true,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                      },
                    ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(LanguageWidget.routeName);
                        },
                        child: wrapWithModel(
                          model: _model.languageModel,
                          updateCallback: () => safeSetState(() {}),
                          child: SettingsButtonWidget(
                            title: 'Language',
                            description: 'Change language of app',
                            icon: Icon(
                              FFIcons.kglobe01,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            ),
                            showDivider: true,
                          ),
                        ),
                      ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (FFAppState().darkMode) {
                            FFAppState().darkMode = false;
                            safeSetState(() {});
                            setDarkModeSetting(context, ThemeMode.light);
                          } else {
                            FFAppState().darkMode = true;
                            safeSetState(() {});
                            setDarkModeSetting(context, ThemeMode.dark);
                          }
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 48.0,
                              height: 48.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).accent1,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Icon(
                                FFIcons.kpalette,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24.0,
                              ),
                            ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 15.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    Text(
                                      'Dark mode',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                            lineHeight: 1.0,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 8.0, 0.0, 0.0),
                                      child: Text(
                                        'Toggle light or dark theme',
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .fontStyle,
                                              lineHeight: 1.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 48.0,
                              height: 28.0,
                              child: Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FFAppState().darkMode
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .secondary,
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(
                                        valueOrDefault<double>(
                                          FFAppState().darkMode ? 1.0 : -1.0,
                                          0.0,
                                        ),
                                        0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2.0, 0.0, 2.0, 0.0),
                                      child: Container(
                                        width: 24.0,
                                        height: 24.0,
                                        decoration: BoxDecoration(
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x0E000000),
                                              offset: Offset(
                                                FFAppState().darkMode
                                                    ? -1.0
                                                    : 1.0,
                                                0.0,
                                              ),
                                            )
                                          ],
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      height: 1.0,
                      thickness: 1.0,
                      indent: 15.0,
                      endIndent: 15.0,
                      color: FlutterFlowTheme.of(context).optionalColor,
                    ),

                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(SettingsWidget.routeName);
                        },
                        child: wrapWithModel(
                          model: _model.settingsModel,
                          updateCallback: () => safeSetState(() {}),
                          child: SettingsButtonWidget(
                            title: 'Settings',
                            description: 'Customize your app preferences',
                            icon: Icon(
                              FFIcons.ksettings01,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                    Container(
                      width: double.infinity,
                      height: 6.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).optionalColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                      child: Text(
                        'Others',
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontStyle,
                              lineHeight: 1.0,
                            ),
                      ),
                    ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(HelpCenterWidget.routeName);
                        },
                        child: wrapWithModel(
                          model: _model.notificationsModel1,
                          updateCallback: () => safeSetState(() {}),
                          child: SettingsButtonWidget(
                            title: 'Help center',
                            description: 'Help & Info in one place',
                            icon: Icon(
                              FFIcons.khelpCircle,
                              color: FlutterFlowTheme.of(context).primary,
                              size: 24.0,
                            ),
                            showDivider: true,
                          ),
                        ),
                      ),
                      Builder(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await Share.share(
                              '🏗️ HIGH Connect - Your Dream Project Made Easy!\n\nCan\'t find the right engineer for your dream project? 🤔\nStop wasting time searching and calling! ⏰\n\n✨ HIGH Connect is here!\n\nConnect with your perfect Engineer within seconds! 🚀\n\n📋 100+ Categories Available:\n• Civil Engineers\n• Construction Experts\n• Building Plan Approval Specialists\n• Structural Engineers\n• Promoters & Builders\n• Skilled Labours\n...and many more!\n\n🎯 Everything in ONE Platform!\nFrom land selection to final painting - all specialists are here!\n\n💰 Best Part: Completely FREE for users!\n\n📍 Find engineers in YOUR area\n🤝 Connect directly with them\n\n🎁 SPECIAL OFFER:\nFirst 500 engineers get FREE registration!\n\n⏱️ Save Time • Save Effort • Perfect Work!\n\nDownload NOW:\nhttps://play.google.com/store/apps/details?id=com.myhigh.connect\n\nHIGH Connect — Your Perfect Project Partner! 🏡✨',
                              sharePositionOrigin:
                                  getWidgetBoundingBox(context),
                            );
                          },
                          child: wrapWithModel(
                            model: _model.notificationsModel2,
                            updateCallback: () => safeSetState(() {}),
                            child: SettingsButtonWidget(
                              title: 'Share the app',
                              description: 'Invite friends to try the app',
                              icon: Icon(
                                FFIcons.kshare07,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24.0,
                              ),
                              showDivider: true,
                            ),
                          ),
                        ),
                      ),

                      Builder(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            launchUrl(
                              Uri.parse('https://play.google.com/store/apps/details?id=com.myhigh.connect'),
                              mode: LaunchMode.externalApplication,
                            );
                          },
                          child: wrapWithModel(
                            model: _model.notificationsModel4,
                            updateCallback: () => safeSetState(() {}),
                            child: SettingsButtonWidget(
                              title: 'Rate the app',
                              description: 'Rate us on the Play Store',
                              icon: Icon(
                                FFIcons.kstar01,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24.0,
                              ),
                              showDivider: true,
                            ),
                          ),
                        ),
                      ),
                    Builder(
                      builder: (context) => Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 15.0, 15.0, 32.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await showDialog(
                              barrierColor:
                                  FlutterFlowTheme.of(context).barrier,
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: GestureDetector(
                                    onTap: () {
                                      FocusScope.of(dialogContext).unfocus();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    child: ZLogoutWidget(),
                                  ),
                                );
                              },
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 48.0,
                                height: 48.0,
                                decoration: BoxDecoration(
                                  color:
                                      FlutterFlowTheme.of(context).errorAccent,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  FFIcons.klogOut01,
                                  color: FlutterFlowTheme.of(context).error,
                                  size: 24.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Logout',
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                        lineHeight: 1.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
            ),
            wrapWithModel(
              model: _model.zNawbarModel,
              updateCallback: () => safeSetState(() {}),
              child: ZNawbarWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
