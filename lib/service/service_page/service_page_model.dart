import '/flutter_flow/flutter_flow_util.dart';
import '/service/z_service_reviews_list/z_service_reviews_list_widget.dart';
import '/index.dart';
import 'service_page_widget.dart' show ServicePageWidget;
import 'package:flutter/material.dart';

class ServicePageModel extends FlutterFlowModel<ServicePageWidget> {
  ///  Local state fields for this page.

  int? pageViewItem = 0;

  ///  State fields for stateful widgets in this page.

  // Model for zServiceReviewsList component.
  late ZServiceReviewsListModel zServiceReviewsListModel;

  @override
  void initState(BuildContext context) {
    zServiceReviewsListModel =
        createModel(context, () => ZServiceReviewsListModel());
  }

  @override
  void dispose() {
    zServiceReviewsListModel.dispose();
  }
}
