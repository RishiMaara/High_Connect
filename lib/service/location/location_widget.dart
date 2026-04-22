import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:url_launcher/url_launcher.dart';
import 'location_model.dart';
export 'location_model.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({
    super.key,
    required this.serviceDoc,
    this.addressDoc,
  });

  final ServicesRecord? serviceDoc;
  final AddressesRecord? addressDoc;

  static String routeName = 'Location';
  static String routePath = '/location';

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  late LocationModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LocationModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      if (widget.addressDoc != null) {
        _model.selectedApi = await DistanceTimeCall.call(
          destinations: widget.serviceDoc?.address,
          origins: widget.addressDoc?.address,
        );

        if ((_model.selectedApi?.succeeded ?? true)) {
          _model.distance = DistanceTimeCall.distance(
            (_model.selectedApi?.jsonBody ?? ''),
          );
          _model.time = DistanceTimeCall.time(
            (_model.selectedApi?.jsonBody ?? ''),
          );
          _model.geopoints = functions
              .geopointsList(
                  widget.serviceDoc!.geopoint!, widget.addressDoc!.geopoint!)
              .toList()
              .cast<LatLng>();
          safeSetState(() {});
        }
        await _model.googleMapsController.future.then(
          (c) => c.animateCamera(
            CameraUpdate.newLatLng(functions
                .giveCenterLocations(widget.serviceDoc!.geopoint!,
                    widget.addressDoc!.geopoint!)
                .toGoogleMaps()),
          ),
        );
      } else {
        _model.apiResulted7 = await AddressCall.call(
          latlng: currentUserLocationValue?.toString(),
        );

        if ((_model.apiResulted7?.succeeded ?? true)) {
          _model.apiResulthxd = await DistanceTimeCall.call(
            destinations: widget.serviceDoc?.address,
            origins: AddressCall.address(
              (_model.apiResulted7?.jsonBody ?? ''),
            )?.elementAtOrNull(0),
          );

          if ((_model.apiResulthxd?.succeeded ?? true)) {
            _model.distance = DistanceTimeCall.distance(
              (_model.apiResulthxd?.jsonBody ?? ''),
            );
            _model.time = DistanceTimeCall.time(
              (_model.apiResulthxd?.jsonBody ?? ''),
            );
            _model.geopoints = functions
                .geopointsList(widget.serviceDoc!.geopoint!,
                    widget.addressDoc!.geopoint!)
                .toList()
                .cast<LatLng>();
            safeSetState(() {});
          }
          await _model.googleMapsController.future.then(
            (c) => c.animateCamera(
              CameraUpdate.newLatLng(functions
                  .giveCenterLocations(
                      widget.serviceDoc!.geopoint!, currentUserLocationValue!)
                  .toGoogleMaps()),
            ),
          );
        }
      }
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 35.0,
            height: 35.0,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: FlutterFlowTheme.of(context).optionalColor,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).optionalColor2,
          automaticallyImplyLeading: false,
          leading: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 22.0,
              borderWidth: 1.0,
              buttonSize: 44.0,
              icon: Icon(
                FFIcons.karrowLeft,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24.0,
              ),
              onPressed: () async {
                context.safePop();
              },
            ),
          ),
          title: Text(
            'Location',
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  font: GoogleFonts.inter(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                  ),
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                ),
          ),
          actions: [
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 6.0, 6.0),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 22.0,
                  borderWidth: 1.0,
                  buttonSize: 44.0,
                  icon: Icon(
                    FFIcons.kphoneCall01,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    // Get the phone number from service provider
                    final phoneNumber = widget.serviceDoc?.phoneNumber;
                    
                    // Validate phone number exists
                    if (phoneNumber == null || phoneNumber.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Phone number not available for this service provider'),
                          backgroundColor: FlutterFlowTheme.of(context).error,
                        ),
                      );
                      return;
                    }
                    
                    // Log the call in Firestore
                    await CallsRecord.collection.doc().set({
                      ...createCallsRecordData(
                        callAccepted: true,
                        callType: 0,
                        callTime: getCurrentTimestamp,
                        outgoing: currentUserReference,
                      ),
                      ...mapToFirestore(
                        {
                          'users_ref': functions.usersRefList(
                              widget.serviceDoc!.provider!,
                              currentUserReference!),
                        },
                      ),
                    });
                    
                    // Format phone number (ensure it has country code)
                    String formattedNumber = phoneNumber;
                    if (!phoneNumber.startsWith('+')) {
                      formattedNumber = '+91$phoneNumber'; // Default to India
                    }
                    
                    // Launch native phone dialer
                    final telUri = Uri(scheme: 'tel', path: formattedNumber);
                    if (await canLaunchUrl(telUri)) {
                      await launchUrl(telUri, mode: LaunchMode.externalApplication);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Could not open phone dialer'),
                          backgroundColor: FlutterFlowTheme.of(context).error,
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 6.0, 6.0),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 22.0,
                  borderWidth: 1.0,
                  buttonSize: 44.0,
                  icon: Icon(
                    FFIcons.kmessage,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.pushNamed(
                      ChatWidget.routeName,
                      queryParameters: {
                        'userRef': serializeParam(
                          widget.serviceDoc?.provider,
                          ParamType.DocumentReference,
                        ),
                      }.withoutNulls,
                    );
                  },
                ),
              ),
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).optionalColor2,
              ),
            ),
          ),
          centerTitle: false,
          elevation: 0.0,
        ),
        body: Stack(
          children: [
            FlutterFlowGoogleMap(
              controller: _model.googleMapsController,
              onCameraIdle: (latLng) => _model.googleMapsCenter = latLng,
              initialLocation: _model.googleMapsCenter ??=
                  LatLng(13.106061, -59.613158),
              markers: _model.geopoints
                  .map(
                    (marker) => FlutterFlowMarker(
                      marker.serialize(),
                      marker,
                    ),
                  )
                  .toList(),
              markerColor: GoogleMarkerColor.violet,
              mapType: MapType.normal,
              style: GoogleMapStyle.standard,
              initialZoom: 14.0,
              allowInteraction: true,
              allowZoom: false,
              showZoomControls: false,
              showLocation: false,
              showCompass: false,
              showMapToolbar: false,
              showTraffic: false,
              centerMapOnMarkerTap: true,
            ),
            PointerInterceptor(
              intercepting: isWeb,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: custom_widgets.PolylineMap(
                  width: double.infinity,
                  height: double.infinity,
                  googleApiKey: 'AIzaSyC_65oMwzqZmTq9qOQHJM1L1d-r79ZiK8k',
                  originLatitude: functions.extractLatLng(
                      widget.addressDoc != null
                          ? widget.addressDoc!.geopoint!
                          : currentUserLocationValue!,
                      false),
                  originLongitude: functions.extractLatLng(
                      widget.addressDoc != null
                          ? widget.addressDoc!.geopoint!
                          : currentUserLocationValue!,
                      true),
                  destinationLatitude: functions.extractLatLng(
                      widget.serviceDoc!.geopoint!, false),
                  destinationLongitude: functions.extractLatLng(
                      widget.serviceDoc!.geopoint!, true),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: PointerInterceptor(
                intercepting: isWeb,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).optionalColor2,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 12.0,
                        color: FlutterFlowTheme.of(context).shadow,
                        offset: Offset(
                          0.0,
                          -4.0,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.serviceDoc?.title,
                              'null',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                  lineHeight: 1.5,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.serviceDoc?.category,
                              'null',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                  lineHeight: 1.0,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            height: 73.0,
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      11.0, 0.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      StyledVerticalDivider(
                                        width: 1.5,
                                        thickness: 1.5,
                                        indent: 23.0,
                                        endIndent: 23.0,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        lineStyle: DividerLineStyle.dashed,
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 12.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            Icons.radio_button_checked,
                                            color: FlutterFlowTheme.of(context)
                                                .success,
                                            size: 24.0,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                widget.serviceDoc?.address,
                                                'null',
                                              ).maybeHandleOverflow(
                                                maxChars: 30,
                                                replacement: '…',
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
                                                        lineHeight: 1.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Icon(
                                            FFIcons.kmarkerPin01,
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            size: 24.0,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                widget.addressDoc?.address,
                                                'null',
                                              ).maybeHandleOverflow(
                                                maxChars: 30,
                                                replacement: '…',
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
                                                        lineHeight: 1.0,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              // Get origin coordinates (user location or selected address)
                              final originLat = functions.extractLatLng(
                                  widget.addressDoc != null
                                      ? widget.addressDoc!.geopoint!
                                      : currentUserLocationValue!,
                                  false);
                              final originLng = functions.extractLatLng(
                                  widget.addressDoc != null
                                      ? widget.addressDoc!.geopoint!
                                      : currentUserLocationValue!,
                                  true);
                              
                              // Get destination coordinates (service provider location)
                              final destLat = functions.extractLatLng(
                                  widget.serviceDoc!.geopoint!, false);
                              final destLng = functions.extractLatLng(
                                  widget.serviceDoc!.geopoint!, true);
                              
                              // Create Google Maps URL with directions
                              final mapsUrl = Uri.parse(
                                  'https://www.google.com/maps/dir/?api=1&origin=${originLat},${originLng}&destination=${destLat},${destLng}&travelmode=driving');
                              
                              // Launch Google Maps
                              await launchUrl(mapsUrl);
                            },
                            text: 'View Location',
                            icon: Icon(
                              FFIcons.kmapPin,
                              size: 20.0,
                            ),
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 50.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
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
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        if (!valueOrDefault<bool>(
                            currentUserDocument?.inService, false))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 0.0),
                            child: AuthUserStreamWidget(
                              builder: (context) => FFButtonWidget(
                                onPressed: () async {
                                  if (widget.serviceDoc?.category ==
                                      'Cleaning Services') {
                                    context.pushNamed(
                                      BookingRoomsWidget.routeName,
                                      queryParameters: {
                                        'serviceDoc': serializeParam(
                                          widget.serviceDoc,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'serviceDoc': widget.serviceDoc,
                                      },
                                    );
                                  } else {
                                    context.pushNamed(
                                      BookingDateTimeWidget.routeName,
                                      queryParameters: {
                                        'serviceDoc': serializeParam(
                                          widget.serviceDoc,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'serviceDoc': widget.serviceDoc,
                                      },
                                    );
                                  }
                                },
                                text: 'Book service',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                        color:
                                            FlutterFlowTheme.of(context).info,
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
