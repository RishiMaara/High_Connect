import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'z_addresses_card_model.dart';
export 'z_addresses_card_model.dart';

class ZAddressesCardWidget extends StatefulWidget {
  const ZAddressesCardWidget({
    super.key,
    required this.addressDoc,
  });

  final AddressesRecord? addressDoc;

  @override
  State<ZAddressesCardWidget> createState() => _ZAddressesCardWidgetState();
}

class _ZAddressesCardWidgetState extends State<ZAddressesCardWidget> {
  late ZAddressesCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZAddressesCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          context.pushNamed(
            EditAddressWidget.routeName,
            queryParameters: {
              'addressDoc': serializeParam(
                widget.addressDoc,
                ParamType.Document,
              ),
            }.withoutNulls,
            extra: <String, dynamic>{
              'addressDoc': widget.addressDoc,
            },
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 48.0,
                        height: 48.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).accent1,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            if (widget.addressDoc?.type == 0) {
                              return Icon(
                                FFIcons.khome05w1,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24.0,
                              );
                            } else if (widget.addressDoc?.type == 1) {
                              return Icon(
                                FFIcons.kluggage02w1,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24.0,
                              );
                            } else {
                              return Icon(
                                FFIcons.kmarkerPin01w1,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24.0,
                              );
                            }
                          },
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              15.0, 3.0, 15.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  () {
                                    if (widget.addressDoc?.type == 0) {
                                      return 'Home';
                                    } else if (widget.addressDoc?.type == 1) {
                                      return 'Office';
                                    } else {
                                      return widget.addressDoc?.address;
                                    }
                                  }(),
                                  'null',
                                ).maybeHandleOverflow(
                                  maxChars: 24,
                                  replacement: '…',
                                ),
                                maxLines: 1,
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
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                      lineHeight: 1.0,
                                    ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.addressDoc?.type == 2
                                        ? widget.addressDoc?.cityTown
                                        : widget.addressDoc?.address,
                                    'null',
                                  ).maybeHandleOverflow(
                                    maxChars: 32,
                                    replacement: '…',
                                  ),
                                  maxLines: 1,
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontStyle,
                                        lineHeight: 1.5,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  FFIcons.kchevronRight,
                  color: FlutterFlowTheme.of(context).icons,
                  size: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
