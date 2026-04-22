import '/backend/backend.dart';
import '/empty/empty_clients/empty_clients_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/loading/l_chats/l_chats_widget.dart';
import '/service_profile/components/z_clients_card/z_clients_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'service_clients_model.dart';
export 'service_clients_model.dart';

class ServiceClientsWidget extends StatefulWidget {
  const ServiceClientsWidget({
    super.key,
    this.serviceRef,
  });

  final DocumentReference? serviceRef;

  static String routeName = 'ServiceClients';
  static String routePath = '/serviceClients';

  @override
  State<ServiceClientsWidget> createState() => _ServiceClientsWidgetState();
}

class _ServiceClientsWidgetState extends State<ServiceClientsWidget> {
  late ServiceClientsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ServiceClientsModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
            'Clients',
            style: FlutterFlowTheme.of(context).headlineSmall.override(
                  font: GoogleFonts.inter(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primaryText,
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
        body: StreamBuilder<List<MyBookingsRecord>>(
          stream: queryMyBookingsRecord(
            queryBuilder: (myBookingsRecord) => myBookingsRecord.where(
              'service',
              isEqualTo: widget.serviceRef,
            ),
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return LChatsWidget();
            }
            List<MyBookingsRecord> listViewMyBookingsRecordList =
                snapshot.data!;
            if (listViewMyBookingsRecordList.isEmpty) {
              return EmptyClientsWidget();
            }

            return ListView.separated(
              padding: EdgeInsets.fromLTRB(
                0,
                15.0,
                0,
                15.0,
              ),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: listViewMyBookingsRecordList.length,
              separatorBuilder: (_, __) => SizedBox(height: 12.0),
              itemBuilder: (context, listViewIndex) {
                final listViewMyBookingsRecord =
                    listViewMyBookingsRecordList[listViewIndex];
                return wrapWithModel(
                  model: _model.zClientsCardModels.getModel(
                    listViewIndex.toString(),
                    listViewIndex,
                  ),
                  updateCallback: () => safeSetState(() {}),
                  child: ZClientsCardWidget(
                    key: Key(
                      'Keym3f_${listViewIndex.toString()}',
                    ),
                    bookingDoc: listViewMyBookingsRecord,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
