import '/backend/backend.dart';
import '/empty/empty_service_review/empty_service_review_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/service/z_review_card/z_review_card_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'z_service_reviews_list_model.dart';
export 'z_service_reviews_list_model.dart';

class ZServiceReviewsListWidget extends StatefulWidget {
  const ZServiceReviewsListWidget({
    super.key,
    required this.serviceRef,
  });

  final DocumentReference? serviceRef;

  @override
  State<ZServiceReviewsListWidget> createState() =>
      _ZServiceReviewsListWidgetState();
}

class _ZServiceReviewsListWidgetState extends State<ZServiceReviewsListWidget> {
  late ZServiceReviewsListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZServiceReviewsListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Reviews',
                style: FlutterFlowTheme.of(context).headlineSmall.override(
                      font: GoogleFonts.inter(
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .fontWeight,
                        fontStyle: FlutterFlowTheme.of(context)
                            .headlineSmall
                            .fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                      lineHeight: 1.0,
                    ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  context.pushNamed(
                    ReviewsListWidget.routeName,
                    queryParameters: {
                      'serviceRef': serializeParam(
                        widget.serviceRef,
                        ParamType.DocumentReference,
                      ),
                    }.withoutNulls,
                  );
                },
                text: 'See All',
                options: FFButtonOptions(
                  height: 24.0,
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).transparent,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(15.0, 24.0, 15.0, 24.0),
          child: StreamBuilder<List<ServiceReviewRecord>>(
            stream: queryServiceReviewRecord(
              parent: widget.serviceRef,
              queryBuilder: (serviceReviewRecord) =>
                  serviceReviewRecord.orderBy('review_date', descending: true),
              limit: 3,
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 35.0,
                    height: 35.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              List<ServiceReviewRecord> listViewServiceReviewRecordList =
                  snapshot.data!;
              if (listViewServiceReviewRecordList.isEmpty) {
                return EmptyServiceReviewWidget();
              }

              return ListView.separated(
                padding: EdgeInsets.zero,
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: listViewServiceReviewRecordList.length,
                separatorBuilder: (_, __) => SizedBox(height: 15.0),
                itemBuilder: (context, listViewIndex) {
                  final listViewServiceReviewRecord =
                      listViewServiceReviewRecordList[listViewIndex];
                  return wrapWithModel(
                    model: _model.zReviewCardModels.getModel(
                      listViewIndex.toString(),
                      listViewIndex,
                    ),
                    updateCallback: () => safeSetState(() {}),
                    child: ZReviewCardWidget(
                      key: Key(
                        'Key35q_${listViewIndex.toString()}',
                      ),
                      serviceReview: listViewServiceReviewRecord,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
