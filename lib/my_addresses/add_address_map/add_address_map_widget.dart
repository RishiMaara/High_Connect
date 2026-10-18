import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'add_address_map_model.dart';
export 'add_address_map_model.dart';

class AddAddressMapWidget extends StatefulWidget {
  const AddAddressMapWidget({
    super.key,
    required this.backPage,
    this.serviceDoc,
  });

  final int? backPage;
  final ServicesRecord? serviceDoc;

  static String routeName = 'AddAddressMap';
  static String routePath = '/addAddressMap';

  @override
  State<AddAddressMapWidget> createState() => _AddAddressMapWidgetState();
}

class _AddAddressMapWidgetState extends State<AddAddressMapWidget> {
  late AddAddressMapModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;
  bool textFieldFocusListenerRegistered = false;
  bool _isLocating = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddAddressMapModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await _locateUser();
    });

    _model.textController ??= TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  Future<void> _locateUser() async {
    if (_isLocating) return;
    safeSetState(() => _isLocating = true);
    
    final defaultLocation = LatLng(19.0760, 72.8777);

    try {
      // 1. Check if location services are on
      final bool serviceEnabled = isWeb || await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please turn on GPS to detect your location.'),
              duration: Duration(seconds: 3),
            ),
          );
        }
        _setFallback(defaultLocation);
        return;
      }

      // 2. Request permission
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                permission == LocationPermission.deniedForever
                    ? 'Location permission permanently denied. Enable it in Settings → App Permissions.'
                    : 'Location permission denied. Tap the GPS button to try again.',
              ),
              duration: const Duration(seconds: 4),
            ),
          );
        }
        _setFallback(defaultLocation);
        return;
      }

      // 3. Show "detecting" state
      _model.address = 'Detecting your location...';
      _model.city = '';
      safeSetState(() {});

      // 4. Get position
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: defaultLocation);

      _model.geopoint = currentUserLocationValue;
      safeSetState(() {});

      // 5. Reverse geocode — retry once if first attempt fails
      ApiCallResponse? addressResult;
      for (int attempt = 0; attempt < 2; attempt++) {
        addressResult = await AddressCall.call(
          latlng: functions.latlngToString(currentUserLocationValue),
        );
        if (addressResult?.succeeded == true) break;
        if (attempt == 0) await Future.delayed(const Duration(seconds: 1));
      }

      if (addressResult?.succeeded == true) {
        final addr = AddressCall.address(addressResult!.jsonBody)?.elementAtOrNull(0);
        final city = AddressCall.address(addressResult.jsonBody)?.firstOrNull;
        _model.address = (addr != null && addr.isNotEmpty) ? addr : null;
        _model.city = city;
      } else {
        _model.address = null; // will show map drag hint
        _model.city = '';
      }
      safeSetState(() {});

      // 6. Animate camera
      if (currentUserLocationValue != null) {
        await _model.googleMapsController.future.then(
          (c) => c.animateCamera(
            CameraUpdate.newLatLngZoom(currentUserLocationValue!.toGoogleMaps(), 15.0),
          ),
        );
      }
    } catch (e) {
      debugPrint('Location error: $e');
      _setFallback(defaultLocation);
    } finally {
      safeSetState(() => _isLocating = false);
    }
  }

  void _setFallback(LatLng defaultLocation) {
    _model.geopoint = defaultLocation;
    _model.address = null; // show drag hint instead of ugly text
    _model.city = '';
    safeSetState(() {});
    _model.googleMapsController.future.then(
      (c) => c.animateCamera(
        CameraUpdate.newLatLngZoom(defaultLocation.toGoogleMaps(), 14.0),
      ),
    ).catchError((_) {});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            Builder(builder: (context) {
              final _googleMapMarker = _model.geopoint;
              return FlutterFlowGoogleMap(
                controller: _model.googleMapsController,
                onCameraIdle: (latLng) async {
                  _model.googleMapsCenter = latLng;
                  // Swiggy-like behavior: Reverse geocode on map drag end
                  _model.geopoint = latLng;
                  _model.apiResult1yw = await AddressCall.call(
                    latlng: functions.latlngToString(latLng),
                  );

                  if ((_model.apiResult1yw?.succeeded ?? true)) {
                    _model.address = AddressCall.address(
                      (_model.apiResult1yw?.jsonBody ?? ''),
                    )?.elementAtOrNull(0); // Use first result for better accuracy
                    _model.city = AddressCall.address(
                      (_model.apiResult1yw?.jsonBody ?? ''),
                    )?.firstOrNull; // This might need adjustment based on response structure
                    safeSetState(() {});
                  }
                },
                initialLocation: _model.googleMapsCenter ??=
                    LatLng(19.0760, 72.8777),
                markers: [
                  if (_googleMapMarker != null)
                    FlutterFlowMarker(
                      _googleMapMarker.serialize(),
                      _googleMapMarker,
                    ),
                ],
                markerColor: GoogleMarkerColor.red,
                mapType: MapType.normal,
                style: GoogleMapStyle.standard,
                initialZoom: 14.0,
                allowInteraction: true,
                allowZoom: true,
                showZoomControls: false,
                showLocation: false,
                showCompass: false,
                showMapToolbar: false,
                showTraffic: false,
                centerMapOnMarkerTap: true,
              );
            }),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: PointerInterceptor(
                intercepting: isWeb,
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(1.0, 1.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await _locateUser();
                          },
                          child: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 8.0,
                                  color: FlutterFlowTheme.of(context).shadow,
                                  offset: Offset(
                                    0.0,
                                    0.0,
                                  ),
                                  spreadRadius: 2.0,
                                )
                              ],
                              borderRadius: BorderRadius.circular(10.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Icon(
                              FFIcons.kmark,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                      // Address Card — shows loading, address, or drag hint
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 8.0,
                              color: FlutterFlowTheme.of(context).shadow,
                              offset: const Offset(0.0, 0.0),
                              spreadRadius: 2.0,
                            )
                          ],
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: _isLocating
                              // Loading state
                              ? Row(
                                  children: [
                                    SizedBox(
                                      width: 18.0,
                                      height: 18.0,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2.0,
                                        valueColor: AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12.0),
                                    Text(
                                      'Detecting your location...',
                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                        font: GoogleFonts.inter(),
                                        color: FlutterFlowTheme.of(context).secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                    ),
                                  ],
                                )
                              : (_model.address != null && _model.address!.isNotEmpty)
                                  // Address found
                                  ? Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              color: FlutterFlowTheme.of(context).primary,
                                              size: 20.0,
                                            ),
                                            const SizedBox(width: 8.0),
                                            Text(
                                              'Selected Location',
                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                font: GoogleFonts.inter(fontWeight: FontWeight.w600),
                                                color: FlutterFlowTheme.of(context).primary,
                                                letterSpacing: 0.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8.0),
                                        Text(
                                          _model.address!,
                                          maxLines: 3,
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            font: GoogleFonts.inter(fontWeight: FontWeight.w500),
                                            color: FlutterFlowTheme.of(context).primaryText,
                                            letterSpacing: 0.0,
                                          ),
                                        ),
                                        if (_model.city != null && _model.city!.isNotEmpty)
                                          Padding(
                                            padding: const EdgeInsets.only(top: 4.0),
                                            child: Text(
                                              _model.city!,
                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                font: GoogleFonts.inter(),
                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                letterSpacing: 0.0,
                                              ),
                                            ),
                                          ),
                                      ],
                                    )
                                  // No address yet — drag hint
                                  : Row(
                                      children: [
                                        Icon(
                                          Icons.touch_app_outlined,
                                          color: FlutterFlowTheme.of(context).secondaryText,
                                          size: 20.0,
                                        ),
                                        const SizedBox(width: 10.0),
                                        Text(
                                          'Drag the map to select your location',
                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                            font: GoogleFonts.inter(),
                                            color: FlutterFlowTheme.of(context).secondaryText,
                                            letterSpacing: 0.0,
                                          ),
                                        ),
                                      ],
                                    ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (_model.geopoint == null) return;

                          // If address is missing, retry reverse geocoding before proceeding
                          if (_model.address == null || _model.address!.isEmpty) {
                            safeSetState(() => _isLocating = true);
                            try {
                              final retry = await AddressCall.call(
                                latlng: functions.latlngToString(_model.geopoint),
                              );
                              if (retry?.succeeded == true) {
                                final addr = AddressCall.address(retry!.jsonBody)?.elementAtOrNull(0);
                                final city = AddressCall.address(retry.jsonBody)?.firstOrNull;
                                if (addr != null && addr.isNotEmpty) {
                                  _model.address = addr;
                                  _model.city = city;
                                  safeSetState(() {});
                                }
                              }
                            } catch (_) {}
                            safeSetState(() => _isLocating = false);
                          }

                          // Still no address after retry — show message, don't save coordinates
                          if (_model.address == null || _model.address!.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Could not detect address. Please drag the map to select your location.'),
                                duration: Duration(seconds: 3),
                              ),
                            );
                            return;
                          }

                          context.pushNamed(
                            AddressDetailsWidget.routeName,
                            queryParameters: {
                              'address': serializeParam(
                                _model.address,
                                ParamType.String,
                              ),
                              'geopoint': serializeParam(
                                _model.geopoint,
                                ParamType.LatLng,
                              ),
                              'city': serializeParam(
                                _model.city,
                                ParamType.String,
                              ),
                              'backPage': serializeParam(
                                widget.backPage,
                                ParamType.int,
                              ),
                              'serviceDoc': serializeParam(
                                widget.serviceDoc,
                                ParamType.Document,
                              ),
                            }.withoutNulls,
                            extra: <String, dynamic>{
                              'serviceDoc': widget.serviceDoc,
                            },
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 8.0,
                                color: FlutterFlowTheme.of(context).shadow,
                                offset: Offset(
                                  0.0,
                                  0.0,
                                ),
                                spreadRadius: 2.0,
                              )
                            ],
                            borderRadius: BorderRadius.circular(10.0),
                            shape: BoxShape.rectangle,
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            'Continue',
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context).info,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 15.0)),
                  ),
                ),
              ),
            ),
            PointerInterceptor(
              intercepting: isWeb,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15.0, 50.0, 15.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.safePop();
                          },
                          child: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 8.0,
                                  color: FlutterFlowTheme.of(context).shadow,
                                  offset: Offset(
                                    0.0,
                                    0.0,
                                  ),
                                  spreadRadius: 2.0,
                                )
                              ],
                              borderRadius: BorderRadius.circular(10.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Icon(
                              FFIcons.kxClose,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 8.0,
                                  color: FlutterFlowTheme.of(context).shadow,
                                  offset: Offset(
                                    0.0,
                                    0.0,
                                  ),
                                  spreadRadius: 2.0,
                                )
                              ],
                              borderRadius: BorderRadius.circular(10.0),
                              shape: BoxShape.rectangle,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: FutureBuilder<ApiCallResponse>(
                                    future: PlacesCall.call(
                                      input: _model.textController.text,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 35.0,
                                            height: 35.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      final textFieldPlacesResponse =
                                          snapshot.data!;

                                      return Container(
                                        width: 200.0,
                                        child: Autocomplete<String>(
                                          initialValue: TextEditingValue(),
                                          optionsBuilder: (textEditingValue) {
                                            if (textEditingValue.text == '') {
                                              return const Iterable<
                                                  String>.empty();
                                            }
                                            return PlacesCall.addresses(
                                              textFieldPlacesResponse.jsonBody,
                                            )!
                                                .where((option) {
                                              final lowercaseOption =
                                                  option.toLowerCase();
                                              return lowercaseOption.contains(
                                                  textEditingValue.text
                                                      .toLowerCase());
                                            });
                                          },
                                          optionsViewBuilder:
                                              (context, onSelected, options) {
                                            return AutocompleteOptionsList(
                                              textFieldKey: _model.textFieldKey,
                                              textController:
                                                  _model.textController!,
                                              options: options.toList(),
                                              onSelected: onSelected,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                              textHighlightStyle: TextStyle(),
                                              elevation: 4.0,
                                              optionBackgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .optionalColor,
                                              optionHighlightColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              maxHeight: 200.0,
                                            );
                                          },
                                          onSelected: (String selection) {
                                            safeSetState(() =>
                                                _model.textFieldSelectedOption =
                                                    selection);
                                            FocusScope.of(context).unfocus();
                                          },
                                          fieldViewBuilder: (
                                            context,
                                            textEditingController,
                                            focusNode,
                                            onEditingComplete,
                                          ) {
                                            _model.textFieldFocusNode =
                                                focusNode;
                                            if (!textFieldFocusListenerRegistered) {
                                              textFieldFocusListenerRegistered =
                                                  true;
                                              _model.textFieldFocusNode!
                                                  .addListener(
                                                () async {
                                                  _model.placeApi =
                                                      await PlacesCall.call(
                                                    input: _model
                                                        .textController.text,
                                                  );

                                                  if ((_model.placeApi
                                                          ?.succeeded ??
                                                      true)) {
                                                    _model.placeGeo =
                                                        await GetReferenceCall
                                                            .call(
                                                      placeid:
                                                          PlacesCall.placeId(
                                                        (_model.placeApi
                                                                ?.jsonBody ??
                                                            ''),
                                                      )?.firstOrNull,
                                                    );

                                                    if ((_model.placeGeo
                                                            ?.succeeded ??
                                                        true)) {
                                                      _model.apiResult6k7 =
                                                          await AddressCall
                                                              .call(
                                                        latlng: functions
                                                            .doubleToString(
                                                                GetReferenceCall
                                                                    .lat(
                                                                  (_model.placeGeo
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                GetReferenceCall
                                                                    .lng(
                                                                  (_model.placeGeo
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )),
                                                      );

                                                      if ((_model.apiResult6k7
                                                              ?.succeeded ??
                                                          true)) {
                                                        _model.address =
                                                            AddressCall.address(
                                                          (_model.apiResult6k7
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )?.elementAtOrNull(0);
                                                        _model.city =
                                                            AddressCall.address(
                                                          (_model.apiResult6k7
                                                                  ?.jsonBody ??
                                                              ''),
                                                        )?.firstOrNull;
                                                        _model.geopoint = functions
                                                            .doubleToLatLng(
                                                                GetReferenceCall
                                                                    .lat(
                                                                  (_model.placeGeo
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ),
                                                                GetReferenceCall
                                                                    .lng(
                                                                  (_model.placeGeo
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                ));
                                                        safeSetState(() {});
                                                        await _model
                                                            .googleMapsController
                                                            .future
                                                            .then(
                                                          (c) =>
                                                              c.animateCamera(
                                                            CameraUpdate.newLatLng(
                                                                functions
                                                                    .doubleToLatLng(
                                                                        GetReferenceCall
                                                                            .lat(
                                                                          (_model.placeGeo?.jsonBody ??
                                                                              ''),
                                                                        ),
                                                                        GetReferenceCall
                                                                            .lng(
                                                                          (_model.placeGeo?.jsonBody ??
                                                                              ''),
                                                                        ))!
                                                                    .toGoogleMaps()),
                                                          ),
                                                        );
                                                      }
                                                    }
                                                  }

                                                  safeSetState(() {});
                                                },
                                              );
                                            }
                                            _model.textController =
                                                textEditingController;
                                            return TextFormField(
                                              key: _model.textFieldKey,
                                              controller: textEditingController,
                                              focusNode: focusNode,
                                              onEditingComplete:
                                                  onEditingComplete,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.textController',
                                                Duration(milliseconds: 0),
                                                () => safeSetState(() {}),
                                              ),
                                              autofocus: false,
                                              textInputAction:
                                                  TextInputAction.done,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: false,
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                hintText: 'Enter address',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(24.0),
                                                    bottomRight:
                                                        Radius.circular(0.0),
                                                    topLeft:
                                                        Radius.circular(24.0),
                                                    topRight:
                                                        Radius.circular(0.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(24.0),
                                                    bottomRight:
                                                        Radius.circular(0.0),
                                                    topLeft:
                                                        Radius.circular(24.0),
                                                    topRight:
                                                        Radius.circular(0.0),
                                                  ),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(24.0),
                                                    bottomRight:
                                                        Radius.circular(0.0),
                                                    topLeft:
                                                        Radius.circular(24.0),
                                                    topRight:
                                                        Radius.circular(0.0),
                                                  ),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(24.0),
                                                    bottomRight:
                                                        Radius.circular(0.0),
                                                    topLeft:
                                                        Radius.circular(24.0),
                                                    topRight:
                                                        Radius.circular(0.0),
                                                  ),
                                                ),
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(24.0, 0.0,
                                                            16.0, 0.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              validator: _model
                                                  .textControllerValidator
                                                  .asValidator(context),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderRadius: 24.0,
                                  buttonSize: 48.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).transparent,
                                  icon: Icon(
                                    FFIcons.ksearchMd,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () {
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ].divide(SizedBox(width: 10.0)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
