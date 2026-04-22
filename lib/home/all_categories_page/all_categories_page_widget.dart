import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home/components/z_all_category_card/z_all_category_card_widget.dart';
import '/loading/l_category_list/l_category_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'all_categories_page_model.dart';
export 'all_categories_page_model.dart';

class AllCategoriesPageWidget extends StatefulWidget {
  const AllCategoriesPageWidget({super.key});

  static String routeName = 'AllCategoriesPage';
  static String routePath = '/allCategoriesPage';

  @override
  State<AllCategoriesPageWidget> createState() =>
      _AllCategoriesPageWidgetState();
}

class _AllCategoriesPageWidgetState extends State<AllCategoriesPageWidget> {
  late AllCategoriesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AllCategoriesPageModel());

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
            'All categories',
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
        body: StreamBuilder<List<CategoriesRecord>>(
          stream: queryCategoriesRecord(
            queryBuilder: (categoriesRecord) =>
                categoriesRecord.orderBy('item'),
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return LCategoryListWidget();
            }
            List<CategoriesRecord> listViewCategoriesRecordList =
                snapshot.data!;

            return ListView.separated(
              padding: EdgeInsets.fromLTRB(
                0,
                15.0,
                0,
                15.0,
              ),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: listViewCategoriesRecordList.length,
              separatorBuilder: (_, __) => SizedBox(height: 12.0),
              itemBuilder: (context, listViewIndex) {
                final listViewCategoriesRecord =
                    listViewCategoriesRecordList[listViewIndex];
                return wrapWithModel(
                  model: _model.zAllCategoryCardModels.getModel(
                    listViewIndex.toString(),
                    listViewIndex,
                  ),
                  updateCallback: () => safeSetState(() {}),
                  child: ZAllCategoryCardWidget(
                    key: Key(
                      'Keyu9q_${listViewIndex.toString()}',
                    ),
                    categoryDoc: listViewCategoriesRecord,
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
