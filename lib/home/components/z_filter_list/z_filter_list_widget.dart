import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home/components/z_rating_by/z_rating_by_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'z_filter_list_model.dart';
export 'z_filter_list_model.dart';

class ZFilterListWidget extends StatefulWidget {
  const ZFilterListWidget({super.key});

  @override
  State<ZFilterListWidget> createState() => _ZFilterListWidgetState();
}

class _ZFilterListWidgetState extends State<ZFilterListWidget> {
  late ZFilterListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZFilterListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 15.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: ZRatingByWidget(),
                    );
                  },
                ).then((value) => safeSetState(() {}));
              },
              child: Container(
                height: 44.0,
                decoration: BoxDecoration(
                  color: FFAppState().RatingsBy > 0.0
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).optionalColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Rating',
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                              color: FFAppState().RatingsBy > 0.0
                                  ? FlutterFlowTheme.of(context).info
                                  : FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontStyle,
                              lineHeight: 1.0,
                            ),
                      ),
                    ),
                    if (FFAppState().RatingsBy > 0.0)
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                '(',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context).info,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                      lineHeight: 1.0,
                                    ),
                              ),
                              Icon(
                                FFIcons.kstarFilled,
                                color: FlutterFlowTheme.of(context).warning,
                                size: 14.0,
                              ),
                              Text(
                                '${FFAppState().RatingsBy.toString()})',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context).info,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                      lineHeight: 1.0,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (FFAppState().RatingsBy > 0.0) {
                            FFAppState().RatingsBy = 0.0;
                            FFAppState().update(() {});
                          }
                        },
                        child: Container(
                          width: 30.0,
                          height: 30.0,
                          decoration: BoxDecoration(),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              if (FFAppState().RatingsBy > 0.0) {
                                return Icon(
                                  FFIcons.kxClose,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 20.0,
                                );
                              } else {
                                return Icon(
                                  FFIcons.kchevronDown,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 20.0,
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            StreamBuilder<List<CategoriesRecord>>(
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
                List<CategoriesRecord> rowCategoriesRecordList = snapshot.data!;

                return Row(
                  mainAxisSize: MainAxisSize.max,
                  children:
                      List.generate(rowCategoriesRecordList.length, (rowIndex) {
                    final rowCategoriesRecord =
                        rowCategoriesRecordList[rowIndex];
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        FFAppState().addToSelectedCategories(
                            rowCategoriesRecord.category);
                        FFAppState().update(() {});
                      },
                      child: Container(
                        height: 44.0,
                        decoration: BoxDecoration(
                          color: valueOrDefault<Color>(
                            FFAppState()
                                    .selectedCategories
                                    .contains(rowCategoriesRecord.category)
                                ? FlutterFlowTheme.of(context).primary
                                : FlutterFlowTheme.of(context).optionalColor,
                            FlutterFlowTheme.of(context).secondaryBackground,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0,
                                  0.0,
                                  valueOrDefault<double>(
                                    FFAppState().selectedCategories.contains(
                                            rowCategoriesRecord.category)
                                        ? 0.0
                                        : 15.0,
                                    0.0,
                                  ),
                                  0.0),
                              child: Text(
                                rowCategoriesRecord.category,
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: FFAppState()
                                              .selectedCategories
                                              .contains(
                                                  rowCategoriesRecord.category)
                                          ? FlutterFlowTheme.of(context).info
                                          : FlutterFlowTheme.of(context)
                                              .primaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                      lineHeight: 1.0,
                                    ),
                              ),
                            ),
                            if (FFAppState()
                                .selectedCategories
                                .contains(rowCategoriesRecord.category))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 5.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    FFAppState().removeFromSelectedCategories(
                                        rowCategoriesRecord.category);
                                    FFAppState().update(() {});
                                  },
                                  child: Container(
                                    width: 30.0,
                                    height: 30.0,
                                    decoration: BoxDecoration(),
                                    child: Icon(
                                      FFIcons.kxClose,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 20.0,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  }).divide(SizedBox(width: 12.0)),
                );
              },
            ),
          ]
              .divide(SizedBox(width: 12.0))
              .addToStart(SizedBox(width: 15.0))
              .addToEnd(SizedBox(width: 15.0)),
        ),
      ),
    );
  }
}
