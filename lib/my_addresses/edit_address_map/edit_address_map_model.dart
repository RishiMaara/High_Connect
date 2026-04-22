import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_address_map_widget.dart' show EditAddressMapWidget;
import 'package:flutter/material.dart';

class EditAddressMapModel extends FlutterFlowModel<EditAddressMapWidget> {
  ///  Local state fields for this page.

  LatLng? geopoint;

  String? address;

  String? city;

  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Stores action output result for [Backend Call - API (Address)] action in Container widget.
  ApiCallResponse? myLocation;
  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Places)] action in TextField widget.
  ApiCallResponse? placeApi;
  // Stores action output result for [Backend Call - API (getReference)] action in TextField widget.
  ApiCallResponse? placeGeo;
  // Stores action output result for [Backend Call - API (Address)] action in TextField widget.
  ApiCallResponse? apiResult6k7;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
  }
}
