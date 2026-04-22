import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'z_faq_card_model.dart';
export 'z_faq_card_model.dart';

class ZFaqCardWidget extends StatefulWidget {
  const ZFaqCardWidget({
    super.key,
    required this.question,
    required this.answer,
  });

  final String? question;
  final String? answer;

  @override
  State<ZFaqCardWidget> createState() => _ZFaqCardWidgetState();
}

class _ZFaqCardWidgetState extends State<ZFaqCardWidget>
    with TickerProviderStateMixin {
  late ZFaqCardModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZFaqCardModel());

    animationsMap.addAll({
      'iconOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: -0.5,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).optionalColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (_model.showAnswer) {
                  if (animationsMap['iconOnActionTriggerAnimation'] != null) {
                    await animationsMap['iconOnActionTriggerAnimation']!
                        .controller
                        .reverse();
                  }
                  _model.showAnswer = false;
                  safeSetState(() {});
                } else {
                  if (animationsMap['iconOnActionTriggerAnimation'] != null) {
                    await animationsMap['iconOnActionTriggerAnimation']!
                        .controller
                        .forward(from: 0.0);
                  }
                  _model.showAnswer = true;
                  safeSetState(() {});
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          15.0, 15.0, 15.0, 15.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.question,
                          'null',
                        ),
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 15.0, 15.0),
                    child: Icon(
                      FFIcons.kchevronDown,
                      color: _model.showAnswer
                          ? FlutterFlowTheme.of(context).primaryText
                          : FlutterFlowTheme.of(context).icons,
                      size: 24.0,
                    ).animateOnActionTrigger(
                      animationsMap['iconOnActionTriggerAnimation']!,
                    ),
                  ),
                ],
              ),
            ),
            if (_model.showAnswer)
              Divider(
                height: 1.0,
                thickness: 1.0,
                indent: 15.0,
                endIndent: 15.0,
                color: FlutterFlowTheme.of(context).secondary,
              ),
            if (_model.showAnswer)
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.answer,
                    'null',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
