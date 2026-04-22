import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'icon_text_right_model.dart';
export 'icon_text_right_model.dart';

class IconTextRightWidget extends StatefulWidget {
  const IconTextRightWidget({
    super.key,
    required this.content,
    required this.icon,
  });

  final String? content;
  final Widget? icon;

  @override
  State<IconTextRightWidget> createState() => _IconTextRightWidgetState();
}

class _IconTextRightWidgetState extends State<IconTextRightWidget> {
  late IconTextRightModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IconTextRightModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              widget.icon!,
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 20.0),
                  child: Text(
                    valueOrDefault<String>(
                      widget.content,
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
                        ),
                  ),
                ),
              ),
              Icon(
                FFIcons.kchevronRight,
                color: FlutterFlowTheme.of(context).icons,
                size: 20.0,
              ),
            ],
          ),
        ),
        Divider(
          height: 1.0,
          thickness: 1.0,
          indent: 15.0,
          endIndent: 15.0,
          color: FlutterFlowTheme.of(context).primaryBackground,
        ),
      ],
    );
  }
}
