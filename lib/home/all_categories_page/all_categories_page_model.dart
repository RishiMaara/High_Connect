import '/flutter_flow/flutter_flow_util.dart';
import '/home/components/z_all_category_card/z_all_category_card_widget.dart';
import 'all_categories_page_widget.dart' show AllCategoriesPageWidget;
import 'package:flutter/material.dart';

class AllCategoriesPageModel extends FlutterFlowModel<AllCategoriesPageWidget> {
  ///  Local state fields for this page.

  bool inProgress = true;

  ///  State fields for stateful widgets in this page.

  // Models for zAllCategoryCard dynamic component.
  late FlutterFlowDynamicModels<ZAllCategoryCardModel> zAllCategoryCardModels;

  @override
  void initState(BuildContext context) {
    zAllCategoryCardModels =
        FlutterFlowDynamicModels(() => ZAllCategoryCardModel());
  }

  @override
  void dispose() {
    zAllCategoryCardModels.dispose();
  }
}
