import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'reschedule_booking_widget.dart' show RescheduleBookingWidget;
import 'package:flutter/material.dart';

class RescheduleBookingModel extends FlutterFlowModel<RescheduleBookingWidget> {
  ///  Local state fields for this page.

  DateTime? availableDate;

  AvailableTimeStruct? availableTime;
  void updateAvailableTimeStruct(Function(AvailableTimeStruct) updateFn) {
    updateFn(availableTime ??= AvailableTimeStruct());
  }

  int? workingHours = 1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
