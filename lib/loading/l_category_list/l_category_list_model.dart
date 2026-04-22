import '/flutter_flow/flutter_flow_util.dart';
import 'l_category_list_widget.dart' show LCategoryListWidget;
import 'package:flutter/material.dart';

class LCategoryListModel extends FlutterFlowModel<LCategoryListWidget> {
  ///  Local state fields for this component.

  List<int> loading = [1, 2, 3, 4, 5, 6, 7, 8];
  void addToLoading(int item) => loading.add(item);
  void removeFromLoading(int item) => loading.remove(item);
  void removeAtIndexFromLoading(int index) => loading.removeAt(index);
  void insertAtIndexInLoading(int index, int item) =>
      loading.insert(index, item);
  void updateLoadingAtIndex(int index, Function(int) updateFn) =>
      loading[index] = updateFn(loading[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
