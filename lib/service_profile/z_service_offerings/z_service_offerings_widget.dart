import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'z_service_offerings_model.dart';
export 'z_service_offerings_model.dart';

class ZServiceOfferingsWidget extends StatefulWidget {
  const ZServiceOfferingsWidget({
    super.key,
    required this.offerings,
  });

  final String? offerings;

  @override
  State<ZServiceOfferingsWidget> createState() =>
      _ZServiceOfferingsWidgetState();
}

class _ZServiceOfferingsWidgetState extends State<ZServiceOfferingsWidget> {
  late ZServiceOfferingsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZServiceOfferingsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).optionalColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
            15.0,
            valueOrDefault<double>(
              FFAppState().serviceOfferings.contains(widget.offerings)
                  ? 15.0
                  : 24.0,
              0.0,
            ),
            15.0,
            valueOrDefault<double>(
              FFAppState().serviceOfferings.contains(widget.offerings)
                  ? 15.0
                  : 24.0,
              0.0,
            )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (FFAppState().serviceOfferings.contains(widget.offerings)) {
                  FFAppState().removeFromServiceOfferings(widget.offerings!);
                  FFAppState().removeFromSelectedServiceOfferings(
                      ServiceOfferingsStruct(
                    title: widget.offerings,
                    pricePerHour: 0.0,
                  ));
                  _model.updatePage(() {});
                  safeSetState(() {});
                } else {
                  FFAppState().addToServiceOfferings(widget.offerings!);
                  // Auto-add to selectedServiceOfferings with 0 price (pricing removed)
                  FFAppState().addToSelectedServiceOfferings(
                      ServiceOfferingsStruct(
                    title: widget.offerings,
                    pricePerHour: 0.0,
                  ));
                  _model.updatePage(() {});
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      valueOrDefault<String>(
                        widget.offerings,
                        'null',
                      ),
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .fontStyle,
                            lineHeight: 1.5,
                          ),
                    ),
                  ),
                  Container(
                    width: 24.0,
                    height: 24.0,
                    decoration: BoxDecoration(
                      color: FFAppState()
                              .serviceOfferings
                              .contains(widget.offerings)
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).transparent,
                      borderRadius: BorderRadius.circular(6.0),
                      border: Border.all(
                        color: FFAppState()
                                .serviceOfferings
                                .contains(widget.offerings)
                            ? FlutterFlowTheme.of(context).transparent
                            : FlutterFlowTheme.of(context).icons,
                        width: FFAppState()
                                .serviceOfferings
                                .contains(widget.offerings)
                            ? 0.0
                            : 1.5,
                      ),
                    ),
                    child: Visibility(
                      visible: FFAppState()
                          .serviceOfferings
                          .contains(widget.offerings),
                      child: Icon(
                        FFIcons.kcheck,
                        color: FlutterFlowTheme.of(context).info,
                        size: 18.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (FFAppState().serviceOfferings.contains(widget.offerings))
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: Text(
                  'Service selected',
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelMedium
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).success,
                        letterSpacing: 0.0,
                        fontWeight: FlutterFlowTheme.of(context)
                            .labelMedium
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .labelMedium
                            .fontStyle,
                        lineHeight: 1.0,
                      ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
