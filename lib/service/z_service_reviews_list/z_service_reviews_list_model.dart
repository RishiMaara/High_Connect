import '/flutter_flow/flutter_flow_util.dart';
import '/service/z_review_card/z_review_card_widget.dart';
import 'z_service_reviews_list_widget.dart' show ZServiceReviewsListWidget;
import 'package:flutter/material.dart';

class ZServiceReviewsListModel
    extends FlutterFlowModel<ZServiceReviewsListWidget> {
  ///  State fields for stateful widgets in this component.

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
