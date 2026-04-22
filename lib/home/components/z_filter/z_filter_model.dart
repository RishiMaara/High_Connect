import '/flutter_flow/flutter_flow_util.dart';
import 'z_filter_widget.dart' show ZFilterWidget;
import 'package:flutter/material.dart';

class ZFilterModel extends FlutterFlowModel<ZFilterWidget> {
  ///  Local state fields for this component.

  List<String> selectedCategories = [];
  void addToSelectedCategories(String item) => selectedCategories.add(item);
  void removeFromSelectedCategories(String item) =>
      selectedCategories.remove(item);
  void removeAtIndexFromSelectedCategories(int index) =>
      selectedCategories.removeAt(index);
  void insertAtIndexInSelectedCategories(int index, String item) =>
      selectedCategories.insert(index, item);
  void updateSelectedCategoriesAtIndex(int index, Function(String) updateFn) =>
      selectedCategories[index] = updateFn(selectedCategories[index]);

  double? rating = 0.0;

  double? start = 0.0;

  double? end = 50000.0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
