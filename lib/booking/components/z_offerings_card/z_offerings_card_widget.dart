import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'z_offerings_card_model.dart';
export 'z_offerings_card_model.dart';

class ZOfferingsCardWidget extends StatefulWidget {
  const ZOfferingsCardWidget({
    super.key,
    required this.offeringsData,
  });

  final ServiceOfferingsStruct? offeringsData;

  @override
  State<ZOfferingsCardWidget> createState() => _ZOfferingsCardWidgetState();
}

class _ZOfferingsCardWidgetState extends State<ZOfferingsCardWidget> {
  late ZOfferingsCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZOfferingsCardModel());

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

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        if (FFAppState().selectedOfferings.contains(widget.offeringsData)) {
          FFAppState().removeFromSelectedOfferings(widget.offeringsData!);
          _model.updatePage(() {});
        } else {
          FFAppState().addToSelectedOfferings(widget.offeringsData!);
          _model.updatePage(() {});
        }
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valueOrDefault<String>(
                          widget.offeringsData?.title,
                          'null',
                        ),
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
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
                    ].divide(SizedBox(height: 8.0)),
                  ),
                ),
              ),
              Container(
                width: 24.0,
                height: 24.0,
                decoration: BoxDecoration(
                  color: FFAppState()
                          .selectedOfferings
                          .contains(widget.offeringsData)
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).transparent,
                  borderRadius: BorderRadius.circular(6.0),
                  border: Border.all(
                    color: FFAppState()
                            .selectedOfferings
                            .contains(widget.offeringsData)
                        ? FlutterFlowTheme.of(context).transparent
                        : FlutterFlowTheme.of(context).icons,
                    width: FFAppState()
                            .selectedOfferings
                            .contains(widget.offeringsData)
                        ? 0.0
                        : 1.5,
                  ),
                ),
                child: Visibility(
                  visible: FFAppState()
                      .selectedOfferings
                      .contains(widget.offeringsData),
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
      ),
    );
  }
}
