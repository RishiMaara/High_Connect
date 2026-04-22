import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home/components/z_category_card/z_category_card_widget.dart';
import '/home/components/z_services_full_width/z_services_full_width_widget.dart';
import '/home/z_services_square_card/z_services_square_card_widget.dart';
import '/index.dart';
import 'search_widget.dart' show SearchWidget;
import 'package:flutter/material.dart';

class SearchModel extends FlutterFlowModel<SearchWidget> {
  ///  Local state fields for this page.

  // Popular searches - EXACT names from Allcatagories2Widget.categories (not shown on Home)
  List<String> popularSearches = [
    'Bridge Design Engineer',
    'BIM Engineer',
    'Construction Planner / Scheduler',
    'Asset Management Engineer',
    'Climate Resilience Engineer',
    'Coastal / Ocean Engineer',
    'Land Surveyor',
  ];
  void addToPopularSearches(String item) => popularSearches.add(item);
  void removeFromPopularSearches(String item) => popularSearches.remove(item);
  void removeAtIndexFromPopularSearches(int index) =>
      popularSearches.removeAt(index);
  void insertAtIndexInPopularSearches(int index, String item) =>
      popularSearches.insert(index, item);
  void updatePopularSearchesAtIndex(int index, Function(String) updateFn) =>
      popularSearches[index] = updateFn(popularSearches[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<ServicesRecord> simpleSearchResults = [];
  // Models for zServicesFullWidth dynamic component.
  late FlutterFlowDynamicModels<ZServicesFullWidthModel>
      zServicesFullWidthModels;
  // Models for zCategoryCard dynamic component.
  late FlutterFlowDynamicModels<ZCategoryCardModel> zCategoryCardModels;
  // Models for zServicesSquareCard dynamic component.
  late FlutterFlowDynamicModels<ZServicesSquareCardModel>
      zServicesSquareCardModels;

  @override
  void initState(BuildContext context) {
    zServicesFullWidthModels =
        FlutterFlowDynamicModels(() => ZServicesFullWidthModel());
    zCategoryCardModels = FlutterFlowDynamicModels(() => ZCategoryCardModel());
    zServicesSquareCardModels =
        FlutterFlowDynamicModels(() => ZServicesSquareCardModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    zServicesFullWidthModels.dispose();
    zCategoryCardModels.dispose();
    zServicesSquareCardModels.dispose();
  }
}
