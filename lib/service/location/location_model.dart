import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'location_widget.dart' show LocationWidget;
import 'package:flutter/material.dart';

class LocationModel extends FlutterFlowModel<LocationWidget> {
  ///  Local state fields for this page.

  String? distance;

  String? time;

  List<LatLng> geopoints = [];
  void addToGeopoints(LatLng item) => geopoints.add(item);
  void removeFromGeopoints(LatLng item) => geopoints.remove(item);
  void removeAtIndexFromGeopoints(int index) => geopoints.removeAt(index);
  void insertAtIndexInGeopoints(int index, LatLng item) =>
      geopoints.insert(index, item);
  void updateGeopointsAtIndex(int index, Function(LatLng) updateFn) =>
      geopoints[index] = updateFn(geopoints[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (distanceTime)] action in Location widget.
  ApiCallResponse? selectedApi;
  // Stores action output result for [Backend Call - API (Address)] action in Location widget.
  ApiCallResponse? apiResulted7;
  // Stores action output result for [Backend Call - API (distanceTime)] action in Location widget.
  ApiCallResponse? apiResulthxd;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
