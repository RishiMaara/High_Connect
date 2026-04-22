import '/flutter_flow/flutter_flow_util.dart';
import '/my_reviews/z_my_review_card/z_my_review_card_widget.dart';
import '/my_reviews/z_pending_review_card/z_pending_review_card_widget.dart';
import 'my_reviews_widget.dart' show MyReviewsWidget;
import 'package:flutter/material.dart';

class MyReviewsModel extends FlutterFlowModel<MyReviewsWidget> {
  ///  Local state fields for this page.

  int? listViewItem = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Models for zPendingReviewCard dynamic component.
  late FlutterFlowDynamicModels<ZPendingReviewCardModel>
      zPendingReviewCardModels;
  // Models for zMyReviewCard dynamic component.
  late FlutterFlowDynamicModels<ZMyReviewCardModel> zMyReviewCardModels;

  @override
  void initState(BuildContext context) {
    zPendingReviewCardModels =
        FlutterFlowDynamicModels(() => ZPendingReviewCardModel());
    zMyReviewCardModels = FlutterFlowDynamicModels(() => ZMyReviewCardModel());
  }

  @override
  void dispose() {
    zPendingReviewCardModels.dispose();
    zMyReviewCardModels.dispose();
  }
}
