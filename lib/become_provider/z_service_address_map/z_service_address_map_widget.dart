import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'z_service_address_map_model.dart';
export 'z_service_address_map_model.dart';

class ZServiceAddressMapWidget extends StatefulWidget {
  const ZServiceAddressMapWidget({super.key});

  @override
  State<ZServiceAddressMapWidget> createState() =>
      _ZServiceAddressMapWidgetState();
}

class _ZServiceAddressMapWidgetState extends State<ZServiceAddressMapWidget> {
  late ZServiceAddressMapModel _model;

  LatLng? currentUserLocationValue;
  bool textFieldFocusListenerRegistered = false;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZServiceAddressMapModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      _model.addressFirst = await AddressCall.call(
        latlng: functions.latlngToString(currentUserLocationValue),
      );

      if ((_model.addressFirst?.succeeded ?? true)) {
        _model.address = AddressCall.address(
          (_model.addressFirst?.jsonBody ?? ''),
        )?.elementAtOrNull(0);
        _model.city = AddressCall.address(
          (_model.addressFirst?.jsonBody ?? ''),
        )?.firstOrNull;
        _model.geopoint = currentUserLocationValue;
        safeSetState(() {});
      }
      await _model.googleMapsController.future.then(
        (c) => c.animateCamera(
          CameraUpdate.newLatLng(currentUserLocationValue!.toGoogleMaps()),
        ),
      );
    });

    _model.textController ??= TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).optionalColor2,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).optionalColor2,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(6.0, 6.0, 0.0, 6.0),
                        child: FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 22.0,
                          borderWidth: 1.0,
                          buttonSize: 44.0,
                          icon: Icon(
                            FFIcons.kxClose,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 65.0, 0.0),
                        child: Text(
                          'Add Address',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .fontStyle,
                                lineHeight: 1.0,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.8,
                child: Stack(
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
                            )?.elementAtOrNull(0);
                            _model.city = AddressCall.address(
                              (_model.apiResult1yw?.jsonBody ?? ''),
                            )?.firstOrNull;
                            safeSetState(() {});
                          }
                        },
                        initialLocation: _model.googleMapsCenter ??=
                            LatLng(40.7143, -74.006),
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
                    PointerInterceptor(
                      intercepting: isWeb,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 15.0, 15.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 8.0,
                                          color: FlutterFlowTheme.of(context)
                                              .shadow,
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
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
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
                                                  initialValue:
                                                      TextEditingValue(),
                                                  optionsBuilder:
                                                      (textEditingValue) {
                                                    if (textEditingValue.text ==
                                                        '') {
                                                      return const Iterable<
                                                          String>.empty();
                                                    }
                                                    return PlacesCall.addresses(
                                                      textFieldPlacesResponse
                                                          .jsonBody,
                                                    )!
                                                        .where((option) {
                                                      final lowercaseOption =
                                                          option.toLowerCase();
                                                      return lowercaseOption
                                                          .contains(
                                                              textEditingValue
                                                                  .text
                                                                  .toLowerCase());
                                                    });
                                                  },
                                                  optionsViewBuilder: (context,
                                                      onSelected, options) {
                                                    return AutocompleteOptionsList(
                                                      textFieldKey:
                                                          _model.textFieldKey,
                                                      textController: _model
                                                          .textController!,
                                                      options: options.toList(),
                                                      onSelected: onSelected,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                      textHighlightStyle:
                                                          TextStyle(),
                                                      elevation: 4.0,
                                                      optionBackgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .optionalColor,
                                                      optionHighlightColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      maxHeight: 200.0,
                                                    );
                                                  },
                                                  onSelected:
                                                      (String selection) {
                                                    safeSetState(() => _model
                                                            .textFieldSelectedOption =
                                                        selection);
                                                    FocusScope.of(context)
                                                        .unfocus();
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
                                                              await PlacesCall
                                                                  .call(
                                                            input: _model
                                                                .textController
                                                                .text,
                                                          );

                                                          if ((_model.placeApi
                                                                  ?.succeeded ??
                                                              true)) {
                                                            _model.placeGeo =
                                                                await GetReferenceCall
                                                                    .call(
                                                              placeid:
                                                                  PlacesCall
                                                                      .placeId(
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
                                                                          (_model.placeGeo?.jsonBody ??
                                                                              ''),
                                                                        ),
                                                                        GetReferenceCall
                                                                            .lng(
                                                                          (_model.placeGeo?.jsonBody ??
                                                                              ''),
                                                                        )),
                                                              );

                                                              if ((_model
                                                                      .apiResult6k7
                                                                      ?.succeeded ??
                                                                  true)) {
                                                                _model.address =
                                                                    AddressCall
                                                                        .address(
                                                                  (_model.apiResult6k7
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )?.elementAtOrNull(
                                                                        0);
                                                                _model.city =
                                                                    AddressCall
                                                                        .address(
                                                                  (_model.apiResult6k7
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )?.firstOrNull;
                                                                _model.geopoint = functions
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
                                                                        ));
                                                                safeSetState(
                                                                    () {});
                                                                await _model
                                                                    .googleMapsController
                                                                    .future
                                                                    .then(
                                                                  (c) => c
                                                                      .animateCamera(
                                                                    CameraUpdate.newLatLng(functions
                                                                        .doubleToLatLng(
                                                                            GetReferenceCall.lat(
                                                                              (_model.placeGeo?.jsonBody ?? ''),
                                                                            ),
                                                                            GetReferenceCall.lng(
                                                                              (_model.placeGeo?.jsonBody ?? ''),
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
                                                      controller:
                                                          textEditingController,
                                                      focusNode: focusNode,
                                                      onEditingComplete:
                                                          onEditingComplete,
                                                      onChanged: (_) =>
                                                          EasyDebounce.debounce(
                                                        '_model.textController',
                                                        Duration(
                                                            milliseconds: 0),
                                                        () =>
                                                            safeSetState(() {}),
                                                      ),
                                                      autofocus: false,
                                                      textInputAction:
                                                          TextInputAction.done,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        isDense: false,
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                        hintText:
                                                            'Enter address',
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .fontStyle,
                                                                ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    24.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    0.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    24.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    0.0),
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: Color(
                                                                0x00000000),
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    24.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    0.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    24.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    0.0),
                                                          ),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    24.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    0.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    24.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    0.0),
                                                          ),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    24.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    0.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    24.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    0.0),
                                                          ),
                                                        ),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                      cursorColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                              FlutterFlowTheme.of(context)
                                                  .transparent,
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
                            if (_model.address != null && _model.address != '')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    _model.address,
                                    'null',
                                  ),
                                  maxLines: 2,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmall
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .infoBlack,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontStyle,
                                      ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.0, 1.0),
                      child: PointerInterceptor(
                        intercepting: isWeb,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 15.0, 15.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              currentUserLocationValue =
                                  await getCurrentUserLocation(
                                      defaultLocation: LatLng(0.0, 0.0));
                              _model.apiResult1yw = await AddressCall.call(
                                latlng: functions
                                    .latlngToString(currentUserLocationValue),
                              );

                              if ((_model.apiResult1yw?.succeeded ?? true)) {
                                _model.address = AddressCall.address(
                                  (_model.apiResult1yw?.jsonBody ?? ''),
                                )?.elementAtOrNull(0);
                                _model.city = AddressCall.address(
                                  (_model.apiResult1yw?.jsonBody ?? ''),
                                )?.firstOrNull;
                                _model.geopoint = currentUserLocationValue;
                                safeSetState(() {});
                              }
                              await _model.googleMapsController.future.then(
                                (c) => c.animateCamera(
                                  CameraUpdate.newLatLng(
                                      currentUserLocationValue!.toGoogleMaps()),
                                ),
                              );

                              safeSetState(() {});
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).optionalColor2,
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
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                  topLeft: Radius.circular(0.0),
                  topRight: Radius.circular(0.0),
                ),
                shape: BoxShape.rectangle,
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (_model.address != null && _model.address != '') {
                      FFAppState().serviceAddress = AddressStruct(
                        address: _model.address,
                        cityTown: _model.city,
                        geopoint: _model.geopoint,
                      );
                      _model.updatePage(() {});
                      Navigator.pop(context);
                    }
                  },
                  text: 'Continue',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle:
                        FlutterFlowTheme.of(context).titleMedium.override(
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
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
