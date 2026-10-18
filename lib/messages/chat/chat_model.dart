import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'chat_widget.dart' show ChatWidget;
import 'package:flutter/material.dart';

class ChatModel extends FlutterFlowModel<ChatWidget> {
  ///  Local state fields for this page.

  int? messagesCount = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Chat widget.
  ChatsRecord? chatDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Chat widget.
  int? messageCount;
  // Stores action output result for [Firestore Query - Query a collection] action in Chat widget.
  ChatMessagesRecord? messageDoc;
  bool isDataUploading_uploadData4ul = false;
  bool isLocationUploading = false;
  FFUploadedFile uploadedLocalFile_uploadData4ul =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData4ul = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ChatMessagesRecord? lastMessage;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ChatsRecord? chatRef;
  // Stores action output result for [Backend Call - Create Document] action in IconButton widget.
  ChatMessagesRecord? firstLastMessage;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
