import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/my_notifications/z_notifications_card/z_notifications_card_widget.dart';
import '/index.dart';
import 'my_notifications_widget.dart' show MyNotificationsWidget;
import 'package:flutter/material.dart';

class MyNotificationsModel extends FlutterFlowModel<MyNotificationsWidget> {
  ///  Local state fields for this page.

  DocumentReference? notificationRef;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<NotificationsRecord>? notificationsList;
  // Models for zNotificationsCard dynamic component.
  late FlutterFlowDynamicModels<ZNotificationsCardModel>
      zNotificationsCardModels;

  @override
  void initState(BuildContext context) {
    zNotificationsCardModels =
        FlutterFlowDynamicModels(() => ZNotificationsCardModel());
  }

  @override
  void dispose() {
    zNotificationsCardModels.dispose();
  }
}
