import '/flutter_flow/flutter_flow_util.dart';
import '/home/components/z_category_card/z_category_card_widget.dart';
import '/home/components/z_home_page_address/z_home_page_address_widget.dart';
import '/home/components/z_nawbar/z_nawbar_widget.dart';
import '/home/components/z_services_categories/z_services_categories_widget.dart';
import '/home/z_services_horizontal/z_services_horizontal_widget.dart';
import '/home/z_services_square_card/z_services_square_card_widget.dart';
import '/my_notifications/z_notifications_bell/z_notifications_bell_widget.dart';
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for zHomePageAddress component.
  late ZHomePageAddressModel zHomePageAddressModel;
  // Model for zNotificationsBell component.
  late ZNotificationsBellModel zNotificationsBellModel;
  // Models for zCategoryCard dynamic component.
  late FlutterFlowDynamicModels<ZCategoryCardModel> zCategoryCardModels;
  // Models for zServicesSquareCard dynamic component.
  late FlutterFlowDynamicModels<ZServicesSquareCardModel>
      zServicesSquareCardModels;
  // Models for zServicesHorizontal dynamic component.
  late FlutterFlowDynamicModels<ZServicesHorizontalModel>
      zServicesHorizontalModels;
  // Model for zServicesCategories component.
  late ZServicesCategoriesModel zServicesCategoriesModel;
  // Model for zNawbar component.
  late ZNawbarModel zNawbarModel;

  @override
  void initState(BuildContext context) {
    zHomePageAddressModel = createModel(context, () => ZHomePageAddressModel());
    zNotificationsBellModel =
        createModel(context, () => ZNotificationsBellModel());
    zCategoryCardModels = FlutterFlowDynamicModels(() => ZCategoryCardModel());
    zServicesSquareCardModels =
        FlutterFlowDynamicModels(() => ZServicesSquareCardModel());
    zServicesHorizontalModels =
        FlutterFlowDynamicModels(() => ZServicesHorizontalModel());
    zServicesCategoriesModel =
        createModel(context, () => ZServicesCategoriesModel());
    zNawbarModel = createModel(context, () => ZNawbarModel());
  }

  @override
  void dispose() {
    zHomePageAddressModel.dispose();
    zNotificationsBellModel.dispose();
    zCategoryCardModels.dispose();
    zServicesSquareCardModels.dispose();
    zServicesHorizontalModels.dispose();
    zServicesCategoriesModel.dispose();
    zNawbarModel.dispose();
  }
}
