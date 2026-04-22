import '/backend/backend.dart';
import '/booking/components/optionals_buttons/optionals_buttons_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'z_review_optional_model.dart';
export 'z_review_optional_model.dart';

class ZReviewOptionalWidget extends StatefulWidget {
  const ZReviewOptionalWidget({
    super.key,
    required this.reviewDoc,
  });

  final UserReviewsRecord? reviewDoc;

  @override
  State<ZReviewOptionalWidget> createState() => _ZReviewOptionalWidgetState();
}

class _ZReviewOptionalWidgetState extends State<ZReviewOptionalWidget>
    with TickerProviderStateMixin {
  late ZReviewOptionalModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZReviewOptionalModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (animationsMap['containerOnActionTriggerAnimation'] != null) {
        await animationsMap['containerOnActionTriggerAnimation']!
            .controller
            .forward(from: 0.0);
      }
    });

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: Offset(0.9, 0.9),
            end: Offset(1.0, 1.0),
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
    return Container(
      width: 180.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).optionalColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 8.0,
            color: FlutterFlowTheme.of(context).shadow,
            offset: Offset(
              0.0,
              0.0,
            ),
            spreadRadius: 1.0,
          )
        ],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          if (animationsMap['containerOnActionTriggerAnimation'] != null) {
            await animationsMap['containerOnActionTriggerAnimation']!
                .controller
                .reverse();
          }
          Navigator.pop(context);
        },
        child: wrapWithModel(
          model: _model.optionalsButtonsModel,
          updateCallback: () => safeSetState(() {}),
          child: OptionalsButtonsWidget(
            text: 'Edit',
            icon: Icon(
              FFIcons.kedit02,
            ),
          ),
        ),
      ),
    ).animateOnActionTrigger(
      animationsMap['containerOnActionTriggerAnimation']!,
    );
  }
}
