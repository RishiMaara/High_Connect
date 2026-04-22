import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'l_category2_list_model.dart';
export 'l_category2_list_model.dart';

class LCategory2ListWidget extends StatefulWidget {
  const LCategory2ListWidget({super.key});

  @override
  State<LCategory2ListWidget> createState() => _LCategory2ListWidgetState();
}

class _LCategory2ListWidgetState extends State<LCategory2ListWidget>
    with TickerProviderStateMixin {
  late LCategory2ListModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LCategory2ListModel());

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 900.0.ms,
            color: FlutterFlowTheme.of(context).shimmer,
            angle: 0,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final loadingList = _model.loading.toList();

        return Row(
          mainAxisSize: MainAxisSize.max,
          children: List.generate(loadingList.length, (loadingListIndex) {
            final loadingListItem = loadingList[loadingListIndex];
            return Container(
              width: (MediaQuery.sizeOf(context).width - 66) / 4,
              height: 99.5,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    height: (MediaQuery.sizeOf(context).width - 66) / 4,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).optionalColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: 14.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).optionalColor,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ],
              ),
            ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
          }).divide(SizedBox(width: 12.0)),
        );
      },
    );
  }
}
