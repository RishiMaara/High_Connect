import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/home/z_services_horizontal/z_services_horizontal_widget.dart';
import '/loading/l_horizontal_card_list/l_horizontal_card_list_widget.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'z_services_categories_model.dart';
export 'z_services_categories_model.dart';

class ZServicesCategoriesWidget extends StatefulWidget {
  const ZServicesCategoriesWidget({super.key});

  @override
  State<ZServicesCategoriesWidget> createState() =>
      _ZServicesCategoriesWidgetState();
}

class _ZServicesCategoriesWidgetState extends State<ZServicesCategoriesWidget> {
  late ZServicesCategoriesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZServicesCategoriesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CategoriesRecord>>(
      stream: queryCategoriesRecord(),
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
        List<CategoriesRecord> listViewCategoriesRecordList = snapshot.data!;

        return ListView.builder(
          padding: EdgeInsets.zero,
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: listViewCategoriesRecordList.length,
          itemBuilder: (context, listViewIndex) {
            final listViewCategoriesRecord =
                listViewCategoriesRecordList[listViewIndex];
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 15.0, 0.0),
                          child: Text(
                            listViewCategoriesRecord.category,
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
                                  lineHeight: 1.0,
                                ),
                          ),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          FFAppState().selectedCategories = [];
                          FFAppState().update(() {});
                          FFAppState().addToSelectedCategories(
                              listViewCategoriesRecord.category);
                          FFAppState().update(() {});

                          context.pushNamed(ServicesListWidget.routeName);
                        },
                        text: 'See All',
                        options: FFButtonOptions(
                          height: 24.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).transparent,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        showLoadingIndicator: false,
                      ),
                    ],
                  ),
                ),
                StreamBuilder<List<ServicesRecord>>(
                  stream: queryServicesRecord(
                    queryBuilder: (servicesRecord) => servicesRecord.where(
                      'category',
                      isEqualTo: listViewCategoriesRecord.category,
                    ),
                    limit: 8,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return LHorizontalCardListWidget();
                    }
                    List<ServicesRecord> rowServicesRecordList = snapshot.data!;

                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: List.generate(rowServicesRecordList.length,
                                (rowIndex) {
                          final rowServicesRecord =
                              rowServicesRecordList[rowIndex];
                          return wrapWithModel(
                            model: _model.zServicesHorizontalModels.getModel(
                              rowIndex.toString(),
                              rowIndex,
                            ),
                            updateCallback: () => safeSetState(() {}),
                            child: ZServicesHorizontalWidget(
                              key: Key(
                                'Keya3k_${rowIndex.toString()}',
                              ),
                              servicesDoc: rowServicesRecord,
                            ),
                          );
                        })
                            .divide(SizedBox(width: 8.0))
                            .addToStart(SizedBox(width: 15.0))
                            .addToEnd(SizedBox(width: 15.0)),
                      ),
                    );
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
