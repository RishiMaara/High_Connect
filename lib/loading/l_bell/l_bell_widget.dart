import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'l_bell_model.dart';
export 'l_bell_model.dart';

class LBellWidget extends StatefulWidget {
  const LBellWidget({super.key});

  @override
  State<LBellWidget> createState() => _LBellWidgetState();
}

class _LBellWidgetState extends State<LBellWidget> {
  late LBellModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LBellModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterFlowIconButton(
      borderRadius: 22.0,
      buttonSize: 44.0,
      fillColor: FlutterFlowTheme.of(context).transparent,
      icon: Icon(
        FFIcons.kbell01,
        color: FlutterFlowTheme.of(context).primaryText,
        size: 24.0,
      ),
      onPressed: () {
      },
    );
  }
}
