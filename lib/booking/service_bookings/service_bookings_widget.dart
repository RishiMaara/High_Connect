import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/booking/components/z_bookings_card/z_bookings_card_widget.dart';
import '/empty/empty_ser_book_history/empty_ser_book_history_widget.dart';
import '/empty/empty_service_bookings/empty_service_bookings_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home/components/z_nawbar/z_nawbar_widget.dart';
import '/loading/l_my_bookings/l_my_bookings_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'service_bookings_model.dart';
export 'service_bookings_model.dart';

class ServiceBookingsWidget extends StatefulWidget {
  const ServiceBookingsWidget({super.key});

  static String routeName = 'ServiceBookings';
  static String routePath = '/serviceBookings';

  @override
  State<ServiceBookingsWidget> createState() => _ServiceBookingsWidgetState();
}

class _ServiceBookingsWidgetState extends State<ServiceBookingsWidget>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  late ServiceBookingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ServiceBookingsModel());

    animationsMap.addAll({
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: Offset(0.95, 0.95),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Refresh the page when app comes back to focus to re-evaluate time
      if (mounted) safeSetState(() {});
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Bookings',
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
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 15.0),
                    child: Container(
                      width: double.infinity,
                      height: 45.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).tabBar1,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await _model.pageViewController?.previousPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                },
                                child: Container(
                                  width: 100.0,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: _model.pageIndex == 0
                                        ? FlutterFlowTheme.of(context).tabBar2
                                        : FlutterFlowTheme.of(context)
                                            .transparent,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'In progress',
                                    style: FlutterFlowTheme.of(context)
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
                                          color: _model.pageIndex == 0
                                              ? FlutterFlowTheme.of(context)
                                                  .primaryText
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await _model.pageViewController?.animateToPage(
                                    1,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                },
                                child: Container(
                                  width: 100.0,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: _model.pageIndex == 1
                                        ? FlutterFlowTheme.of(context).tabBar2
                                        : FlutterFlowTheme.of(context)
                                            .transparent,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'History',
                                    style: FlutterFlowTheme.of(context)
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
                                          color: _model.pageIndex == 1
                                              ? FlutterFlowTheme.of(context)
                                                  .primaryText
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await _model.pageViewController?.animateToPage(
                                    2,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                },
                                child: Container(
                                  width: 100.0,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: _model.pageIndex == 2
                                        ? FlutterFlowTheme.of(context).tabBar2
                                        : FlutterFlowTheme.of(context)
                                            .transparent,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'Declined',
                                    style: FlutterFlowTheme.of(context)
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
                                          color: _model.pageIndex == 2
                                              ? FlutterFlowTheme.of(context)
                                                  .primaryText
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ].divide(SizedBox(width: 3.0)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 500.0,
                      child: PageView(
                        controller: _model.pageViewController ??=
                            PageController(initialPage: 0),
                        onPageChanged: (_) async {
                          _model.pageIndex = _model.pageViewCurrentIndex;
                          safeSetState(() {});
                        },
                        scrollDirection: Axis.horizontal,
                        children: [
                          AuthUserStreamWidget(
                            builder: (context) =>
                                StreamBuilder<List<MyBookingsRecord>>(
                              stream: queryMyBookingsRecord(
                                queryBuilder: (myBookingsRecord) =>
                                    myBookingsRecord
                                        .where(
                                          'service',
                                          isEqualTo:
                                              currentUserDocument?.service,
                                        )
                                        .where(
                                          'completed',
                                          isEqualTo: false,
                                        )
                                        .orderBy('booking_date',
                                            descending: true),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return LMyBookingsWidget();
                                }
                                List<MyBookingsRecord>
                                    listViewMyBookingsRecordList =
                                    snapshot.data!;
                                
                                // STRICT FILTER: In Progress tab shows pending_approval, in_progress, and accepted bookings
                                // that have NOT yet passed their booking time
                                final now = DateTime.now();
                                listViewMyBookingsRecordList = listViewMyBookingsRecordList
                                    .where((booking) {
                                      final status = booking.status ?? 'in_progress';
                                      
                                      // Show pending_approval, in_progress, or accepted
                                      if (!['in_progress', 'accepted', 'pending', 'pending_approval'].contains(status)) {
                                        return false;
                                      }
                                      
                                      // booking_date is set to "now" when the customer sends a request,
                                      // not the appointment slot—do not treat that as elapsed service time.
                                      if (status != 'pending_approval' && status != 'pending') {
                                        if (booking.bookingDate != null) {
                                          if (now.isAfter(booking.bookingDate!) || now.isAtSameMomentAs(booking.bookingDate!)) {
                                            return false;
                                          }
                                        }
                                      }
                                      
                                      return true;
                                    })
                                    .toList();
                                
                                if (listViewMyBookingsRecordList.isEmpty) {
                                  return EmptyServiceBookingsWidget();
                                }

                                return ListView.separated(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    0,
                                    0,
                                    15.0,
                                  ),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      listViewMyBookingsRecordList.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 12.0),
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewMyBookingsRecord =
                                        listViewMyBookingsRecordList[
                                            listViewIndex];
                                    return wrapWithModel(
                                      model:
                                          _model.zBookingsCardModels1.getModel(
                                        listViewIndex.toString(),
                                        listViewIndex,
                                      ),
                                      updateCallback: () => safeSetState(() {}),
                                      child: ZBookingsCardWidget(
                                        key: Key(
                                          'Keyd1v_${listViewIndex.toString()}',
                                        ),
                                        bookingDoc: listViewMyBookingsRecord,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          AuthUserStreamWidget(
                            builder: (context) =>
                                StreamBuilder<List<MyBookingsRecord>>(
                              stream: queryMyBookingsRecord(
                                queryBuilder: (myBookingsRecord) =>
                                    myBookingsRecord
                                        .where(
                                          'service',
                                          isEqualTo:
                                              currentUserDocument?.service,
                                        )
                                        .orderBy('booking_date',
                                            descending: true),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return LMyBookingsWidget();
                                }
                                List<MyBookingsRecord>
                                    listViewMyBookingsRecordList =
                                    snapshot.data!;
                                
                                // STRICT FILTER: History tab shows ONLY completed bookings
                                final now = DateTime.now();
                                listViewMyBookingsRecordList = listViewMyBookingsRecordList
                                    .where((booking) {
                                      final status = booking.status ?? 'in_progress';
                                      
                                      // Show if explicitly marked as completed
                                      if (status == 'completed') return true;
                                      
                                      // Auto-complete and show if time has passed AND status was active
                                      if (['in_progress', 'accepted', 'pending'].contains(status)) {
                                        if (booking.bookingDate != null) {
                                          if (now.isAfter(booking.bookingDate!) || now.isAtSameMomentAs(booking.bookingDate!)) {
                                            return true;
                                          }
                                        }
                                      }
                                      
                                      // Exclude rejected, cancelled, and future bookings
                                      return false;
                                    })
                                    .toList();
                                
                                if (listViewMyBookingsRecordList.isEmpty) {
                                  return EmptySerBookHistoryWidget();
                                }

                                return ListView.separated(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    0,
                                    0,
                                    15.0,
                                  ),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      listViewMyBookingsRecordList.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 12.0),
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewMyBookingsRecord =
                                        listViewMyBookingsRecordList[
                                            listViewIndex];
                                    return wrapWithModel(
                                      model:
                                          _model.zBookingsCardModels2.getModel(
                                        listViewIndex.toString(),
                                        listViewIndex,
                                      ),
                                      updateCallback: () => safeSetState(() {}),
                                      child: ZBookingsCardWidget(
                                        key: Key(
                                          'Keyx2y_${listViewIndex.toString()}',
                                        ),
                                        bookingDoc: listViewMyBookingsRecord,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          AuthUserStreamWidget(
                            builder: (context) =>
                                StreamBuilder<List<MyBookingsRecord>>(
                              stream: queryMyBookingsRecord(
                                queryBuilder: (myBookingsRecord) =>
                                    myBookingsRecord
                                        .where(
                                          'service',
                                          isEqualTo:
                                              currentUserDocument?.service,
                                        )
                                        .orderBy('booking_date',
                                            descending: true),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return LMyBookingsWidget();
                                }
                                List<MyBookingsRecord>
                                    listViewMyBookingsRecordList =
                                    snapshot.data!;
                                
                                // STRICT FILTER: Declined tab shows ONLY rejected/cancelled bookings
                                listViewMyBookingsRecordList = listViewMyBookingsRecordList
                                    .where((booking) {
                                      final status = booking.status ?? 'in_progress';
                                      return status == 'rejected' || status == 'cancelled' || status == 'cancelled_by_user' || status == 'declined';
                                    })
                                    .toList();

                                if (listViewMyBookingsRecordList.isEmpty) {
                                  return EmptyServiceBookingsWidget();
                                }

                                return ListView.separated(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    0,
                                    0,
                                    15.0,
                                  ),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      listViewMyBookingsRecordList.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 12.0),
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewMyBookingsRecord =
                                        listViewMyBookingsRecordList[
                                            listViewIndex];
                                    return wrapWithModel(
                                      model:
                                          _model.zBookingsCardModels3.getModel(
                                        listViewIndex.toString(),
                                        listViewIndex,
                                      ),
                                      updateCallback: () => safeSetState(() {}),
                                      child: ZBookingsCardWidget(
                                        key: Key(
                                          'Keydec_${listViewIndex.toString()}',
                                        ),
                                        bookingDoc: listViewMyBookingsRecord,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
            ),
            wrapWithModel(
              model: _model.zNawbarModel,
              updateCallback: () => safeSetState(() {}),
              child: ZNawbarWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
