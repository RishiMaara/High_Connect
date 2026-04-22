import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/booking/components/optionals_buttons/optionals_buttons_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/my_addresses/z_delete_address/z_delete_address_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'z_address_optional_model.dart';
export 'z_address_optional_model.dart';

class ZAddressOptionalWidget extends StatefulWidget {
  const ZAddressOptionalWidget({
    super.key,
    required this.addressRef,
    required this.address,
  });

  final DocumentReference? addressRef;
  final String? address;

  @override
  State<ZAddressOptionalWidget> createState() => _ZAddressOptionalWidgetState();
}

class _ZAddressOptionalWidgetState extends State<ZAddressOptionalWidget>
    with TickerProviderStateMixin {
  late ZAddressOptionalModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZAddressOptionalModel());

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
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: Offset(0.0, -20.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: 0.0,
            end: 1.0,
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
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 16.0, 0.0),
      child: Container(
        width: 200.0,
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.addressRef != currentUserDocument?.selectedAddress)
              AuthUserStreamWidget(
                builder: (context) => InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await currentUserReference!.update(createUsersRecordData(
                      selectedAddress: widget.addressRef,
                    ));
                    if (animationsMap['containerOnActionTriggerAnimation'] !=
                        null) {
                      await animationsMap['containerOnActionTriggerAnimation']!
                          .controller
                          .reverse();
                    }
                    Navigator.pop(context);

                    context.goNamed(MyAddressesWidget.routeName);
                  },
                  child: wrapWithModel(
                    model: _model.optionalsButtonsModel1,
                    updateCallback: () => safeSetState(() {}),
                    child: OptionalsButtonsWidget(
                      text: 'Use by default',
                      icon: Icon(
                        FFIcons.kbookmark,
                      ),
                    ),
                  ),
                ),
              ),
            Builder(
              builder: (context) => InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if (animationsMap['containerOnActionTriggerAnimation'] !=
                      null) {
                    await animationsMap['containerOnActionTriggerAnimation']!
                        .controller
                        .reverse();
                  }
                  Navigator.pop(context);
                  await showDialog(
                    barrierColor: FlutterFlowTheme.of(context).barrier,
                    context: context,
                    builder: (dialogContext) {
                      return Dialog(
                        elevation: 0,
                        insetPadding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        alignment: AlignmentDirectional(0.0, 0.0)
                            .resolve(Directionality.of(context)),
                        child: ZDeleteAddressWidget(
                          addressRef: widget.addressRef!,
                        ),
                      );
                    },
                  );
                },
                child: wrapWithModel(
                  model: _model.optionalsButtonsModel2,
                  updateCallback: () => safeSetState(() {}),
                  child: OptionalsButtonsWidget(
                    text: 'Delete',
                    icon: Icon(
                      FFIcons.ktrash03,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ).animateOnActionTrigger(
        animationsMap['containerOnActionTriggerAnimation']!,
      ),
    );
  }
}
