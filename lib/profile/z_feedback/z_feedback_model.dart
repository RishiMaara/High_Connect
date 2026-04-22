import '/flutter_flow/flutter_flow_util.dart';
import 'z_feedback_widget.dart' show ZFeedbackWidget;
import 'package:flutter/material.dart';

class ZFeedbackModel extends FlutterFlowModel<ZFeedbackWidget> {
  ///  Local state fields for this component.

  List<String> feedbacks = [
    'General Feedback',
    'Report an Issue',
    'Service Quality',
    'App Performance'
  ];
  void addToFeedbacks(String item) => feedbacks.add(item);
  void removeFromFeedbacks(String item) => feedbacks.remove(item);
  void removeAtIndexFromFeedbacks(int index) => feedbacks.removeAt(index);
  void insertAtIndexInFeedbacks(int index, String item) =>
      feedbacks.insert(index, item);
  void updateFeedbacksAtIndex(int index, Function(String) updateFn) =>
      feedbacks[index] = updateFn(feedbacks[index]);

  String? feedbackType = 'General Feedback';

  ///  State fields for stateful widgets in this component.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for Comment widget.
  FocusNode? commentFocusNode;
  TextEditingController? commentTextController;
  String? Function(BuildContext, String?)? commentTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    commentFocusNode?.dispose();
    commentTextController?.dispose();
  }
}
