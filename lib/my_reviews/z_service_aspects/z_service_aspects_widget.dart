import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'z_service_aspects_model.dart';
export 'z_service_aspects_model.dart';

class ZServiceAspectsWidget extends StatefulWidget {
  const ZServiceAspectsWidget({
    super.key,
    required this.aspect,
  });

  final String? aspect;

  @override
  State<ZServiceAspectsWidget> createState() => _ZServiceAspectsWidgetState();
}

class _ZServiceAspectsWidgetState extends State<ZServiceAspectsWidget> {
  late ZServiceAspectsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZServiceAspectsModel());

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
        if (FFAppState().serviceAspects.contains(widget.aspect)) {
          FFAppState().removeFromServiceAspects(widget.aspect!);
          _model.updatePage(() {});
        } else {
          FFAppState().addToServiceAspects(widget.aspect!);
          _model.updatePage(() {});
        }
      },
      child: Container(
        height: 44.0,
        decoration: BoxDecoration(
          color: FFAppState().serviceAspects.contains(widget.aspect)
              ? FlutterFlowTheme.of(context).accent1
              : FlutterFlowTheme.of(context).optionalColor,
          borderRadius: BorderRadius.circular(22.0),
          border: Border.all(
            color: FFAppState().serviceAspects.contains(widget.aspect)
                ? FlutterFlowTheme.of(context).primary
                : FlutterFlowTheme.of(context).transparent,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15.0, 14.0, 15.0, 14.0),
          child: Text(
            valueOrDefault<String>(
              widget.aspect,
              'null',
            ),
            style: FlutterFlowTheme.of(context).titleSmall.override(
                  font: GoogleFonts.inter(
                    fontWeight:
                        FlutterFlowTheme.of(context).titleSmall.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).titleSmall.fontStyle,
                  ),
                  color: FFAppState().serviceAspects.contains(widget.aspect)
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).primaryText,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).titleSmall.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                  lineHeight: 1.0,
                ),
          ),
        ),
      ),
    );
  }
}
