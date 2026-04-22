import '/backend/backend.dart';
import '/empty/empty_service_review/empty_service_review_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/loading/l_review/l_review_widget.dart';
import '/service/z_review_card/z_review_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'reviews_list_model.dart';
export 'reviews_list_model.dart';

class ReviewsListWidget extends StatefulWidget {
  const ReviewsListWidget({
    super.key,
    required this.serviceRef,
  });

  final DocumentReference? serviceRef;

  static String routeName = 'ReviewsList';
  static String routePath = '/reviewsList';

  @override
  State<ReviewsListWidget> createState() => _ReviewsListWidgetState();
}

class _ReviewsListWidgetState extends State<ReviewsListWidget> {
  late ReviewsListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewsListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
        backgroundColor: FlutterFlowTheme.of(context).optionalColor2,
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
            'Reviews',
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
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).optionalColor2,
              ),
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Align(
          alignment: AlignmentDirectional(0.0, -1.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
            child: StreamBuilder<List<ServiceReviewRecord>>(
              stream: queryServiceReviewRecord(
                parent: widget.serviceRef,
                queryBuilder: (serviceReviewRecord) => serviceReviewRecord
                    .orderBy('review_date', descending: true),
                limit: 3,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return LReviewWidget();
                }
                List<ServiceReviewRecord> listViewServiceReviewRecordList =
                    snapshot.data!;
                if (listViewServiceReviewRecordList.isEmpty) {
                  return EmptyServiceReviewWidget();
                }

                return ListView.separated(
                  padding: EdgeInsets.fromLTRB(
                    0,
                    15.0,
                    0,
                    24.0,
                  ),
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
                          'Keyyvd_${listViewIndex.toString()}',
                        ),
                        serviceReview: listViewServiceReviewRecord,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
