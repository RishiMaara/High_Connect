import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home/z_services_square_card/z_services_square_card_widget.dart';
import '/loading/l_square_wrap/l_square_wrap_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'services_list_model.dart';
export 'services_list_model.dart';

class ServicesListWidget extends StatefulWidget {
  const ServicesListWidget({super.key});

  static String routeName = 'ServicesList';
  static String routePath = '/servicesList';

  @override
  State<ServicesListWidget> createState() => _ServicesListWidgetState();
}

class _ServicesListWidgetState extends State<ServicesListWidget> {
  late ServicesListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ServicesListModel());

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
            'Services',
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(15.0, 20.0, 15.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          if (FFAppState().selectedCategories.isNotEmpty) {
                            return StreamBuilder<List<ServicesRecord>>(
                              stream: queryServicesRecord(
                                queryBuilder: (servicesRecord) =>
                                    servicesRecord.whereIn('category',
                                        FFAppState().selectedCategories).where('provider', isNotEqualTo: currentUserReference),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return LSquareWrapWidget();
                                }
                                List<ServicesRecord>
                                    containerServicesRecordList =
                                    snapshot.data!;

                                if (containerServicesRecordList.isEmpty) {
                                  return Container(
                                    width: double.infinity,
                                    height: MediaQuery.sizeOf(context).height * 0.7,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10.0),
                                          child: Image.asset(
                                            'assets/images/not-found.png',
                                            width: 150.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              30.0, 24.0, 30.0, 0.0),
                                          child: Text(
                                            'No one is there',
                                            textAlign: TextAlign.center,
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
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              30.0, 8.0, 30.0, 64.0),
                                          child: Text(
                                            'Hmm… looks like our toolbox is empty for that one. Want to try a different category?',
                                            textAlign: TextAlign.center,
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
                                                  lineHeight: 1.5,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }

                                if (containerServicesRecordList.isEmpty) {
                                  return Container(
                                    width: double.infinity,
                                    height: MediaQuery.sizeOf(context).height * 0.7,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10.0),
                                          child: Image.asset(
                                            'assets/images/not-found.png',
                                            width: 150.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(
                                              30.0, 24.0, 30.0, 0.0),
                                          child: Text(
                                            'No one is there',
                                            textAlign: TextAlign.center,
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
                                      ],
                                    ),
                                  );
                                }

                                return Container(
                                  decoration: BoxDecoration(),
                                  child: Builder(
                                    builder: (context) {
                                      final servicesListVar =
                                          containerServicesRecordList;

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
                                                'Key64s_${servicesListVarIndex.toString()}',
                                              ),
                                              servicesDoc: servicesListVarItem,
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
                                queryBuilder: (servicesRecord) => servicesRecord.where('provider', isNotEqualTo: currentUserReference),
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
                                          containerServicesRecordList;

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
                                                .zServicesSquareCardModels2
                                                .getModel(
                                              servicesListVarIndex.toString(),
                                              servicesListVarIndex,
                                            ),
                                            updateCallback: () =>
                                                safeSetState(() {}),
                                            child: ZServicesSquareCardWidget(
                                              key: Key(
                                                'Key3sy_${servicesListVarIndex.toString()}',
                                              ),
                                              servicesDoc: servicesListVarItem,
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
