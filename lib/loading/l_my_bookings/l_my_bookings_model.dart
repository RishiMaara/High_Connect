import '/flutter_flow/flutter_flow_util.dart';
import 'l_my_bookings_widget.dart' show LMyBookingsWidget;
import 'package:flutter/material.dart';

class LMyBookingsModel extends FlutterFlowModel<LMyBookingsWidget> {
  ///  Local state fields for this component.

  List<int> loading = [1, 2];
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
