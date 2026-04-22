import '/backend/backend.dart';
import '/booking/components/z_rooms_card/z_rooms_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home/components/z_empty_booking/z_empty_booking_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'booking_rooms_model.dart';
export 'booking_rooms_model.dart';

class BookingRoomsWidget extends StatefulWidget {
  const BookingRoomsWidget({
    super.key,
    required this.serviceDoc,
  });

  final ServicesRecord? serviceDoc;

  static String routeName = 'BookingRooms';
  static String routePath = '/bookingRooms';

  @override
  State<BookingRoomsWidget> createState() => _BookingRoomsWidgetState();
}

class _BookingRoomsWidgetState extends State<BookingRoomsWidget> {
  late BookingRoomsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingRoomsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().serviceTotalPrice = 0.0;
      FFAppState().roomsQuantity = [];
      FFAppState().promoCode = 1.0;
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                context.safePop();
              },
            ),
          ),
          title: Text(
            'Booking',
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
                color: FlutterFlowTheme.of(context).secondaryBackground,
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                      child: Text(
                        widget.serviceDoc?.category == 'Cleaning Services'
                            ? 'How many rooms need to clean?'
                            : 'Select rooms for pest control treatment.',
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              font: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .fontStyle,
                              ),
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                              lineHeight: 1.5,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                      child: Text(
                        'Residential Spaces',
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final residentiaList =
                              _model.residentialSpaces.toList();

                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(residentiaList.length,
                                (residentiaListIndex) {
                              final residentiaListItem =
                                  residentiaList[residentiaListIndex];
                              return wrapWithModel(
                                model: _model.zRoomsCardModels1.getModel(
                                  residentiaListIndex.toString(),
                                  residentiaListIndex,
                                ),
                                updateCallback: () => safeSetState(() {}),
                                child: ZRoomsCardWidget(
                                  key: Key(
                                    'Key0n2_${residentiaListIndex.toString()}',
                                  ),
                                  room: residentiaListItem,
                                ),
                              );
                            }).divide(SizedBox(height: 12.0)),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 24.0, 15.0, 0.0),
                      child: Text(
                        'Bathrooms & Sanitary Areas',
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final bathroomsList = _model.bathrooms.toList();

                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(bathroomsList.length,
                                (bathroomsListIndex) {
                              final bathroomsListItem =
                                  bathroomsList[bathroomsListIndex];
                              return wrapWithModel(
                                model: _model.zRoomsCardModels2.getModel(
                                  bathroomsListIndex.toString(),
                                  bathroomsListIndex,
                                ),
                                updateCallback: () => safeSetState(() {}),
                                child: ZRoomsCardWidget(
                                  key: Key(
                                    'Keypsq_${bathroomsListIndex.toString()}',
                                  ),
                                  room: bathroomsListItem,
                                ),
                              );
                            }).divide(SizedBox(height: 12.0)),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 24.0, 15.0, 0.0),
                      child: Text(
                        'Kitchen & Utility Spaces',
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final kitchenList = _model.kitchen.toList();

                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(kitchenList.length,
                                (kitchenListIndex) {
                              final kitchenListItem =
                                  kitchenList[kitchenListIndex];
                              return wrapWithModel(
                                model: _model.zRoomsCardModels3.getModel(
                                  kitchenListIndex.toString(),
                                  kitchenListIndex,
                                ),
                                updateCallback: () => safeSetState(() {}),
                                child: ZRoomsCardWidget(
                                  key: Key(
                                    'Keyg7e_${kitchenListIndex.toString()}',
                                  ),
                                  room: kitchenListItem,
                                ),
                              );
                            }).divide(SizedBox(height: 12.0)),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 24.0, 15.0, 0.0),
                      child: Text(
                        'Commercial & Office Spaces',
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final commercialList = _model.commercial.toList();

                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(commercialList.length,
                                (commercialListIndex) {
                              final commercialListItem =
                                  commercialList[commercialListIndex];
                              return wrapWithModel(
                                model: _model.zRoomsCardModels4.getModel(
                                  commercialListIndex.toString(),
                                  commercialListIndex,
                                ),
                                updateCallback: () => safeSetState(() {}),
                                child: ZRoomsCardWidget(
                                  key: Key(
                                    'Key3dt_${commercialListIndex.toString()}',
                                  ),
                                  room: commercialListItem,
                                ),
                              );
                            }).divide(SizedBox(height: 12.0)),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 24.0, 15.0, 0.0),
                      child: Text(
                        'Garages & Outdoor Areas',
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final garageslList = _model.garages.toList();

                          return Column(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(garageslList.length,
                                (garageslListIndex) {
                              final garageslListItem =
                                  garageslList[garageslListIndex];
                              return wrapWithModel(
                                model: _model.zRoomsCardModels5.getModel(
                                  garageslListIndex.toString(),
                                  garageslListIndex,
                                ),
                                updateCallback: () => safeSetState(() {}),
                                child: ZRoomsCardWidget(
                                  key: Key(
                                    'Keyec7_${garageslListIndex.toString()}',
                                  ),
                                  room: garageslListItem,
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
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12.0,
                    color: FlutterFlowTheme.of(context).shadow,
                    offset: Offset(
                      0.0,
                      -4.0,
                    ),
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (FFAppState().roomsQuantity.isNotEmpty) {
                      context.pushNamed(
                        BookingDateTimeWidget.routeName,
                        queryParameters: {
                          'serviceDoc': serializeParam(
                            widget.serviceDoc,
                            ParamType.Document,
                          ),
                        }.withoutNulls,
                        extra: <String, dynamic>{
                          'serviceDoc': widget.serviceDoc,
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
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
                                FocusScope.of(dialogContext).unfocus();
                                FocusManager.instance.primaryFocus
                                    ?.unfocus();
                              },
                              child: ZEmptyBookingWidget(
                                serviceCategory:
                                    widget.serviceDoc!.category,
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                  text: 'Next',
                  options: FFButtonOptions(
                    width: double.infinity,
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
                  showLoadingIndicator: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
