import '/flutter_flow/flutter_flow_util.dart';
import '/service/z_review_card/z_review_card_widget.dart';
import 'reviews_list_widget.dart' show ReviewsListWidget;
import 'package:flutter/material.dart';

class ReviewsListModel extends FlutterFlowModel<ReviewsListWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for zReviewCard dynamic component.
  late FlutterFlowDynamicModels<ZReviewCardModel> zReviewCardModels;

  @override
  void initState(BuildContext context) {
    zReviewCardModels = FlutterFlowDynamicModels(() => ZReviewCardModel());
  }

  @override
  void dispose() {
    zReviewCardModels.dispose();
  }
}
