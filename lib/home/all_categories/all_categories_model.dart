import '/flutter_flow/flutter_flow_util.dart';
import '/home/components/z_all_category_card/z_all_category_card_widget.dart';
import '/home/components/z_nawbar/z_nawbar_widget.dart';
import 'all_categories_widget.dart' show AllCategoriesWidget;
import 'package:flutter/material.dart';

class AllCategoriesModel extends FlutterFlowModel<AllCategoriesWidget> {
  ///  Local state fields for this page.

  bool inProgress = true;

  ///  State fields for stateful widgets in this page.

  // Models for zAllCategoryCard dynamic component.
  late FlutterFlowDynamicModels<ZAllCategoryCardModel> zAllCategoryCardModels;
  // Model for zNawbar component.
  late ZNawbarModel zNawbarModel;

  @override
  void initState(BuildContext context) {
    zAllCategoryCardModels =
        FlutterFlowDynamicModels(() => ZAllCategoryCardModel());
    zNawbarModel = createModel(context, () => ZNawbarModel());
  }

  @override
  void dispose() {
    zAllCategoryCardModels.dispose();
    zNawbarModel.dispose();
  }
}
