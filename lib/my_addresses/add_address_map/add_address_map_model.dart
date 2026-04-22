import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'add_address_map_widget.dart' show AddAddressMapWidget;
import 'package:flutter/material.dart';

class AddAddressMapModel extends FlutterFlowModel<AddAddressMapWidget> {
  ///  Local state fields for this page.

  bool? timer = false;

  String? address;

  String? city;

  LatLng? geopoint;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Address)] action in AddAddressMap widget.
  ApiCallResponse? addressFirst;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Stores action output result for [Backend Call - API (Address)] action in Container widget.
  ApiCallResponse? apiResult1yw;
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
