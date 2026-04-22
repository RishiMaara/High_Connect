import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'z_service_address_map_widget.dart' show ZServiceAddressMapWidget;
import 'package:flutter/material.dart';

class ZServiceAddressMapModel
    extends FlutterFlowModel<ZServiceAddressMapWidget> {
  ///  Local state fields for this component.

  String? address;

  String? city;

  LatLng? geopoint;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Address)] action in zServiceAddressMap widget.
  ApiCallResponse? addressFirst;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
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
  // Stores action output result for [Backend Call - API (Address)] action in Container widget.
  ApiCallResponse? apiResult1yw;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
  }
}
