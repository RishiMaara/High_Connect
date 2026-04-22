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
import 'top_services_model.dart';
export 'top_services_model.dart';

class TopServicesWidget extends StatefulWidget {
  const TopServicesWidget({super.key});

  static String routeName = 'TopServices';
  static String routePath = '/topServices';

  @override
  State<TopServicesWidget> createState() => _TopServicesWidgetState();
}

class _TopServicesWidgetState extends State<TopServicesWidget> {
  late TopServicesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopServicesModel());

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
            'Top services',
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
                                            'top_service',
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
                                        final servicesListVar =
                                            containerServicesRecordList
                                                .where((e) =>
                                                    (e.pricePerHour >=
                                                        FFAppState()
                                                            .PriceByStart) &&
                                                    (e.pricePerHour <=
                                                        FFAppState()
                                                            .PriceByEnd) &&
                                                    (e.rate >=
                                                        FFAppState().RatingsBy))
                                                .toList();

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
                                                  'Keyy12_${servicesListVarIndex.toString()}',
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
                                    'top_service',
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
                                        final containerVar =
                                            containerServicesRecordList
                                                .where((e) =>
                                                    (e.pricePerHour >=
                                                        FFAppState()
                                                            .PriceByStart) &&
                                                    (e.pricePerHour <=
                                                        FFAppState()
                                                            .PriceByEnd) &&
                                                    (e.rate >=
                                                        FFAppState().RatingsBy))
                                                .toList();

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
                                                  'Keycs4_${containerVarIndex.toString()}',
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
