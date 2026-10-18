import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/become_provider/z_error_text/z_error_text_widget.dart';
import '/become_provider/z_service_address_map/z_service_address_map_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'main_information_model.dart';
export 'main_information_model.dart';

class MainInformationWidget extends StatefulWidget {
  const MainInformationWidget({super.key});

  static String routeName = 'MainInformation';
  static String routePath = '/mainInformation';

  @override
  State<MainInformationWidget> createState() => _MainInformationWidgetState();
}

class _MainInformationWidgetState extends State<MainInformationWidget> {
  late MainInformationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainInformationModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().serviceAvailableTime = [];
      FFAppState().serviceAvailableDay = [];
      FFAppState().serviceAddress = AddressStruct();
      FFAppState().serviceOfferings = [];
      FFAppState().selectedServiceOfferings = [];
      FFAppState().serviceCategory =
          FirebaseFirestore.instance.doc('/categories/111');
      FFAppState().serviceHourlyRate = 0.0;
      safeSetState(() {});
    });

    _model.titleTextController ??= TextEditingController();
    _model.titleFocusNode ??= FocusNode();

    _model.descriptionTextController ??= TextEditingController();
    _model.descriptionFocusNode ??= FocusNode();

    _model.addressLineTextController ??= TextEditingController();
    _model.addressLineFocusNode ??= FocusNode();

    _model.zipCodeTextController ??= TextEditingController();
    _model.zipCodeFocusNode ??= FocusNode();

    _model.countryTextController ??= TextEditingController();
    _model.countryFocusNode ??= FocusNode();

    _model.categorySearchTextController ??= TextEditingController();
    _model.categorySearchFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.countryTextController?.text = 'India';
        }));
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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).optionalColor2,
            automaticallyImplyLeading: false,
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
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).optionalColor2,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(6.0, 15.0, 6.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 22.0,
                        borderWidth: 1.0,
                        buttonSize: 44.0,
                        icon: Icon(
                          FFIcons.karrowLeft,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          if (_model.pageViewCurrentIndex == 0) {
                            context.safePop();
                          } else {
                            await _model.pageViewController?.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 44.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Main information',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                    lineHeight: 1.0,
                                  ),
                            ),
                            Text(
                              'Step ${(1 + _model.pageViewCurrentIndex).toString()} of 4',
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .fontStyle,
                                    lineHeight: 1.0,
                                  ),
                            ),
                          ].divide(SizedBox(height: 8.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 500.0,
                  child: Stack(
                    children: [
                      PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _model.pageViewController ??=
                            PageController(initialPage: 0),
                        onPageChanged: (_) async {
                          _model.stepId = 1 + _model.pageViewCurrentIndex;
                          safeSetState(() {});
                        },
                        scrollDirection: Axis.horizontal,
                        children: [
                          Form(
                            key: _model.formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 32.0, 15.0, 0.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Add service details',
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
                                            fontSize: 32.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontStyle,
                                            lineHeight: 1.0,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Text(
                                        'This is your storefront! Add a clear service title, a detailed description of your expertise, and a high-quality cover photo to showcase your best work and attract the right clients.',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                              lineHeight: 1.5,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 24.0, 0.0, 0.0),
                                      child: Text(
                                        'Title',
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        child: TextFormField(
                                          controller:
                                              _model.titleTextController,
                                          focusNode: _model.titleFocusNode,
                                          autofocus: false,
                                          textInputAction: TextInputAction.next,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: false,
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .fontStyle,
                                                      lineHeight: 1.0,
                                                    ),
                                            hintText: 'Add a service name',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .fontStyle,
                                                      lineHeight: 1.5,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .optionalColor,
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 15.0, 0.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
                                                lineHeight: 1.5,
                                              ),
                                          maxLength: 60,
                                          buildCounter: (context,
                                                  {required currentLength,
                                                  required isFocused,
                                                  maxLength}) =>
                                              null,
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          validator: _model
                                              .titleTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 0.0, 0.0),
                                      child: Text(
                                        'Description',
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        child: TextFormField(
                                          controller:
                                              _model.descriptionTextController,
                                          focusNode:
                                              _model.descriptionFocusNode,
                                          autofocus: false,
                                          textInputAction: TextInputAction.next,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            isDense: false,
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .fontStyle,
                                                      lineHeight: 1.0,
                                                    ),
                                            hintText:
                                                'Add a service description',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .fontStyle,
                                                      lineHeight: 1.5,
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            filled: true,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .optionalColor,
                                            contentPadding:
                                                EdgeInsets.all(15.0),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyLarge
                                                          .fontStyle,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyLarge
                                                        .fontStyle,
                                                lineHeight: 1.5,
                                              ),
                                          maxLines: 10,
                                          minLines: 6,
                                          maxLength: 300,
                                          buildCounter: (context,
                                                  {required currentLength,
                                                  required isFocused,
                                                  maxLength}) =>
                                              null,
                                          cursorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          validator: _model
                                              .descriptionTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 15.0, 0.0, 0.0),
                                      child: Text(
                                        'Service Cover Photo',
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 220.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .optionalColor,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Builder(
                                          builder: (context) {
                                            if (_model.isDataUploading_coverPhoto) {
                                              // Show loading indicator during upload
                                              return Center(
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    CircularProgressIndicator(
                                                      valueColor: AlwaysStoppedAnimation<Color>(
                                                        FlutterFlowTheme.of(context).primary,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                                                      child: Text(
                                                        'Uploading...',
                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                          font: GoogleFonts.inter(
                                                            fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                          ),
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            } else if (_model.uploadedFileUrl_coverPhoto
                                                    .isNotEmpty) {
                                              return Container(
                                                width: double.infinity,
                                                height: 220.0,
                                                child: Stack(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(3.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await Navigator.push(
                                                            context,
                                                            PageTransition(
                                                              type:
                                                                  PageTransitionType
                                                                      .fade,
                                                              child:
                                                                  FlutterFlowExpandedImageView(
                                                                image: Image
                                                                    .network(
                                                                  _model
                                                                      .uploadedFileUrl_coverPhoto,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                  errorBuilder: (context, error, stackTrace) =>
                                                                      Icon(Icons.error),
                                                                ),
                                                                allowRotation:
                                                                    false,
                                                                tag: _model
                                                                    .uploadedFileUrl_coverPhoto,
                                                                useHeroAnimation:
                                                                    true,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        child: Hero(
                                                          tag: _model
                                                              .uploadedFileUrl_coverPhoto,
                                                          transitionOnUserGestures:
                                                              true,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                Image.network(
                                                              _model
                                                                  .uploadedFileUrl_coverPhoto,
                                                              width: double
                                                                  .infinity,
                                                              height: double
                                                                  .infinity,
                                                              fit: BoxFit.cover,
                                                              loadingBuilder: (context, child, loadingProgress) {
                                                                if (loadingProgress == null) return child;
                                                                return Center(
                                                                  child: CircularProgressIndicator(
                                                                    value: loadingProgress.expectedTotalBytes != null
                                                                        ? loadingProgress.cumulativeBytesLoaded /
                                                                            loadingProgress.expectedTotalBytes!
                                                                        : null,
                                                                  ),
                                                                );
                                                              },
                                                              errorBuilder: (context, error, stackTrace) {
                                                                return Center(
                                                                  child: Column(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: [
                                                                      Icon(
                                                                        Icons.error_outline,
                                                                        color: FlutterFlowTheme.of(context).error,
                                                                        size: 40,
                                                                      ),
                                                                      SizedBox(height: 8),
                                                                      Text(
                                                                        'Failed to load image',
                                                                        style: FlutterFlowTheme.of(context).bodySmall,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            safeSetState(() {
                                                              _model.isDataUploading_coverPhoto =
                                                                  false;
                                                              _model.uploadedLocalFile_coverPhoto =
                                                                  FFUploadedFile(
                                                                      bytes: Uint8List
                                                                          .fromList(
                                                                              []),
                                                                      originalFilename:
                                                                          '');
                                                              _model.uploadedFileUrl_coverPhoto =
                                                                  '';
                                                            });
                                                          },
                                                          child: Container(
                                                            width: 24.0,
                                                            height: 24.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .barrier,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Icon(
                                                              FFIcons.kxClose,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              size: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            } else {
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  final selectedMedia =
                                                      await selectMediaWithSourceBottomSheet(
                                                    context: context,
                                                    allowPhoto: true,
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(
                                                              m.storagePath,
                                                              context))) {
                                                    safeSetState(() => _model
                                                            .isDataUploading_coverPhoto =
                                                        true);
                                                    var selectedUploadedFiles =
                                                        <FFUploadedFile>[];

                                                    var downloadUrls =
                                                        <String>[];
                                                    try {
                                                      selectedUploadedFiles =
                                                          selectedMedia
                                                              .map((m) =>
                                                                  FFUploadedFile(
                                                                    name: m
                                                                        .storagePath
                                                                        .split(
                                                                            '/')
                                                                        .last,
                                                                    bytes:
                                                                        m.bytes,
                                                                    height: m
                                                                        .dimensions
                                                                        ?.height,
                                                                    width: m
                                                                        .dimensions
                                                                        ?.width,
                                                                    blurHash: m
                                                                        .blurHash,
                                                                    originalFilename:
                                                                        m.originalFilename,
                                                                  ))
                                                              .toList();

                                                      downloadUrls =
                                                          (await Future.wait(
                                                        selectedMedia.map(
                                                          (m) async =>
                                                              await uploadData(
                                                                  m.storagePath,
                                                                  m.bytes),
                                                        ),
                                                      ))
                                                              .where((u) =>
                                                                  u != null)
                                                              .map((u) => u!)
                                                              .toList();
                                                    } finally {
                                                      _model.isDataUploading_coverPhoto =
                                                          false;
                                                    }
                                                    if (selectedUploadedFiles
                                                                .length ==
                                                            selectedMedia
                                                                .length &&
                                                        downloadUrls.length ==
                                                            selectedMedia
                                                                .length) {
                                                      safeSetState(() {
                                                        _model.uploadedLocalFile_coverPhoto =
                                                            selectedUploadedFiles
                                                                .first;
                                                        _model.uploadedFileUrl_coverPhoto =
                                                            downloadUrls.first;
                                                      });
                                                    } else {
                                                      safeSetState(() {});
                                                      return;
                                                    }
                                                  }
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      FFIcons.kuploadCloud02,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .icons,
                                                      size: 30.0,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  15.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Upload your service cover image',
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
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
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
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  30.0,
                                                                  8.0,
                                                                  30.0,
                                                                  0.0),
                                                      child: Text(
                                                        'PNG, JPG, JPEG, SVG (max 5MB).',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ].addToEnd(SizedBox(height: 24.0)),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 32.0, 15.0, 0.0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Work Category',
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
                                          fontSize: 32.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontStyle,
                                          lineHeight: 1.0,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Text(
                                      'Select the main category that best describes your work. Choosing the right category ensures that customers can easily find your services.',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                            lineHeight: 1.5,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: Container(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: _model.categorySearchTextController,
                                        focusNode: _model.categorySearchFocusNode,
                                        onChanged: (_) => safeSetState(() {}),
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: false,
                                          hintText: 'Search for a category...',
                                          hintStyle: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                font: GoogleFonts.inter(),
                                                letterSpacing: 0.0,
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: FlutterFlowTheme.of(context).primary,
                                              width: 1.0,
                                            ),
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          filled: true,
                                          fillColor: FlutterFlowTheme.of(context).optionalColor,
                                          contentPadding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                                          prefixIcon: Icon(
                                            Icons.search,
                                            color: FlutterFlowTheme.of(context).secondaryText,
                                            size: 24.0,
                                          ),
                                          suffixIcon: _model.categorySearchTextController!.text.isNotEmpty
                                              ? InkWell(
                                                  onTap: () async {
                                                    _model.categorySearchTextController?.clear();
                                                    safeSetState(() {});
                                                  },
                                                  child: Icon(
                                                    Icons.clear,
                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                    size: 22.0,
                                                  ),
                                                )
                                              : null,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              font: GoogleFonts.inter(),
                                              letterSpacing: 0.0,
                                            ),
                                        cursorColor: FlutterFlowTheme.of(context).primaryText,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        // Hardcoded categories list from allcatagories2
                                        const categories = [
                                          {'title': 'Air Quality & Emissions Specialist', 'icon': Icons.air},
                                          {'title': 'Airport Pavements & Airside Engineer', 'icon': Icons.flight_takeoff},
                                          {'title': 'Architectural Engineer', 'icon': Icons.architecture},
                                          {'title': 'Artificial Intelligence Technician', 'icon': Icons.memory},
                                          {'title': 'Asphalt / Bitumen Specialist', 'icon': Icons.layers},
                                          {'title': 'Asset Management Engineer', 'icon': Icons.analytics},
                                          {'title': 'BIM Engineer', 'icon': Icons.view_in_ar},
                                          {'title': 'Bridge Design Engineer', 'icon': Icons.account_tree},
                                          {'title': 'Builder and Developers', 'icon': Icons.business},
                                          {'title': 'Building Services Engineer', 'icon': Icons.settings},
                                          {'title': 'CAD / Drafting Technician', 'icon': Icons.draw},
                                          {'title': 'Climate Resilience Engineer', 'icon': Icons.public},
                                          {'title': 'Coastal / Ocean Engineer', 'icon': Icons.water},
                                          {'title': 'Computational Design Engineer', 'icon': Icons.computer},
                                          {'title': 'Construction Engineer', 'icon': Icons.construction},
                                          {'title': 'Construction Planner / Scheduler', 'icon': Icons.schedule},
                                          {'title': 'Construction Project Manager', 'icon': Icons.manage_accounts},
                                          {'title': 'Construction Robotics Specialist', 'icon': Icons.smart_toy},
                                          {'title': 'Construction Tech Specialist', 'icon': Icons.integration_instructions},
                                          {'title': 'Contracts & Commercial Engineer', 'icon': Icons.attach_money},
                                          {'title': 'Corrosion & Durability Engineer', 'icon': Icons.security},
                                          {'title': 'Dam and Reservoir Engineer', 'icon': Icons.water_damage},
                                          {'title': 'Hydraulic Structures Engineer', 'icon': Icons.storage},
                                          {'title': 'Digital Twin Engineer', 'icon': Icons.copy},
                                          {'title': 'Drinking Water Consultant', 'icon': Icons.local_drink},
                                          {'title': 'Electrical Engineer', 'icon': Icons.electrical_services},
                                          {'title': 'Electrical Material Supplier', 'icon': Icons.power},
                                          {'title': 'Electronic Accessories Supplier', 'icon': Icons.cable},
                                          {'title': 'Elevation / 3D Designer', 'icon': Icons.view_quilt},
                                          {'title': 'Environmental Compliance Specialist', 'icon': Icons.gavel},
                                          {'title': 'Environmental Engineer', 'icon': Icons.eco},
                                          {'title': 'Fabrication Consultant', 'icon': Icons.build},
                                          {'title': 'FaÃ§ade Engineer', 'icon': Icons.dashboard},
                                          {'title': 'Field / QA Inspector', 'icon': Icons.checklist},
                                          {'title': 'Floor Designer / Tile Supplier', 'icon': Icons.square_foot},
                                          {'title': 'Foundation Engineer', 'icon': Icons.foundation},
                                          {'title': 'Freight & Logistics Planner', 'icon': Icons.local_shipping},
                                          {'title': 'GEM Consultant', 'icon': Icons.account_balance},
                                          {'title': 'Geodetic Survey Engineer', 'icon': Icons.explore},
                                          {'title': 'Geosynthetics Specialist', 'icon': Icons.layers},
                                          {'title': 'Geotechnical Engineer', 'icon': Icons.terrain},
                                          {'title': 'Geotechnical Risk Engineer', 'icon': Icons.warning},
                                          {'title': 'Government Approved Civil Engineer', 'icon': Icons.verified},
                                          {'title': 'Ground Improvement Specialist', 'icon': Icons.trending_up},
                                          {'title': 'Groundwater Engineer', 'icon': Icons.opacity},
                                          {'title': 'Harbour / Seaport Engineer', 'icon': Icons.directions_boat},
                                          {'title': 'HSE Engineer', 'icon': Icons.health_and_safety},
                                          {'title': 'High-Rise Building Specialist', 'icon': Icons.apartment},
                                          {'title': 'Highway Design Engineer', 'icon': Icons.alt_route},
                                          {'title': 'Hydraulic Engineer', 'icon': Icons.waves},
                                          {'title': 'Hydrology / Flood Modeller', 'icon': Icons.thunderstorm},
                                          {'title': 'ITS Engineer', 'icon': Icons.traffic},
                                          {'title': 'Interior Design Engineer', 'icon': Icons.chair},
                                          {'title': 'Irrigation Engineer', 'icon': Icons.grass},
                                          {'title': 'Lab Testing Technician', 'icon': Icons.science},
                                          {'title': 'Land Surveyor', 'icon': Icons.map},
                                          {'title': 'Licensed Construction Engineer', 'icon': Icons.engineering},
                                          {'title': 'Man Power Agency', 'icon': Icons.people},
                                          {'title': 'Marine Structures Engineer', 'icon': Icons.anchor},
                                          {'title': 'Material Supplier', 'icon': Icons.inventory},
                                          {'title': 'Materials Engineer', 'icon': Icons.biotech},
                                          {'title': 'Net-Zero Infrastructure Analyst', 'icon': Icons.forest},
                                          {'title': 'NDT Specialist', 'icon': Icons.search},
                                          {'title': 'Offshore Structure Engineer', 'icon': Icons.oil_barrel},
                                          {'title': 'Painting Contractors', 'icon': Icons.format_paint},
                                          {'title': 'Pavement Design Engineer', 'icon': Icons.aspect_ratio},
                                          {'title': 'Photogrammetry Specialist', 'icon': Icons.photo_camera},
                                          {'title': 'Pile & Deep Foundation Engineer', 'icon': Icons.vertical_align_bottom},
                                          {'title': 'Pipeline Civil Engineer', 'icon': Icons.swap_horiz},
                                          {'title': 'Precast Structures Engineer', 'icon': Icons.grid_3x3},
                                          {'title': 'Prefabrication Specialist', 'icon': Icons.dashboard},
                                          {'title': 'QA / QC Engineer', 'icon': Icons.task_alt},
                                          {'title': 'Quantity Surveyor', 'icon': Icons.calculate},
                                          {'title': 'Railway Civil Engineer', 'icon': Icons.train},
                                          {'title': 'Registered Building Planner', 'icon': Icons.description},
                                          {'title': 'Registered Structural Engineer', 'icon': Icons.app_registration},
                                          {'title': 'Remote Sensing / UAV Specialist', 'icon': Icons.satellite_alt},
                                          {'title': 'Retrofitting Engineer', 'icon': Icons.upgrade},
                                          {'title': 'River Engineering Specialist', 'icon': Icons.water},
                                          {'title': 'Rock Mechanics Engineer', 'icon': Icons.landscape},
                                          {'title': 'Safety Engineer / Manager', 'icon': Icons.safety_check},
                                          {'title': 'Site Engineer', 'icon': Icons.supervisor_account},
                                          {'title': 'Site Monitoring / IoT Engineer', 'icon': Icons.sensors},
                                          {'title': 'Skilled Workers', 'icon': Icons.handyman},
                                          {'title': 'Slope Stability Engineer', 'icon': Icons.terrain},
                                          {'title': 'Smart Cities Engineer', 'icon': Icons.location_city},
                                          {'title': 'Soil Investigation Specialist', 'icon': Icons.agriculture},
                                          {'title': 'Solar Panel Installation', 'icon': Icons.solar_power},
                                          {'title': 'Solid Waste Management Engineer', 'icon': Icons.delete},
                                          {'title': 'Steel Structures Engineer', 'icon': Icons.view_column},
                                          {'title': 'Stormwater Design Engineer', 'icon': Icons.water_drop},
                                          {'title': 'Structural Dynamics Specialist', 'icon': Icons.vibration},
                                          {'title': 'Structural Engineer', 'icon': Icons.apartment},
                                          {'title': 'Sustainable Infrastructure Consultant', 'icon': Icons.eco},
                                          {'title': 'Temporary Works Engineer', 'icon': Icons.timeline},
                                          {'title': 'Timber Structures Engineer', 'icon': Icons.forest},
                                          {'title': 'Tunnel Engineer', 'icon': Icons.horizontal_rule},
                                          {'title': 'Wastewater Treatment Engineer', 'icon': Icons.clean_hands},
                                          {'title': 'Water Resources Engineer', 'icon': Icons.water},
                                          {'title': 'Water Supply Engineer', 'icon': Icons.water_damage},
                                          {'title': 'Real estate companies', 'icon': Icons.real_estate_agent},
                                          {'title': 'Real estate mediators', 'icon': Icons.handshake},
                                          {'title': 'Drinking water suppliers', 'icon': Icons.water_drop},
                                          {'title': 'Water suppliers', 'icon': Icons.water},
                                          {'title': 'Security Service Providers', 'icon': Icons.security},
                                          {'title': 'Housekeeping services', 'icon': Icons.cleaning_services},
                                          {'title': 'Plumbing and Wiring workers', 'icon': Icons.plumbing},
                                          {'title': 'Catering services', 'icon': Icons.restaurant_menu},
                                          {'title': 'Tiles and Floor accessories', 'icon': Icons.grid_on},
                                          {'title': 'Event Organisers', 'icon': Icons.event},
                                          {'title': 'Building Contractors', 'icon': Icons.construction},
                                          {'title': 'Exterior house decorators', 'icon': Icons.format_paint},
                                          {'title': 'Drivers And Acting drivers', 'icon': Icons.drive_eta},
                                          {'title': 'Rental vehicles', 'icon': Icons.car_rental},
                                          {'title': 'Home and Office Furniture\'s', 'icon': Icons.chair},
                                          {'title': 'Finance- Loan lenders', 'icon': Icons.account_balance},
                                          {'title': 'Government approved civil engineers', 'icon': Icons.engineering},
                                          {'title': 'Registered building planners', 'icon': Icons.architecture},
                                        ];

                                        // Filter categories based on search query
                                        final searchQuery = _model.categorySearchTextController?.text.toLowerCase() ?? '';
                                        final filteredCategories = categories.where((category) {
                                          final categoryTitle = (category['title'] as String).toLowerCase();
                                          return searchQuery.isEmpty || categoryTitle.contains(searchQuery);
                                        }).toList();

                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: filteredCategories.isEmpty
                                              ? [
                                                  Padding(
                                                    padding: EdgeInsets.all(24.0),
                                                    child: Text(
                                                      'Oops! No one\'s here yet. Try a different search! ðŸ”',
                                                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                        font: GoogleFonts.inter(),
                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                        letterSpacing: 0.0,
                                                      ),
                                                    ),
                                                  ),
                                                ]
                                              : List.generate(
                                              filteredCategories.length,
                                              (categoryIndex) {
                                            final category = filteredCategories[categoryIndex];
                                            final originalIndex = categories.indexOf(category);
                                            final isSelected = _model.selectedCategoryIndex == originalIndex;
                                            
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor: Colors.transparent,
                                              onTap: () async {
                                                _model.selectedCategoryIndex = originalIndex;
                                                _model.selectedCategoryTitle = category['title'] as String;
                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: isSelected 
                                                      ? Color.fromARGB(
                                                          (0.1 * 255).round(),
                                                          FlutterFlowTheme.of(context).primary.red,
                                                          FlutterFlowTheme.of(context).primary.green,
                                                          FlutterFlowTheme.of(context).primary.blue,
                                                        )
                                                      : FlutterFlowTheme.of(context).optionalColor,
                                                  borderRadius: BorderRadius.circular(12.0),
                                                  border: isSelected 
                                                      ? Border.all(
                                                          color: FlutterFlowTheme.of(context).primary,
                                                          width: 2.0,
                                                        )
                                                      : null,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(14.0),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Container(
                                                        width: 46.0,
                                                        height: 46.0,
                                                        decoration: BoxDecoration(
                                                          color: isSelected
                                                              ? FlutterFlowTheme.of(context).primary
                                                              : FlutterFlowTheme.of(context).primaryBackground,
                                                          borderRadius: BorderRadius.circular(10.0),
                                                        ),
                                                        child: Icon(
                                                          category['icon'] as IconData,
                                                          color: isSelected
                                                              ? FlutterFlowTheme.of(context).info
                                                              : FlutterFlowTheme.of(context).primaryText,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                      SizedBox(width: 12.0),
                                                      Expanded(
                                                        child: Text(
                                                          category['title'] as String,
                                                          style: FlutterFlowTheme.of(context)
                                                              .titleMedium
                                                              .override(
                                                                font: GoogleFonts.inter(
                                                                  fontWeight: FontWeight.w600,
                                                                ),
                                                                fontSize: 15.0,
                                                                letterSpacing: 0.0,
                                                                color: isSelected
                                                                    ? FlutterFlowTheme.of(context).primary
                                                                    : FlutterFlowTheme.of(context).primaryText,
                                                              ),
                                                        ),
                                                      ),
                                                      if (isSelected)
                                                        Icon(
                                                          Icons.check_circle,
                                                          color: FlutterFlowTheme.of(context).primary,
                                                          size: 24.0,
                                                        )
                                                      else
                                                        Icon(
                                                          Icons.radio_button_unchecked,
                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                          size: 24.0,
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          }).divide(SizedBox(height: 12.0)),
                                        );
                                      },
                                    ),
                                  ),
                                ].addToEnd(SizedBox(height: 24.0)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 32.0, 15.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Work Portfolio',
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
                                        fontSize: 32.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontStyle,
                                        lineHeight: 1.0,
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 0.0),
                                  child: Text(
                                    'Showcase your previous work by uploading photos or videos. A strong portfolio can help customers trust your expertise.',
                                    style: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .fontStyle,
                                          lineHeight: 1.5,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 0.0),
                                  child: Wrap(
                                    spacing: 8.0,
                                    runSpacing: 8.0,
                                    alignment: WrapAlignment.start,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    direction: Axis.horizontal,
                                    runAlignment: WrapAlignment.start,
                                    verticalDirection: VerticalDirection.down,
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        width:
                                            (MediaQuery.sizeOf(context).width -
                                                    46) /
                                                3,
                                        height:
                                            (MediaQuery.sizeOf(context).width -
                                                    46) /
                                                3,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .optionalColor,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Builder(
                                          builder: (context) {
                                            if (_model.isDataUploading_field12) {
                                              return Center(
                                                child: CircularProgressIndicator(
                                                  valueColor: AlwaysStoppedAnimation<Color>(
                                                    FlutterFlowTheme.of(context).primary,
                                                  ),
                                                ),
                                              );
                                            } else if (_model.uploadedFileUrl_field12 !=
                                                    '') {
                                              return Stack(
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await Navigator.push(
                                                        context,
                                                        PageTransition(
                                                          type:
                                                              PageTransitionType
                                                                  .fade,
                                                          child:
                                                              FlutterFlowExpandedImageView(
                                                            image:
                                                                Image.network(
                                                              _model
                                                                  .uploadedFileUrl_field12,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                            allowRotation:
                                                                false,
                                                            tag: _model
                                                                .uploadedFileUrl_field12,
                                                            useHeroAnimation:
                                                                true,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Hero(
                                                      tag: _model
                                                          .uploadedFileUrl_field12,
                                                      transitionOnUserGestures:
                                                          true,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        child: Image.network(
                                                          _model
                                                              .uploadedFileUrl_field12,
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          safeSetState(() {
                                                            _model.isDataUploading_field12 =
                                                                false;
                                                            _model.uploadedLocalFile_field12 =
                                                                FFUploadedFile(
                                                                    bytes: Uint8List
                                                                        .fromList(
                                                                            []),
                                                                    originalFilename:
                                                                        '');
                                                            _model.uploadedFileUrl_field12 =
                                                                '';
                                                          });
                                                        },
                                                        child: Container(
                                                          width: 24.0,
                                                          height: 24.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .barrier,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Icon(
                                                            FFIcons.kxClose,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            size: 16.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            } else {
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  final selectedMedia =
                                                      await selectMediaWithSourceBottomSheet(
                                                    context: context,
                                                    imageQuality: 0,
                                                    allowPhoto: true,
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(
                                                              m.storagePath,
                                                              context))) {
                                                    safeSetState(() => _model
                                                            .isDataUploading_field12 =
                                                        true);
                                                    var selectedUploadedFiles =
                                                        <FFUploadedFile>[];

                                                    var downloadUrls =
                                                        <String>[];
                                                    try {
                                                      selectedUploadedFiles =
                                                          selectedMedia
                                                              .map((m) =>
                                                                  FFUploadedFile(
                                                                    name: m
                                                                        .storagePath
                                                                        .split(
                                                                            '/')
                                                                        .last,
                                                                    bytes:
                                                                        m.bytes,
                                                                    height: m
                                                                        .dimensions
                                                                        ?.height,
                                                                    width: m
                                                                        .dimensions
                                                                        ?.width,
                                                                    blurHash: m
                                                                        .blurHash,
                                                                    originalFilename:
                                                                        m.originalFilename,
                                                                  ))
                                                              .toList();

                                                      downloadUrls =
                                                          (await Future.wait(
                                                        selectedMedia.map(
                                                          (m) async =>
                                                              await uploadData(
                                                                  m.storagePath,
                                                                  m.bytes),
                                                        ),
                                                      ))
                                                              .where((u) =>
                                                                  u != null)
                                                              .map((u) => u!)
                                                              .toList();
                                                    } finally {
                                                      _model.isDataUploading_field12 =
                                                          false;
                                                    }
                                                    if (selectedUploadedFiles
                                                                .length ==
                                                            selectedMedia
                                                                .length &&
                                                        downloadUrls.length ==
                                                            selectedMedia
                                                                .length) {
                                                      safeSetState(() {
                                                        _model.uploadedLocalFile_field12 =
                                                            selectedUploadedFiles
                                                                .first;
                                                        _model.uploadedFileUrl_field12 =
                                                            downloadUrls.first;
                                                      });
                                                    } else {
                                                      safeSetState(() {});
                                                      return;
                                                    }
                                                  }
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Icon(
                                                    FFIcons.kimagePlus,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .icons,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                      Container(
                                        width:
                                            (MediaQuery.sizeOf(context).width -
                                                    46) /
                                                3,
                                        height:
                                            (MediaQuery.sizeOf(context).width -
                                                    46) /
                                                3,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .optionalColor,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Builder(
                                          builder: (context) {
                                            if (_model.isDataUploading_field123) {
                                              return Center(
                                                child: CircularProgressIndicator(
                                                  valueColor: AlwaysStoppedAnimation<Color>(
                                                    FlutterFlowTheme.of(context).primary,
                                                  ),
                                                ),
                                              );
                                            } else if (_model.uploadedFileUrl_field123 !=
                                                    '') {
                                              return Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                child: Stack(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      child: Image.network(
                                                        _model
                                                            .uploadedFileUrl_field123,
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            safeSetState(() {
                                                              _model.isDataUploading_field123 =
                                                                  false;
                                                              _model.uploadedLocalFile_field123 =
                                                                  FFUploadedFile(
                                                                      bytes: Uint8List
                                                                          .fromList(
                                                                              []),
                                                                      originalFilename:
                                                                          '');
                                                              _model.uploadedFileUrl_field123 =
                                                                  '';
                                                            });
                                                          },
                                                          child: Container(
                                                            width: 24.0,
                                                            height: 24.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .barrier,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Icon(
                                                              FFIcons.kxClose,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              size: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            } else {
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  final selectedMedia =
                                                      await selectMediaWithSourceBottomSheet(
                                                    context: context,
                                                    allowPhoto: true,
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(
                                                              m.storagePath,
                                                              context))) {
                                                    safeSetState(() => _model
                                                            .isDataUploading_field123 =
                                                        true);
                                                    var selectedUploadedFiles =
                                                        <FFUploadedFile>[];

                                                    var downloadUrls =
                                                        <String>[];
                                                    try {
                                                      selectedUploadedFiles =
                                                          selectedMedia
                                                              .map((m) =>
                                                                  FFUploadedFile(
                                                                    name: m
                                                                        .storagePath
                                                                        .split(
                                                                            '/')
                                                                        .last,
                                                                    bytes:
                                                                        m.bytes,
                                                                    height: m
                                                                        .dimensions
                                                                        ?.height,
                                                                    width: m
                                                                        .dimensions
                                                                        ?.width,
                                                                    blurHash: m
                                                                        .blurHash,
                                                                    originalFilename:
                                                                        m.originalFilename,
                                                                  ))
                                                              .toList();

                                                      downloadUrls =
                                                          (await Future.wait(
                                                        selectedMedia.map(
                                                          (m) async =>
                                                              await uploadData(
                                                                  m.storagePath,
                                                                  m.bytes),
                                                        ),
                                                      ))
                                                              .where((u) =>
                                                                  u != null)
                                                              .map((u) => u!)
                                                              .toList();
                                                    } finally {
                                                      _model.isDataUploading_field123 =
                                                          false;
                                                    }
                                                    if (selectedUploadedFiles
                                                                .length ==
                                                            selectedMedia
                                                                .length &&
                                                        downloadUrls.length ==
                                                            selectedMedia
                                                                .length) {
                                                      safeSetState(() {
                                                        _model.uploadedLocalFile_field123 =
                                                            selectedUploadedFiles
                                                                .first;
                                                        _model.uploadedFileUrl_field123 =
                                                            downloadUrls.first;
                                                      });
                                                    } else {
                                                      safeSetState(() {});
                                                      return;
                                                    }
                                                  }
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Icon(
                                                    FFIcons.kimagePlus,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .icons,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                      Container(
                                        width:
                                            (MediaQuery.sizeOf(context).width -
                                                    46) /
                                                3,
                                        height:
                                            (MediaQuery.sizeOf(context).width -
                                                    46) /
                                                3,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .optionalColor,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Builder(
                                          builder: (context) {
                                            if (_model.isDataUploading_field1234) {
                                              return Center(
                                                child: CircularProgressIndicator(
                                                  valueColor: AlwaysStoppedAnimation<Color>(
                                                    FlutterFlowTheme.of(context).primary,
                                                  ),
                                                ),
                                              );
                                            } else if (_model.uploadedFileUrl_field1234 !=
                                                    '') {
                                              return Container(
                                                width: double.infinity,
                                                height: double.infinity,
                                                child: Stack(
                                                  children: [
                                                    InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            child:
                                                                FlutterFlowExpandedImageView(
                                                              image:
                                                                  Image.network(
                                                                _model
                                                                    .uploadedFileUrl_field1234,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag: _model
                                                                  .uploadedFileUrl_field1234,
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag: _model
                                                            .uploadedFileUrl_field1234,
                                                        transitionOnUserGestures:
                                                            true,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          child: Image.network(
                                                            _model
                                                                .uploadedFileUrl_field1234,
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, -1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    8.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            safeSetState(() {
                                                              _model.isDataUploading_field1234 =
                                                                  false;
                                                              _model.uploadedLocalFile_field1234 =
                                                                  FFUploadedFile(
                                                                      bytes: Uint8List
                                                                          .fromList(
                                                                              []),
                                                                      originalFilename:
                                                                          '');
                                                              _model.uploadedFileUrl_field1234 =
                                                                  '';
                                                            });
                                                          },
                                                          child: Container(
                                                            width: 24.0,
                                                            height: 24.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .barrier,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Icon(
                                                              FFIcons.kxClose,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .info,
                                                              size: 16.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            } else {
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  final selectedMedia =
                                                      await selectMediaWithSourceBottomSheet(
                                                    context: context,
                                                    allowPhoto: true,
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(
                                                              m.storagePath,
                                                              context))) {
                                                    safeSetState(() => _model
                                                            .isDataUploading_field1234 =
                                                        true);
                                                    var selectedUploadedFiles =
                                                        <FFUploadedFile>[];

                                                    var downloadUrls =
                                                        <String>[];
                                                    try {
                                                      selectedUploadedFiles =
                                                          selectedMedia
                                                              .map((m) =>
                                                                  FFUploadedFile(
                                                                    name: m
                                                                        .storagePath
                                                                        .split(
                                                                            '/')
                                                                        .last,
                                                                    bytes:
                                                                        m.bytes,
                                                                    height: m
                                                                        .dimensions
                                                                        ?.height,
                                                                    width: m
                                                                        .dimensions
                                                                        ?.width,
                                                                    blurHash: m
                                                                        .blurHash,
                                                                    originalFilename:
                                                                        m.originalFilename,
                                                                  ))
                                                              .toList();

                                                      downloadUrls =
                                                          (await Future.wait(
                                                        selectedMedia.map(
                                                          (m) async =>
                                                              await uploadData(
                                                                  m.storagePath,
                                                                  m.bytes),
                                                        ),
                                                      ))
                                                              .where((u) =>
                                                                  u != null)
                                                              .map((u) => u!)
                                                              .toList();
                                                    } finally {
                                                      _model.isDataUploading_field1234 =
                                                          false;
                                                    }
                                                    if (selectedUploadedFiles
                                                                .length ==
                                                            selectedMedia
                                                                .length &&
                                                        downloadUrls.length ==
                                                            selectedMedia
                                                                .length) {
                                                      safeSetState(() {
                                                        _model.uploadedLocalFile_field1234 =
                                                            selectedUploadedFiles
                                                                .first;
                                                        _model.uploadedFileUrl_field1234 =
                                                            downloadUrls.first;
                                                      });
                                                    } else {
                                                      safeSetState(() {});
                                                      return;
                                                    }
                                                  }
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Icon(
                                                    FFIcons.kimagePlus,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .icons,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                      Container(
                                        width:
                                            (MediaQuery.sizeOf(context).width -
                                                    46) /
                                                3,
                                        height:
                                            (MediaQuery.sizeOf(context).width -
                                                    46) /
                                                3,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .optionalColor,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Builder(
                                          builder: (context) {
                                            if (_model.isDataUploading_field12345) {
                                              return Center(
                                                child: CircularProgressIndicator(
                                                  valueColor: AlwaysStoppedAnimation<Color>(
                                                    FlutterFlowTheme.of(context).primary,
                                                  ),
                                                ),
                                              );
                                            } else if (_model.uploadedFileUrl_field12345 !=
                                                    '') {
                                              return Stack(
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await Navigator.push(
                                                        context,
                                                        PageTransition(
                                                          type:
                                                              PageTransitionType
                                                                  .fade,
                                                          child:
                                                              FlutterFlowExpandedImageView(
                                                            image:
                                                                Image.network(
                                                              _model
                                                                  .uploadedFileUrl_field12345,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                            allowRotation:
                                                                false,
                                                            tag: _model
                                                                .uploadedFileUrl_field12345,
                                                            useHeroAnimation:
                                                                true,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Hero(
                                                      tag: _model
                                                          .uploadedFileUrl_field12345,
                                                      transitionOnUserGestures:
                                                          true,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        child: Image.network(
                                                          _model
                                                              .uploadedFileUrl_field12345,
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          safeSetState(() {
                                                            _model.isDataUploading_field12345 =
                                                                false;
                                                            _model.uploadedLocalFile_field12345 =
                                                                FFUploadedFile(
                                                                    bytes: Uint8List
                                                                        .fromList(
                                                                            []),
                                                                    originalFilename:
                                                                        '');
                                                            _model.uploadedFileUrl_field12345 =
                                                                '';
                                                          });
                                                        },
                                                        child: Container(
                                                          width: 24.0,
                                                          height: 24.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .barrier,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Icon(
                                                            FFIcons.kxClose,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            size: 16.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            } else {
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  final selectedMedia =
                                                      await selectMediaWithSourceBottomSheet(
                                                    context: context,
                                                    allowPhoto: true,
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(
                                                              m.storagePath,
                                                              context))) {
                                                    safeSetState(() => _model
                                                            .isDataUploading_field12345 =
                                                        true);
                                                    var selectedUploadedFiles =
                                                        <FFUploadedFile>[];

                                                    var downloadUrls =
                                                        <String>[];
                                                    try {
                                                      selectedUploadedFiles =
                                                          selectedMedia
                                                              .map((m) =>
                                                                  FFUploadedFile(
                                                                    name: m
                                                                        .storagePath
                                                                        .split(
                                                                            '/')
                                                                        .last,
                                                                    bytes:
                                                                        m.bytes,
                                                                    height: m
                                                                        .dimensions
                                                                        ?.height,
                                                                    width: m
                                                                        .dimensions
                                                                        ?.width,
                                                                    blurHash: m
                                                                        .blurHash,
                                                                    originalFilename:
                                                                        m.originalFilename,
                                                                  ))
                                                              .toList();

                                                      downloadUrls =
                                                          (await Future.wait(
                                                        selectedMedia.map(
                                                          (m) async =>
                                                              await uploadData(
                                                                  m.storagePath,
                                                                  m.bytes),
                                                        ),
                                                      ))
                                                              .where((u) =>
                                                                  u != null)
                                                              .map((u) => u!)
                                                              .toList();
                                                    } finally {
                                                      _model.isDataUploading_field12345 =
                                                          false;
                                                    }
                                                    if (selectedUploadedFiles
                                                                .length ==
                                                            selectedMedia
                                                                .length &&
                                                        downloadUrls.length ==
                                                            selectedMedia
                                                                .length) {
                                                      safeSetState(() {
                                                        _model.uploadedLocalFile_field12345 =
                                                            selectedUploadedFiles
                                                                .first;
                                                        _model.uploadedFileUrl_field12345 =
                                                            downloadUrls.first;
                                                      });
                                                    } else {
                                                      safeSetState(() {});
                                                      return;
                                                    }
                                                  }
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Icon(
                                                    FFIcons.kimagePlus,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .icons,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                      Container(
                                        width:
                                            (MediaQuery.sizeOf(context).width -
                                                    46) /
                                                3,
                                        height:
                                            (MediaQuery.sizeOf(context).width -
                                                    46) /
                                                3,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .optionalColor,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Builder(
                                          builder: (context) {
                                            if (_model.isDataUploading_field123456) {
                                              return Center(
                                                child: CircularProgressIndicator(
                                                  valueColor: AlwaysStoppedAnimation<Color>(
                                                    FlutterFlowTheme.of(context).primary,
                                                  ),
                                                ),
                                              );
                                            } else if (_model.uploadedFileUrl_field123456 !=
                                                    '') {
                                              return Stack(
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await Navigator.push(
                                                        context,
                                                        PageTransition(
                                                          type:
                                                              PageTransitionType
                                                                  .fade,
                                                          child:
                                                              FlutterFlowExpandedImageView(
                                                            image:
                                                                Image.network(
                                                              _model
                                                                  .uploadedFileUrl_field123456,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                            allowRotation:
                                                                false,
                                                            tag: _model
                                                                .uploadedFileUrl_field123456,
                                                            useHeroAnimation:
                                                                true,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Hero(
                                                      tag: _model
                                                          .uploadedFileUrl_field123456,
                                                      transitionOnUserGestures:
                                                          true,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        child: Image.network(
                                                          _model
                                                              .uploadedFileUrl_field123456,
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          safeSetState(() {
                                                            _model.isDataUploading_field123456 =
                                                                false;
                                                            _model.uploadedLocalFile_field123456 =
                                                                FFUploadedFile(
                                                                    bytes: Uint8List
                                                                        .fromList(
                                                                            []),
                                                                    originalFilename:
                                                                        '');
                                                            _model.uploadedFileUrl_field123456 =
                                                                '';
                                                          });
                                                        },
                                                        child: Container(
                                                          width: 24.0,
                                                          height: 24.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .barrier,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Icon(
                                                            FFIcons.kxClose,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            size: 16.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            } else {
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  final selectedMedia =
                                                      await selectMediaWithSourceBottomSheet(
                                                    context: context,
                                                    allowPhoto: true,
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(
                                                              m.storagePath,
                                                              context))) {
                                                    safeSetState(() => _model
                                                            .isDataUploading_field123456 =
                                                        true);
                                                    var selectedUploadedFiles =
                                                        <FFUploadedFile>[];

                                                    var downloadUrls =
                                                        <String>[];
                                                    try {
                                                      selectedUploadedFiles =
                                                          selectedMedia
                                                              .map((m) =>
                                                                  FFUploadedFile(
                                                                    name: m
                                                                        .storagePath
                                                                        .split(
                                                                            '/')
                                                                        .last,
                                                                    bytes:
                                                                        m.bytes,
                                                                    height: m
                                                                        .dimensions
                                                                        ?.height,
                                                                    width: m
                                                                        .dimensions
                                                                        ?.width,
                                                                    blurHash: m
                                                                        .blurHash,
                                                                    originalFilename:
                                                                        m.originalFilename,
                                                                  ))
                                                              .toList();

                                                      downloadUrls =
                                                          (await Future.wait(
                                                        selectedMedia.map(
                                                          (m) async =>
                                                              await uploadData(
                                                                  m.storagePath,
                                                                  m.bytes),
                                                        ),
                                                      ))
                                                              .where((u) =>
                                                                  u != null)
                                                              .map((u) => u!)
                                                              .toList();
                                                    } finally {
                                                      _model.isDataUploading_field123456 =
                                                          false;
                                                    }
                                                    if (selectedUploadedFiles
                                                                .length ==
                                                            selectedMedia
                                                                .length &&
                                                        downloadUrls.length ==
                                                            selectedMedia
                                                                .length) {
                                                      safeSetState(() {
                                                        _model.uploadedLocalFile_field123456 =
                                                            selectedUploadedFiles
                                                                .first;
                                                        _model.uploadedFileUrl_field123456 =
                                                            downloadUrls.first;
                                                      });
                                                    } else {
                                                      safeSetState(() {});
                                                      return;
                                                    }
                                                  }
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Icon(
                                                    FFIcons.kimagePlus,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .icons,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                      Container(
                                        width:
                                            (MediaQuery.sizeOf(context).width -
                                                    46) /
                                                3,
                                        height:
                                            (MediaQuery.sizeOf(context).width -
                                                    46) /
                                                3,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .optionalColor,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Builder(
                                          builder: (context) {
                                            if (_model.isDataUploading_field1234567) {
                                              return Center(
                                                child: CircularProgressIndicator(
                                                  valueColor: AlwaysStoppedAnimation<Color>(
                                                    FlutterFlowTheme.of(context).primary,
                                                  ),
                                                ),
                                              );
                                            } else if (_model.uploadedFileUrl_field1234567 !=
                                                    '') {
                                              return Stack(
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      await Navigator.push(
                                                        context,
                                                        PageTransition(
                                                          type:
                                                              PageTransitionType
                                                                  .fade,
                                                          child:
                                                              FlutterFlowExpandedImageView(
                                                            image:
                                                                Image.network(
                                                              _model
                                                                  .uploadedFileUrl_field1234567,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                            allowRotation:
                                                                false,
                                                            tag: _model
                                                                .uploadedFileUrl_field1234567,
                                                            useHeroAnimation:
                                                                true,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Hero(
                                                      tag: _model
                                                          .uploadedFileUrl_field1234567,
                                                      transitionOnUserGestures:
                                                          true,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        child: Image.network(
                                                          _model
                                                              .uploadedFileUrl_field1234567,
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, -1.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          safeSetState(() {
                                                            _model.isDataUploading_field1234567 =
                                                                false;
                                                            _model.uploadedLocalFile_field1234567 =
                                                                FFUploadedFile(
                                                                    bytes: Uint8List
                                                                        .fromList(
                                                                            []),
                                                                    originalFilename:
                                                                        '');
                                                            _model.uploadedFileUrl_field1234567 =
                                                                '';
                                                          });
                                                        },
                                                        child: Container(
                                                          width: 24.0,
                                                          height: 24.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .barrier,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Icon(
                                                            FFIcons.kxClose,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .info,
                                                            size: 16.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            } else {
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  final selectedMedia =
                                                      await selectMediaWithSourceBottomSheet(
                                                    context: context,
                                                    allowPhoto: true,
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(
                                                              m.storagePath,
                                                              context))) {
                                                    safeSetState(() => _model
                                                            .isDataUploading_field1234567 =
                                                        true);
                                                    var selectedUploadedFiles =
                                                        <FFUploadedFile>[];

                                                    var downloadUrls =
                                                        <String>[];
                                                    try {
                                                      selectedUploadedFiles =
                                                          selectedMedia
                                                              .map((m) =>
                                                                  FFUploadedFile(
                                                                    name: m
                                                                        .storagePath
                                                                        .split(
                                                                            '/')
                                                                        .last,
                                                                    bytes:
                                                                        m.bytes,
                                                                    height: m
                                                                        .dimensions
                                                                        ?.height,
                                                                    width: m
                                                                        .dimensions
                                                                        ?.width,
                                                                    blurHash: m
                                                                        .blurHash,
                                                                    originalFilename:
                                                                        m.originalFilename,
                                                                  ))
                                                              .toList();

                                                      downloadUrls =
                                                          (await Future.wait(
                                                        selectedMedia.map(
                                                          (m) async =>
                                                              await uploadData(
                                                                  m.storagePath,
                                                                  m.bytes),
                                                        ),
                                                      ))
                                                              .where((u) =>
                                                                  u != null)
                                                              .map((u) => u!)
                                                              .toList();
                                                    } finally {
                                                      _model.isDataUploading_field1234567 =
                                                          false;
                                                    }
                                                    if (selectedUploadedFiles
                                                                .length ==
                                                            selectedMedia
                                                                .length &&
                                                        downloadUrls.length ==
                                                            selectedMedia
                                                                .length) {
                                                      safeSetState(() {
                                                        _model.uploadedLocalFile_field1234567 =
                                                            selectedUploadedFiles
                                                                .first;
                                                        _model.uploadedFileUrl_field1234567 =
                                                            downloadUrls.first;
                                                      });
                                                    } else {
                                                      safeSetState(() {});
                                                      return;
                                                    }
                                                  }
                                                },
                                                child: Container(
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Icon(
                                                    FFIcons.kimagePlus,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .icons,
                                                    size: 24.0,
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ].addToEnd(SizedBox(height: 15.0)),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: smooth_page_indicator.SmoothPageIndicator(
                          controller: _model.pageViewController ??=
                              PageController(initialPage: 0),
                          count: 3,
                          axisDirection: Axis.horizontal,
                          onDotClicked: (i) async {
                            await _model.pageViewController!.animateToPage(
                              i,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                            safeSetState(() {});
                          },
                          effect: smooth_page_indicator.SlideEffect(
                            spacing: 8.0,
                            radius: 8.0,
                            dotWidth:
                                (MediaQuery.sizeOf(context).width - 70) / 5,
                            dotHeight: 6.0,
                            dotColor: FlutterFlowTheme.of(context).accent1,
                            activeDotColor:
                                FlutterFlowTheme.of(context).primary,
                            paintStyle: PaintingStyle.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).optionalColor2,
              ),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (_model.pageViewCurrentIndex > 0)
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            if (_model.pageViewCurrentIndex != 0) {
                              await _model.pageViewController?.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                            }
                          },
                          text: 'Cancel',
                          options: FFButtonOptions(
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).optionalColor,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          showLoadingIndicator: false,
                        ),
                      ),
                    Expanded(
                      child: Builder(
                        builder: (context) => FFButtonWidget(
                          onPressed: () async {
                            if (_model.pageViewCurrentIndex == 0) {
                              if (_model.formKey.currentState == null ||
                                  !_model.formKey.currentState!.validate()) {
                                return;
                              }
                              if (_model.uploadedFileUrl_coverPhoto != '') {
                                await _model.pageViewController?.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              } else {
                                await showDialog(
                                  barrierColor:
                                      FlutterFlowTheme.of(context).transparent,
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 1.0)
                                          .resolve(Directionality.of(context)),
                                      child: GestureDetector(
                                        onTap: () {
                                          FocusScope.of(dialogContext)
                                              .unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: ZErrorTextWidget(
                                          errorMessage:
                                              'Please upload a valid image (PNG, JPG, JPEG, SVG, max 5MB).',
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                            } else if (_model.pageViewCurrentIndex == 1) {
                              if (_model.selectedCategoryIndex != null) {
                                await _model.pageViewController?.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              } else {
                                await showDialog(
                                  barrierColor:
                                      FlutterFlowTheme.of(context).transparent,
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 1.0)
                                          .resolve(Directionality.of(context)),
                                      child: GestureDetector(
                                        onTap: () {
                                          FocusScope.of(dialogContext)
                                              .unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: ZErrorTextWidget(
                                          errorMessage:
                                              'Please select a work category to continue.',
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                            } else {
                              // Step 3 - Final submission - validate portfolio images
                              final hasAtLeastOneImage = [
                                _model.uploadedFileUrl_field12,
                                _model.uploadedFileUrl_field123,
                                _model.uploadedFileUrl_field1234,
                                _model.uploadedFileUrl_field12345,
                                _model.uploadedFileUrl_field123456,
                                _model.uploadedFileUrl_field1234567,
                              ].any((url) => url.isNotEmpty);

                              if (!hasAtLeastOneImage) {
                                await showDialog(
                                  barrierColor: FlutterFlowTheme.of(context).transparent,
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 1.0)
                                          .resolve(Directionality.of(context)),
                                      child: GestureDetector(
                                        onTap: () {
                                          FocusScope.of(dialogContext).unfocus();
                                          FocusManager.instance.primaryFocus?.unfocus();
                                        },
                                        child: ZErrorTextWidget(
                                          errorMessage:
                                              'Please upload at least one portfolio image to showcase your work! ðŸ“¸',
                                        ),
                                      ),
                                    );
                                  },
                                );
                                return;
                              }

                              FFAppState().updateServiceAddressStruct(
                                (e) => e
                                  ..addressLine =
                                      _model.addressLineTextController?.text ?? ''
                                  ..type = _model.locationType
                                  ..zipCode = _model.zipCodeTextController?.text ?? ''
                                  ..serviceRadius = _model.locationType == 1
                                      ? _model.serviceRadius
                                      : 0
                                  ..country = _model.countryTextController?.text ?? '',
                              );
                              FFAppState().serviceHeadline =
                                  _model.titleTextController?.text ?? '';
                              FFAppState().serviceDescription =
                                  _model.descriptionTextController?.text ?? '';
                              FFAppState().serviceCover =
                                  _model.uploadedFileUrl_coverPhoto;
                              FFAppState().servicePortfolio = functions
                                  .imageList(
                                      _model.uploadedFileUrl_field12,
                                      _model.uploadedFileUrl_field123,
                                      _model.uploadedFileUrl_field1234,
                                      _model.uploadedFileUrl_field12345,
                                      _model.uploadedFileUrl_field123456,
                                      _model.uploadedFileUrl_field1234567)
                                  ?.cast<String>() ?? [];
                              FFAppState().serviceHourlyRate =
                                  (_model.floorPrice ?? 5).toDouble();
                              safeSetState(() {});

                              context.pushNamed(
                                PaymentSetupWidget.routeName,
                                queryParameters: {
                                  'serviceCategory': serializeParam(
                                    _model.selectedCategoryTitle,
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            }
                          },
                          text: 'Next',
                          options: FFButtonOptions(
                            height: 50.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).info,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          showLoadingIndicator:
                              _model.pageViewCurrentIndex == 2 ? true : false,
                        ),
                      ),
                    ),
                  ].divide(SizedBox(width: 12.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


