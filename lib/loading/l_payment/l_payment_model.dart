import '/flutter_flow/flutter_flow_util.dart';
import 'l_payment_widget.dart' show LPaymentWidget;
import 'package:flutter/material.dart';

class LPaymentModel extends FlutterFlowModel<LPaymentWidget> {
  ///  Local state fields for this component.

  List<int> loadingList = [1, 2, 3, 4];
  void addToLoadingList(int item) => loadingList.add(item);
  void removeFromLoadingList(int item) => loadingList.remove(item);
  void removeAtIndexFromLoadingList(int index) => loadingList.removeAt(index);
  void insertAtIndexInLoadingList(int index, int item) =>
      loadingList.insert(index, item);
  void updateLoadingListAtIndex(int index, Function(int) updateFn) =>
      loadingList[index] = updateFn(loadingList[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
