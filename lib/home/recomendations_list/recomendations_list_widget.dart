import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home/components/z_filter_list/z_filter_list_widget.dart';
import '/home/z_services_square_card/z_services_square_card_widget.dart';
import '/loading/l_square_wrap/l_square_wrap_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'recomendations_list_model.dart';
import '/backend/recommendation_engine.dart';
export 'recomendations_list_model.dart';

class RecomendationsListWidget extends StatefulWidget {
  const RecomendationsListWidget({super.key});

  static String routeName = 'RecomendationsList';
  static String routePath = '/recomendationsList';

  @override
  State<RecomendationsListWidget> createState() =>
      _RecomendationsListWidgetState();
}

class _RecomendationsListWidgetState extends State<RecomendationsListWidget> {
  late RecomendationsListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecomendationsListModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
                context.pop();
              },
            ),
          ),
          title: Text(
            'Recommendations',
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            wrapWithModel(
              model: _model.zFilterListModel,
              updateCallback: () => safeSetState(() {}),
              child: ZFilterListWidget(),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 0.0, 15.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            if (FFAppState().selectedCategories.isNotEmpty) {
                              return StreamBuilder<List<ServicesRecord>>(
                                stream: queryServicesRecord(
                                  queryBuilder: (servicesRecord) =>
                                      servicesRecord
                                          .whereIn('category',
                                              FFAppState().selectedCategories)
                                          .where(
                                            'recomendations',
                                            isEqualTo: true,
                                          ).where('provider', isNotEqualTo: currentUserReference),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return LSquareWrapWidget();
                                  }
                                  List<ServicesRecord>
                                      containerServicesRecordList =
                                      snapshot.data!;

                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: Builder(
                                      builder: (context) {
                                        final servicesListVar = getRecommendedServices(
                                          containerServicesRecordList.where((e) => e.rate >= FFAppState().RatingsBy).toList(),
                                          FFAppState(),
                                          FFAppState().filterPlace1,
                                        );

                                        return Wrap(
                                          spacing: 8.0,
                                          runSpacing: 8.0,
                                          alignment: WrapAlignment.start,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.start,
                                          direction: Axis.horizontal,
                                          runAlignment: WrapAlignment.start,
                                          verticalDirection:
                                              VerticalDirection.down,
                                          clipBehavior: Clip.none,
                                          children: List.generate(
                                              servicesListVar.length,
                                              (servicesListVarIndex) {
                                            final servicesListVarItem =
                                                servicesListVar[
                                                    servicesListVarIndex];
                                            return wrapWithModel(
                                              model: _model
                                                  .zServicesSquareCardModels1
                                                  .getModel(
                                                servicesListVarIndex.toString(),
                                                servicesListVarIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: ZServicesSquareCardWidget(
                                                key: Key(
                                                  'Key9nr_${servicesListVarIndex.toString()}',
                                                ),
                                                servicesDoc:
                                                    servicesListVarItem,
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                  );
                                },
                              );
                            } else {
                              return StreamBuilder<List<ServicesRecord>>(
                                stream: queryServicesRecord(
                                  queryBuilder: (servicesRecord) =>
                                      servicesRecord.where(
                                    'recomendations',
                                    isEqualTo: true,
                                  ).where('provider', isNotEqualTo: currentUserReference),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return LSquareWrapWidget();
                                  }
                                  List<ServicesRecord>
                                      containerServicesRecordList =
                                      snapshot.data!;

                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: Builder(
                                      builder: (context) {
                                        final containerVar = getRecommendedServices(
                                          containerServicesRecordList.where((e) => e.rate >= FFAppState().RatingsBy).toList(),
                                          FFAppState(),
                                          FFAppState().filterPlace1,
                                        );

                                        return Wrap(
                                          spacing: 8.0,
                                          runSpacing: 8.0,
                                          alignment: WrapAlignment.start,
                                          crossAxisAlignment:
                                              WrapCrossAlignment.start,
                                          direction: Axis.horizontal,
                                          runAlignment: WrapAlignment.start,
                                          verticalDirection:
                                              VerticalDirection.down,
                                          clipBehavior: Clip.none,
                                          children:
                                              List.generate(containerVar.length,
                                                  (containerVarIndex) {
                                            final containerVarItem =
                                                containerVar[containerVarIndex];
                                            return wrapWithModel(
                                              model: _model
                                                  .zServicesSquareCardModels2
                                                  .getModel(
                                                containerVarIndex.toString(),
                                                containerVarIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: ZServicesSquareCardWidget(
                                                key: Key(
                                                  'Keyhqv_${containerVarIndex.toString()}',
                                                ),
                                                servicesDoc: containerVarItem,
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    ),
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ].addToEnd(SizedBox(height: 24.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
