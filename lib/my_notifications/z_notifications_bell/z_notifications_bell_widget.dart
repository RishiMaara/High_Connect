import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/loading/l_bell/l_bell_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'z_notifications_bell_model.dart';
export 'z_notifications_bell_model.dart';

class ZNotificationsBellWidget extends StatefulWidget {
  const ZNotificationsBellWidget({super.key});

  @override
  State<ZNotificationsBellWidget> createState() =>
      _ZNotificationsBellWidgetState();
}

class _ZNotificationsBellWidgetState extends State<ZNotificationsBellWidget> {
  late ZNotificationsBellModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZNotificationsBellModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: queryNotificationsRecordCount(
        parent: currentUserReference,
        queryBuilder: (notificationsRecord) => notificationsRecord.where(
          'read',
          isEqualTo: false,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return LBellWidget();
        }
        int stackCount = snapshot.data!;

        return Container(
          width: 44.0,
          height: 44.0,
          child: Stack(
            alignment: AlignmentDirectional(0.0, 0.0),
            children: [
              FlutterFlowIconButton(
                borderRadius: 22.0,
                buttonSize: 44.0,
                fillColor: FlutterFlowTheme.of(context).transparent,
                icon: Icon(
                  FFIcons.kbell01,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.pushNamed(MyNotificationsWidget.routeName);
                },
              ),
              if (stackCount > 0)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 10.0),
                  child: Container(
                    width: 10.0,
                    height: 10.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      shape: BoxShape.circle,
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: 6.0,
                      height: 6.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).error,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
