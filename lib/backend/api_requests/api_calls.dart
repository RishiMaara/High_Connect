import 'dart:convert';


import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

// Firebase Functions base URL
const String _firebaseFunctionsBaseUrl = 'https://us-central1-high-connect-3.cloudfunctions.net';

class PlacesAutocompleteCall {
  static Future<ApiCallResponse> call({
    String? input = '',
  }) async {
    // Use Firebase Function endpoint to avoid CORS issues
    return ApiManager.instance.makeApiCall(
      callName: 'PlacesAutocomplete',
      apiUrl: '$_firebaseFunctionsBaseUrl/googlePlacesAutocomplete',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'input': input,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? placeId(dynamic response) => (getJsonField(
        response,
        r'''$.predictions[:].place_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? addresses(dynamic response) => (getJsonField(
        response,
        r'''$.predictions[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PlacesCall {
  static Future<ApiCallResponse> call({
    String? input = '',
  }) async {
    // Use Firebase Function endpoint to avoid CORS issues (same as PlacesAutocompleteCall)
    return ApiManager.instance.makeApiCall(
      callName: 'Places',
      apiUrl: '$_firebaseFunctionsBaseUrl/googlePlacesAutocomplete',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'input': input,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? placeId(dynamic response) => (getJsonField(
        response,
        r'''$.predictions[:].place_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? addresses(dynamic response) => (getJsonField(
        response,
        r'''$.predictions[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class AddressCall {
  static Future<ApiCallResponse> call({
    String? latlng = '',
  }) async {
    // Use Firebase Function endpoint to avoid CORS issues
    return ApiManager.instance.makeApiCall(
      callName: 'Address',
      apiUrl: '$_firebaseFunctionsBaseUrl/googleGeocode',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'latlng': latlng,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? address(dynamic response) => (getJsonField(
        response,
        r'''$.results[:].formatted_address''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetReferenceCall {
  static Future<ApiCallResponse> call({
    String? placeid = '',
  }) async {
    // Use Firebase Function endpoint to avoid CORS issues
    return ApiManager.instance.makeApiCall(
      callName: 'getReference',
      apiUrl: '$_firebaseFunctionsBaseUrl/googlePlaceDetails',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'place_id': placeid,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static double? lat(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.result.geometry.location.lat''',
      ));
  static double? lng(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.result.geometry.location.lng''',
      ));
}

class DistanceTimeCall {
  static Future<ApiCallResponse> call({
    String? destinations = '',
    String? origins = '',
  }) async {
    // Use Firebase Function endpoint to avoid CORS issues
    return ApiManager.instance.makeApiCall(
      callName: 'distanceTime',
      apiUrl: '$_firebaseFunctionsBaseUrl/googleDistanceMatrix',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'origins': origins,
        'destinations': destinations,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? time(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.rows[:].elements[:].duration.text''',
      ));
  static String? distance(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.rows[:].elements[:].distance.text''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
