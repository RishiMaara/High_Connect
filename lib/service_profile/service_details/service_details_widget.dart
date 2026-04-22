import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/home/components/z_home_page_address/z_home_page_address_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'service_details_model.dart';
export 'service_details_model.dart';

class ServiceDetailsWidget extends StatefulWidget {
  const ServiceDetailsWidget({
    super.key,
    this.serviceDoc,
  });

  final ServicesRecord? serviceDoc;

  static String routeName = 'ServiceDetails';
  static String routePath = '/serviceDetails';

  @override
  State<ServiceDetailsWidget> createState() => _ServiceDetailsWidgetState();
}

class _ServiceDetailsWidgetState extends State<ServiceDetailsWidget> {
  late ServiceDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ServiceDetailsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget.serviceDoc != null && widget.serviceDoc?.gallery != null) {
        _model.serviceImages =
            widget.serviceDoc!.gallery.toList().cast<String>();
      } else {
        _model.serviceImages = [];
      }
      _model.floorPrice = widget.serviceDoc?.pricePerHour;
      safeSetState(() {});
    });

    _model.titleTextController ??=
        TextEditingController(text: widget.serviceDoc?.title);
    _model.titleFocusNode ??= FocusNode();

    _model.descriptionTextController ??=
        TextEditingController(text: widget.serviceDoc?.description);
    _model.descriptionFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).optionalColor2,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).optionalColor2,
          automaticallyImplyLeading: false,
          leading: Align(
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
                context.pop();
              },
            ),
          ),
          title: Text(
            'Service Details',
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  font: GoogleFonts.inter(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                  ),
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineSmall.fontStyle,
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
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15.0, 24.0, 15.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: wrapWithModel(
                                model: _model.zHomePageAddressModel,
                                updateCallback: () => safeSetState(() {}),
                                child: ZHomePageAddressWidget(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15.0, 24.0, 15.0, 0.0),
                        child: Text(
                          'Title',
                          style:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 10.0, 15.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.titleTextController,
                            focusNode: _model.titleFocusNode,
                            autofocus: false,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: false,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                    lineHeight: 1.5,
                                  ),
                              hintText: 'Add a service title',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                    lineHeight: 1.0,
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
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              fillColor:
                                  FlutterFlowTheme.of(context).optionalColor,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 15.0, 0.0),
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontStyle,
                                      lineHeight: 1.5,
                                    ),
                            maxLines: null,
                            maxLength: 60,
                            buildCounter: (context,
                                    {required currentLength,
                                    required isFocused,
                                    maxLength}) =>
                                null,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.titleTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 15.0, 15.0, 0.0),
                        child: Text(
                          'Description',
                          style:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 10.0, 15.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.descriptionTextController,
                            focusNode: _model.descriptionFocusNode,
                            autofocus: false,
                            textInputAction: TextInputAction.next,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: false,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                    lineHeight: 1.5,
                                  ),
                              hintText: 'Add a service description',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .fontStyle,
                                    lineHeight: 1.5,
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
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              filled: true,
                              fillColor:
                                  FlutterFlowTheme.of(context).optionalColor,
                              contentPadding: EdgeInsets.all(15.0),
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .fontStyle,
                                      ),
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
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
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.descriptionTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 15.0, 15.0, 0.0),
                        child: Text(
                          'Service Cover Photo',
                          style:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 10.0, 15.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).optionalColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Container(
                              width: double.infinity,
                              height: 220.0,
                              child: Stack(
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          child: FlutterFlowExpandedImageView(
                                            image: Image.network(
                                              _model.uploadedFileUrl_uploadDataRd0 !=
                                                          ''
                                                  ? _model
                                                      .uploadedFileUrl_uploadDataRd0
                                                  : widget.serviceDoc!.image,
                                              fit: BoxFit.contain,
                                            ),
                                            allowRotation: false,
                                            tag: _model.uploadedFileUrl_uploadDataRd0 !=
                                                        ''
                                                ? _model
                                                    .uploadedFileUrl_uploadDataRd0
                                                : widget.serviceDoc!.image,
                                            useHeroAnimation: true,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Hero(
                                      tag: _model.uploadedFileUrl_uploadDataRd0 !=
                                                  ''
                                          ? _model.uploadedFileUrl_uploadDataRd0
                                          : widget.serviceDoc!.image,
                                      transitionOnUserGestures: true,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.network(
                                          _model.uploadedFileUrl_uploadDataRd0 !=
                                                      ''
                                              ? _model
                                                  .uploadedFileUrl_uploadDataRd0
                                              : widget.serviceDoc!.image,
                                          width: double.infinity,
                                          height: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(1.0, 1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 15.0, 15.0),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 22.0,
                                        buttonSize: 44.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .barrier,
                                        icon: Icon(
                                          FFIcons.kcamera01,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          size: 22.0,
                                        ),
                                        onPressed: () async {
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
                                                    .isDataUploading_uploadDataRd0 =
                                                true);
                                            var selectedUploadedFiles =
                                                <FFUploadedFile>[];

                                            var downloadUrls = <String>[];
                                            try {
                                              selectedUploadedFiles =
                                                  selectedMedia
                                                      .map(
                                                          (m) => FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
                                                                originalFilename:
                                                                    m.originalFilename,
                                                              ))
                                                      .toList();

                                              downloadUrls = (await Future.wait(
                                                selectedMedia.map(
                                                  (m) async => await uploadData(
                                                      m.storagePath, m.bytes),
                                                ),
                                              ))
                                                  .where((u) => u != null)
                                                  .map((u) => u!)
                                                  .toList();
                                            } finally {
                                              _model.isDataUploading_uploadDataRd0 =
                                                  false;
                                            }
                                            if (selectedUploadedFiles.length ==
                                                    selectedMedia.length &&
                                                downloadUrls.length ==
                                                    selectedMedia.length) {
                                              safeSetState(() {
                                                _model.uploadedLocalFile_uploadDataRd0 =
                                                    selectedUploadedFiles.first;
                                                _model.uploadedFileUrl_uploadDataRd0 =
                                                    downloadUrls.first;
                                              });
                                            } else {
                                              safeSetState(() {});
                                              return;
                                            }
                                          }
                                        },
                                      ),
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
                          'Work Portfolio',
                          style:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 10.0, 15.0, 0.0),
                        child: Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.start,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width:
                                  (MediaQuery.sizeOf(context).width - 46) / 3,
                              height:
                                  (MediaQuery.sizeOf(context).width - 46) / 3,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).optionalColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Builder(
                                builder: (context) {
                                  if (_model.serviceImages.contains(widget
                                          .serviceDoc?.gallery
                                          .elementAtOrNull(0)) ||
                                      (_model.uploadedFileUrl_image11 !=
                                              '')) {
                                    return Stack(
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                child:
                                                    FlutterFlowExpandedImageView(
                                                  image: Image.network(
                                                    _model.serviceImages
                                                            .contains(widget
                                                                .serviceDoc
                                                                ?.gallery
                                                                .firstOrNull)
                                                        ? _model.serviceImages
                                                            .elementAtOrNull(0)!
                                                        : _model
                                                            .uploadedFileUrl_image11,
                                                    fit: BoxFit.contain,
                                                  ),
                                                  allowRotation: false,
                                                  tag: _model.serviceImages
                                                          .contains(widget
                                                              .serviceDoc
                                                              ?.gallery
                                                              .firstOrNull)
                                                      ? _model.serviceImages
                                                          .elementAtOrNull(0)!
                                                      : _model
                                                          .uploadedFileUrl_image11,
                                                  useHeroAnimation: true,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Hero(
                                            tag: _model.serviceImages.contains(
                                                    widget.serviceDoc?.gallery
                                                        .firstOrNull)
                                                ? _model.serviceImages
                                                    .elementAtOrNull(0)!
                                                : _model
                                                    .uploadedFileUrl_image11,
                                            transitionOnUserGestures: true,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Image.network(
                                                _model.serviceImages.contains(
                                                        widget
                                                            .serviceDoc
                                                            ?.gallery
                                                            .firstOrNull)
                                                    ? _model.serviceImages
                                                        .elementAtOrNull(0)!
                                                    : _model
                                                        .uploadedFileUrl_image11,
                                                width: double.infinity,
                                                height: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 8.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (_model.serviceImages
                                                    .contains(widget
                                                        .serviceDoc
                                                        ?.gallery
                                                        .firstOrNull)) {
                                                  _model
                                                      .removeFromServiceImages(
                                                          widget.serviceDoc!
                                                              .gallery
                                                              .elementAtOrNull(
                                                                  0)!);
                                                  safeSetState(() {});
                                                } else {
                                                  safeSetState(() {
                                                    _model.isDataUploading_image11 =
                                                        false;
                                                    _model.uploadedLocalFile_image11 =
                                                        FFUploadedFile(
                                                            bytes: Uint8List
                                                                .fromList([]),
                                                            originalFilename:
                                                                '');
                                                    _model.uploadedFileUrl_image11 =
                                                        '';
                                                  });
                                                }
                                              },
                                              child: Container(
                                                width: 24.0,
                                                height: 24.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .barrier,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(
                                                  FFIcons.kxClose,
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        final selectedMedia =
                                            await selectMediaWithSourceBottomSheet(
                                          context: context,
                                          allowPhoto: true,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          safeSetState(() => _model
                                              .isDataUploading_image11 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          var downloadUrls = <String>[];
                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                          originalFilename: m
                                                              .originalFilename,
                                                        ))
                                                    .toList();

                                            downloadUrls = (await Future.wait(
                                              selectedMedia.map(
                                                (m) async => await uploadData(
                                                    m.storagePath, m.bytes),
                                              ),
                                            ))
                                                .where((u) => u != null)
                                                .map((u) => u!)
                                                .toList();
                                          } finally {
                                            _model.isDataUploading_image11 =
                                                false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedMedia.length &&
                                              downloadUrls.length ==
                                                  selectedMedia.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile_image11 =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl_image11 =
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
                                              BorderRadius.circular(10.0),
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Icon(
                                          FFIcons.kcamera,
                                          color: FlutterFlowTheme.of(context)
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
                                  (MediaQuery.sizeOf(context).width - 46) / 3,
                              height:
                                  (MediaQuery.sizeOf(context).width - 46) / 3,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).optionalColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Builder(
                                builder: (context) {
                                  if (_model.serviceImages.contains(widget
                                          .serviceDoc?.gallery
                                          .elementAtOrNull(1)) ||
                                      (_model.uploadedFileUrl_image12 !=
                                              '')) {
                                    return Stack(
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                child:
                                                    FlutterFlowExpandedImageView(
                                                  image: Image.network(
                                                    _model.serviceImages
                                                            .contains(widget
                                                                .serviceDoc
                                                                ?.gallery
                                                                .elementAtOrNull(
                                                                    1))
                                                        ? _model.serviceImages
                                                            .elementAtOrNull(1)!
                                                        : _model
                                                            .uploadedFileUrl_image12,
                                                    fit: BoxFit.contain,
                                                  ),
                                                  allowRotation: false,
                                                  tag: _model.serviceImages
                                                          .contains(widget
                                                              .serviceDoc
                                                              ?.gallery
                                                              .elementAtOrNull(
                                                                  1))
                                                      ? _model.serviceImages
                                                          .elementAtOrNull(1)!
                                                      : _model
                                                          .uploadedFileUrl_image12,
                                                  useHeroAnimation: true,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Hero(
                                            tag: _model.serviceImages.contains(
                                                    widget.serviceDoc?.gallery
                                                        .elementAtOrNull(1))
                                                ? _model.serviceImages
                                                    .elementAtOrNull(1)!
                                                : _model
                                                    .uploadedFileUrl_image12,
                                            transitionOnUserGestures: true,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Image.network(
                                                _model.serviceImages.contains(
                                                        widget
                                                            .serviceDoc?.gallery
                                                            .elementAtOrNull(
                                                                1))
                                                    ? _model.serviceImages
                                                        .elementAtOrNull(1)!
                                                    : _model
                                                        .uploadedFileUrl_image12,
                                                width: double.infinity,
                                                height: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 8.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (_model.serviceImages
                                                    .contains(widget
                                                        .serviceDoc?.gallery
                                                        .elementAtOrNull(1))) {
                                                  _model
                                                      .removeFromServiceImages(
                                                          widget.serviceDoc!
                                                              .gallery
                                                              .elementAtOrNull(
                                                                  1)!);
                                                  safeSetState(() {});
                                                } else {
                                                  safeSetState(() {
                                                    _model.isDataUploading_image12 =
                                                        false;
                                                    _model.uploadedLocalFile_image12 =
                                                        FFUploadedFile(
                                                            bytes: Uint8List
                                                                .fromList([]),
                                                            originalFilename:
                                                                '');
                                                    _model.uploadedFileUrl_image12 =
                                                        '';
                                                  });
                                                }
                                              },
                                              child: Container(
                                                width: 24.0,
                                                height: 24.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .barrier,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(
                                                  FFIcons.kxClose,
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        final selectedMedia =
                                            await selectMediaWithSourceBottomSheet(
                                          context: context,
                                          allowPhoto: true,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          safeSetState(() => _model
                                              .isDataUploading_image12 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          var downloadUrls = <String>[];
                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                          originalFilename: m
                                                              .originalFilename,
                                                        ))
                                                    .toList();

                                            downloadUrls = (await Future.wait(
                                              selectedMedia.map(
                                                (m) async => await uploadData(
                                                    m.storagePath, m.bytes),
                                              ),
                                            ))
                                                .where((u) => u != null)
                                                .map((u) => u!)
                                                .toList();
                                          } finally {
                                            _model.isDataUploading_image12 =
                                                false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedMedia.length &&
                                              downloadUrls.length ==
                                                  selectedMedia.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile_image12 =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl_image12 =
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
                                              BorderRadius.circular(10.0),
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Icon(
                                          FFIcons.kcamera,
                                          color: FlutterFlowTheme.of(context)
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
                                  (MediaQuery.sizeOf(context).width - 46) / 3,
                              height:
                                  (MediaQuery.sizeOf(context).width - 46) / 3,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).optionalColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Builder(
                                builder: (context) {
                                  if (_model.serviceImages.contains(widget
                                          .serviceDoc?.gallery
                                          .elementAtOrNull(2)) ||
                                      (_model.uploadedFileUrl_image13 !=
                                              '')) {
                                    return Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: Stack(
                                        children: [
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await Navigator.push(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType.fade,
                                                  child:
                                                      FlutterFlowExpandedImageView(
                                                    image: Image.network(
                                                      _model.serviceImages
                                                              .contains(widget
                                                                  .serviceDoc
                                                                  ?.gallery
                                                                  .elementAtOrNull(
                                                                      2))
                                                          ? _model.serviceImages
                                                              .elementAtOrNull(
                                                                  2)!
                                                          : _model
                                                              .uploadedFileUrl_image13,
                                                      fit: BoxFit.contain,
                                                    ),
                                                    allowRotation: false,
                                                    tag: _model.serviceImages
                                                            .contains(widget
                                                                .serviceDoc
                                                                ?.gallery
                                                                .elementAtOrNull(
                                                                    2))
                                                        ? _model.serviceImages
                                                            .elementAtOrNull(2)!
                                                        : _model
                                                            .uploadedFileUrl_image13,
                                                    useHeroAnimation: true,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Hero(
                                              tag: _model.serviceImages
                                                      .contains(widget
                                                          .serviceDoc?.gallery
                                                          .elementAtOrNull(2))
                                                  ? _model.serviceImages
                                                      .elementAtOrNull(2)!
                                                  : _model
                                                      .uploadedFileUrl_image13,
                                              transitionOnUserGestures: true,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                child: Image.network(
                                                  _model.serviceImages.contains(
                                                          widget.serviceDoc
                                                              ?.gallery
                                                              .elementAtOrNull(
                                                                  2))
                                                      ? _model.serviceImages
                                                          .elementAtOrNull(2)!
                                                      : _model
                                                          .uploadedFileUrl_image13,
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 8.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if (_model.serviceImages
                                                      .contains(widget
                                                          .serviceDoc?.gallery
                                                          .elementAtOrNull(
                                                              2))) {
                                                    _model
                                                        .removeFromServiceImages(
                                                            widget.serviceDoc!
                                                                .gallery
                                                                .elementAtOrNull(
                                                                    2)!);
                                                    safeSetState(() {});
                                                  } else {
                                                    safeSetState(() {
                                                      _model.isDataUploading_image13 =
                                                          false;
                                                      _model.uploadedLocalFile_image13 =
                                                          FFUploadedFile(
                                                              bytes: Uint8List
                                                                  .fromList([]),
                                                              originalFilename:
                                                                  '');
                                                      _model.uploadedFileUrl_image13 =
                                                          '';
                                                    });
                                                  }
                                                },
                                                child: Container(
                                                  width: 24.0,
                                                  height: 24.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .barrier,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Icon(
                                                    FFIcons.kxClose,
                                                    color: FlutterFlowTheme.of(
                                                            context)
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
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        final selectedMedia =
                                            await selectMediaWithSourceBottomSheet(
                                          context: context,
                                          allowPhoto: true,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          safeSetState(() => _model
                                              .isDataUploading_image13 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          var downloadUrls = <String>[];
                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                          originalFilename: m
                                                              .originalFilename,
                                                        ))
                                                    .toList();

                                            downloadUrls = (await Future.wait(
                                              selectedMedia.map(
                                                (m) async => await uploadData(
                                                    m.storagePath, m.bytes),
                                              ),
                                            ))
                                                .where((u) => u != null)
                                                .map((u) => u!)
                                                .toList();
                                          } finally {
                                            _model.isDataUploading_image13 =
                                                false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedMedia.length &&
                                              downloadUrls.length ==
                                                  selectedMedia.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile_image13 =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl_image13 =
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
                                              BorderRadius.circular(10.0),
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Icon(
                                          FFIcons.kcamera,
                                          color: FlutterFlowTheme.of(context)
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
                                  (MediaQuery.sizeOf(context).width - 46) / 3,
                              height:
                                  (MediaQuery.sizeOf(context).width - 46) / 3,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).optionalColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Builder(
                                builder: (context) {
                                  if (_model.serviceImages.contains(widget
                                          .serviceDoc?.gallery
                                          .elementAtOrNull(3)) ||
                                      (_model.uploadedFileUrl_image14 !=
                                              '')) {
                                    return Stack(
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                child:
                                                    FlutterFlowExpandedImageView(
                                                  image: Image.network(
                                                    _model.serviceImages
                                                            .contains(widget
                                                                .serviceDoc
                                                                ?.gallery
                                                                .elementAtOrNull(
                                                                    3))
                                                        ? _model.serviceImages
                                                            .elementAtOrNull(3)!
                                                        : _model
                                                            .uploadedFileUrl_image14,
                                                    fit: BoxFit.contain,
                                                  ),
                                                  allowRotation: false,
                                                  tag: _model.serviceImages
                                                          .contains(widget
                                                              .serviceDoc
                                                              ?.gallery
                                                              .elementAtOrNull(
                                                                  3))
                                                      ? _model.serviceImages
                                                          .elementAtOrNull(3)!
                                                      : _model
                                                          .uploadedFileUrl_image14,
                                                  useHeroAnimation: true,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Hero(
                                            tag: _model.serviceImages.contains(
                                                    widget.serviceDoc?.gallery
                                                        .elementAtOrNull(3))
                                                ? _model.serviceImages
                                                    .elementAtOrNull(3)!
                                                : _model
                                                    .uploadedFileUrl_image14,
                                            transitionOnUserGestures: true,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Image.network(
                                                _model.serviceImages.contains(
                                                        widget
                                                            .serviceDoc?.gallery
                                                            .elementAtOrNull(
                                                                3))
                                                    ? _model.serviceImages
                                                        .elementAtOrNull(3)!
                                                    : _model
                                                        .uploadedFileUrl_image14,
                                                width: double.infinity,
                                                height: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 8.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (_model.serviceImages
                                                    .contains(widget
                                                        .serviceDoc?.gallery
                                                        .elementAtOrNull(3))) {
                                                  _model
                                                      .removeFromServiceImages(
                                                          widget.serviceDoc!
                                                              .gallery
                                                              .elementAtOrNull(
                                                                  3)!);
                                                  safeSetState(() {});
                                                } else {
                                                  safeSetState(() {
                                                    _model.isDataUploading_image14 =
                                                        false;
                                                    _model.uploadedLocalFile_image14 =
                                                        FFUploadedFile(
                                                            bytes: Uint8List
                                                                .fromList([]),
                                                            originalFilename:
                                                                '');
                                                    _model.uploadedFileUrl_image14 =
                                                        '';
                                                  });
                                                }
                                              },
                                              child: Container(
                                                width: 24.0,
                                                height: 24.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .barrier,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(
                                                  FFIcons.kxClose,
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        final selectedMedia =
                                            await selectMediaWithSourceBottomSheet(
                                          context: context,
                                          allowPhoto: true,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          safeSetState(() => _model
                                              .isDataUploading_image14 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          var downloadUrls = <String>[];
                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                          originalFilename: m
                                                              .originalFilename,
                                                        ))
                                                    .toList();

                                            downloadUrls = (await Future.wait(
                                              selectedMedia.map(
                                                (m) async => await uploadData(
                                                    m.storagePath, m.bytes),
                                              ),
                                            ))
                                                .where((u) => u != null)
                                                .map((u) => u!)
                                                .toList();
                                          } finally {
                                            _model.isDataUploading_image14 =
                                                false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedMedia.length &&
                                              downloadUrls.length ==
                                                  selectedMedia.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile_image14 =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl_image14 =
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
                                              BorderRadius.circular(10.0),
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Icon(
                                          FFIcons.kcamera,
                                          color: FlutterFlowTheme.of(context)
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
                                  (MediaQuery.sizeOf(context).width - 46) / 3,
                              height:
                                  (MediaQuery.sizeOf(context).width - 46) / 3,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).optionalColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Builder(
                                builder: (context) {
                                  if (_model.serviceImages.contains(widget
                                          .serviceDoc?.gallery
                                          .elementAtOrNull(4)) ||
                                      (_model.uploadedFileUrl_image15 !=
                                              '')) {
                                    return Stack(
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                child:
                                                    FlutterFlowExpandedImageView(
                                                  image: Image.network(
                                                    _model.serviceImages
                                                            .contains(widget
                                                                .serviceDoc
                                                                ?.gallery
                                                                .elementAtOrNull(
                                                                    4))
                                                        ? _model.serviceImages
                                                            .elementAtOrNull(4)!
                                                        : _model
                                                            .uploadedFileUrl_image15,
                                                    fit: BoxFit.contain,
                                                  ),
                                                  allowRotation: false,
                                                  tag: _model.serviceImages
                                                          .contains(widget
                                                              .serviceDoc
                                                              ?.gallery
                                                              .elementAtOrNull(
                                                                  4))
                                                      ? _model.serviceImages
                                                          .elementAtOrNull(4)!
                                                      : _model
                                                          .uploadedFileUrl_image15,
                                                  useHeroAnimation: true,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Hero(
                                            tag: _model.serviceImages.contains(
                                                    widget.serviceDoc?.gallery
                                                        .elementAtOrNull(4))
                                                ? _model.serviceImages
                                                    .elementAtOrNull(4)!
                                                : _model
                                                    .uploadedFileUrl_image15,
                                            transitionOnUserGestures: true,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Image.network(
                                                _model.serviceImages.contains(
                                                        widget
                                                            .serviceDoc?.gallery
                                                            .elementAtOrNull(
                                                                4))
                                                    ? _model.serviceImages
                                                        .elementAtOrNull(4)!
                                                    : _model
                                                        .uploadedFileUrl_image15,
                                                width: double.infinity,
                                                height: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 8.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (_model.serviceImages
                                                    .contains(widget
                                                        .serviceDoc?.gallery
                                                        .elementAtOrNull(4))) {
                                                  _model
                                                      .removeFromServiceImages(
                                                          widget.serviceDoc!
                                                              .gallery
                                                              .elementAtOrNull(
                                                                  4)!);
                                                  safeSetState(() {});
                                                } else {
                                                  safeSetState(() {
                                                    _model.isDataUploading_image15 =
                                                        false;
                                                    _model.uploadedLocalFile_image15 =
                                                        FFUploadedFile(
                                                            bytes: Uint8List
                                                                .fromList([]),
                                                            originalFilename:
                                                                '');
                                                    _model.uploadedFileUrl_image15 =
                                                        '';
                                                  });
                                                }
                                              },
                                              child: Container(
                                                width: 24.0,
                                                height: 24.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .barrier,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(
                                                  FFIcons.kxClose,
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        final selectedMedia =
                                            await selectMediaWithSourceBottomSheet(
                                          context: context,
                                          allowPhoto: true,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          safeSetState(() => _model
                                              .isDataUploading_image15 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          var downloadUrls = <String>[];
                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                          originalFilename: m
                                                              .originalFilename,
                                                        ))
                                                    .toList();

                                            downloadUrls = (await Future.wait(
                                              selectedMedia.map(
                                                (m) async => await uploadData(
                                                    m.storagePath, m.bytes),
                                              ),
                                            ))
                                                .where((u) => u != null)
                                                .map((u) => u!)
                                                .toList();
                                          } finally {
                                            _model.isDataUploading_image15 =
                                                false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedMedia.length &&
                                              downloadUrls.length ==
                                                  selectedMedia.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile_image15 =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl_image15 =
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
                                              BorderRadius.circular(10.0),
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Icon(
                                          FFIcons.kcamera,
                                          color: FlutterFlowTheme.of(context)
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
                                  (MediaQuery.sizeOf(context).width - 46) / 3,
                              height:
                                  (MediaQuery.sizeOf(context).width - 46) / 3,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).optionalColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Builder(
                                builder: (context) {
                                  if (_model.serviceImages.contains(widget
                                          .serviceDoc?.gallery
                                          .elementAtOrNull(5)) ||
                                      (_model.uploadedFileUrl_image16 !=
                                              '')) {
                                    return Stack(
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                child:
                                                    FlutterFlowExpandedImageView(
                                                  image: Image.network(
                                                    _model.serviceImages
                                                            .contains(widget
                                                                .serviceDoc
                                                                ?.gallery
                                                                .lastOrNull)
                                                        ? _model.serviceImages
                                                            .elementAtOrNull(5)!
                                                        : _model
                                                            .uploadedFileUrl_image16,
                                                    fit: BoxFit.contain,
                                                  ),
                                                  allowRotation: false,
                                                  tag: _model.serviceImages
                                                          .contains(widget
                                                              .serviceDoc
                                                              ?.gallery
                                                              .lastOrNull)
                                                      ? _model.serviceImages
                                                          .elementAtOrNull(5)!
                                                      : _model
                                                          .uploadedFileUrl_image16,
                                                  useHeroAnimation: true,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Hero(
                                            tag: _model.serviceImages.contains(
                                                    widget.serviceDoc?.gallery
                                                        .lastOrNull)
                                                ? _model.serviceImages
                                                    .elementAtOrNull(5)!
                                                : _model
                                                    .uploadedFileUrl_image16,
                                            transitionOnUserGestures: true,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Image.network(
                                                _model.serviceImages.contains(
                                                        widget
                                                            .serviceDoc
                                                            ?.gallery
                                                            .lastOrNull)
                                                    ? _model.serviceImages
                                                        .elementAtOrNull(5)!
                                                    : _model
                                                        .uploadedFileUrl_image16,
                                                width: double.infinity,
                                                height: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 8.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (_model.serviceImages
                                                    .contains(widget
                                                        .serviceDoc?.gallery
                                                        .elementAtOrNull(5))) {
                                                  _model
                                                      .removeFromServiceImages(
                                                          widget.serviceDoc!
                                                              .gallery
                                                              .elementAtOrNull(
                                                                  5)!);
                                                  safeSetState(() {});
                                                } else {
                                                  safeSetState(() {
                                                    _model.isDataUploading_image16 =
                                                        false;
                                                    _model.uploadedLocalFile_image16 =
                                                        FFUploadedFile(
                                                            bytes: Uint8List
                                                                .fromList([]),
                                                            originalFilename:
                                                                '');
                                                    _model.uploadedFileUrl_image16 =
                                                        '';
                                                  });
                                                }
                                              },
                                              child: Container(
                                                width: 24.0,
                                                height: 24.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .barrier,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Icon(
                                                  FFIcons.kxClose,
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        final selectedMedia =
                                            await selectMediaWithSourceBottomSheet(
                                          context: context,
                                          allowPhoto: true,
                                        );
                                        if (selectedMedia != null &&
                                            selectedMedia.every((m) =>
                                                validateFileFormat(
                                                    m.storagePath, context))) {
                                          safeSetState(() => _model
                                              .isDataUploading_image16 = true);
                                          var selectedUploadedFiles =
                                              <FFUploadedFile>[];

                                          var downloadUrls = <String>[];
                                          try {
                                            selectedUploadedFiles =
                                                selectedMedia
                                                    .map((m) => FFUploadedFile(
                                                          name: m.storagePath
                                                              .split('/')
                                                              .last,
                                                          bytes: m.bytes,
                                                          height: m.dimensions
                                                              ?.height,
                                                          width: m.dimensions
                                                              ?.width,
                                                          blurHash: m.blurHash,
                                                          originalFilename: m
                                                              .originalFilename,
                                                        ))
                                                    .toList();

                                            downloadUrls = (await Future.wait(
                                              selectedMedia.map(
                                                (m) async => await uploadData(
                                                    m.storagePath, m.bytes),
                                              ),
                                            ))
                                                .where((u) => u != null)
                                                .map((u) => u!)
                                                .toList();
                                          } finally {
                                            _model.isDataUploading_image16 =
                                                false;
                                          }
                                          if (selectedUploadedFiles.length ==
                                                  selectedMedia.length &&
                                              downloadUrls.length ==
                                                  selectedMedia.length) {
                                            safeSetState(() {
                                              _model.uploadedLocalFile_image16 =
                                                  selectedUploadedFiles.first;
                                              _model.uploadedFileUrl_image16 =
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
                                              BorderRadius.circular(10.0),
                                        ),
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Icon(
                                          FFIcons.kcamera,
                                          color: FlutterFlowTheme.of(context)
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
                    ].addToEnd(SizedBox(height: 24.0)),
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
                child: FFButtonWidget(
                  onPressed: () async {
                    await Future.wait([
                      Future(() async {
                        if (_model.uploadedFileUrl_uploadDataRd0 != '') {
                          await widget.serviceDoc!.reference
                              .update(createServicesRecordData(
                            image: _model.uploadedFileUrl_uploadDataRd0,
                          ));
                        }
                      }),
                      Future(() async {
                        if (_model.uploadedFileUrl_image11 != '') {
                          _model.addToServiceImages(
                              _model.uploadedFileUrl_image11);
                          safeSetState(() {});
                        }
                      }),
                      Future(() async {
                        if (_model.uploadedFileUrl_image12 != '') {
                          _model.addToServiceImages(
                              _model.uploadedFileUrl_image12);
                          safeSetState(() {});
                        }
                      }),
                      Future(() async {
                        if (_model.uploadedFileUrl_image13 != '') {
                          _model.addToServiceImages(
                              _model.uploadedFileUrl_image13);
                          safeSetState(() {});
                        }
                      }),
                      Future(() async {
                        if (_model.uploadedFileUrl_image14 != '') {
                          _model.addToServiceImages(
                              _model.uploadedFileUrl_image14);
                          safeSetState(() {});
                        }
                      }),
                      Future(() async {
                        if (_model.uploadedFileUrl_image15 != '') {
                          _model.addToServiceImages(
                              _model.uploadedFileUrl_image15);
                          safeSetState(() {});
                        }
                      }),
                      Future(() async {
                        if (_model.uploadedFileUrl_image16 != '') {
                          _model.addToServiceImages(
                              _model.uploadedFileUrl_image16);
                          safeSetState(() {});
                        }
                      }),
                    ]);

                    try {
                      await widget.serviceDoc!.reference.update({
                        ...createServicesRecordData(
                          description: _model.descriptionTextController.text,
                          title: _model.titleTextController.text,
                          pricePerHour: _model.floorPrice,
                        ),
                        ...mapToFirestore(
                          {
                            'gallery': _model.serviceImages,
                          },
                        ),
                      });
                      
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: Colors.white,
                                size: 20.0,
                              ),
                              SizedBox(width: 12.0),
                              Text(
                                'Service details saved successfully!',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          backgroundColor: Color(0xFF4CAF50),
                          duration: Duration(seconds: 2),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                      
                      await Future.delayed(Duration(milliseconds: 800));
                      if (context.mounted) {
                        context.safePop();
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Row(
                            children: [
                              Icon(
                                Icons.error_outline,
                                color: Colors.white,
                                size: 20.0,
                              ),
                              SizedBox(width: 12.0),
                              Expanded(
                                child: Text(
                                  'Error saving service details. Please try again.',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          backgroundColor: Color(0xFFF44336),
                          duration: Duration(seconds: 3),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  },
                  text: 'Save',
                  options: FFButtonOptions(
                    height: 50.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle:
                        FlutterFlowTheme.of(context).titleMedium.override(
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
