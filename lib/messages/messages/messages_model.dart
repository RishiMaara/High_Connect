import '/flutter_flow/flutter_flow_util.dart';
import '/home/components/z_nawbar/z_nawbar_widget.dart';
import '/messages/z_calls_card/z_calls_card_widget.dart';
import '/messages/z_chats_card/z_chats_card_widget.dart';
import 'messages_widget.dart' show MessagesWidget;
import 'package:flutter/material.dart';

class MessagesModel extends FlutterFlowModel<MessagesWidget> {
  ///  Local state fields for this page.

  int pageIndex = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Models for zChatsCard dynamic component.
  late FlutterFlowDynamicModels<ZChatsCardModel> zChatsCardModels;
  // Models for zCallsCard dynamic component.
  late FlutterFlowDynamicModels<ZCallsCardModel> zCallsCardModels;
  // Model for zNawbar component.
  late ZNawbarModel zNawbarModel;

  @override
  void initState(BuildContext context) {
    zChatsCardModels = FlutterFlowDynamicModels(() => ZChatsCardModel());
    zCallsCardModels = FlutterFlowDynamicModels(() => ZCallsCardModel());
    zNawbarModel = createModel(context, () => ZNawbarModel());
  }

  @override
  void dispose() {
    zChatsCardModels.dispose();
    zCallsCardModels.dispose();
    zNawbarModel.dispose();
  }
}
