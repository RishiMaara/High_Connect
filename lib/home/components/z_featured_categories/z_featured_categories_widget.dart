import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'z_featured_categories_model.dart';
export 'z_featured_categories_model.dart';

class ZFeaturedCategoriesWidget extends StatefulWidget {
  const ZFeaturedCategoriesWidget({super.key});

  @override
  State<ZFeaturedCategoriesWidget> createState() =>
      _ZFeaturedCategoriesWidgetState();
}

class _ZFeaturedCategoriesWidgetState
    extends State<ZFeaturedCategoriesWidget> {
  late ZFeaturedCategoriesModel _model;

  // ═══════════════════════════════════════════════════════════════════
  // LOCKED DIMENSIONS - MANDATORY ALIGNMENT
  // ═══════════════════════════════════════════════════════════════════
  static const int crossAxisCount = 4;          // EXACTLY 4 columns
  static const double childAspectRatio = 0.72;  // Adjusted for 120dp height
  static const double iconContainerSize = 48.0; // FIXED icon container
  static const double iconSize = 24.0;          // FIXED icon size
  static const double textContainerHeight = 40.0; // FIXED text height (KEY FIX)
  static const double topSpacing = 8.0;         // FIXED top spacer
  static const double iconTextSpacing = 8.0;    // FIXED spacer
  // ═══════════════════════════════════════════════════════════════════

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZFeaturedCategoriesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final featuredCategories = [
      {'name': 'Structural Engineer', 'icon': Icons.apartment},
      {'name': 'Construction Project Manager', 'icon': Icons.manage_accounts},
      {'name': 'Building Services Engineer', 'icon': Icons.settings},
      {'name': 'Geotechnical Engineer', 'icon': Icons.terrain},
      {'name': 'Highway Design Engineer', 'icon': Icons.alt_route},
      {'name': 'Environmental Engineer', 'icon': Icons.eco},
      {'name': 'HSE Engineer', 'icon': Icons.health_and_safety},
      {'name': 'Quantity Surveyor', 'icon': Icons.calculate},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 12.0,
        ),
        itemCount: featuredCategories.length,
        itemBuilder: (context, index) {
          return _buildLockedGridItem(context, featuredCategories[index]);
        },
      ),
    );
  }

  Widget _buildLockedGridItem(BuildContext context, Map<String, dynamic> category) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        FFAppState().selectedCategories = [];
        FFAppState().update(() {});
        FFAppState().addToSelectedCategories(category['name'] as String);
        FFAppState().update(() {});
        context.pushNamed(ServicesListWidget.routeName);
      },
      child: Container(
        height: 120.0, // FIXED CELL HEIGHT
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: topSpacing),
            Container(
              width: iconContainerSize,
              height: iconContainerSize,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(12.0),
              ),
              alignment: Alignment.center,
              child: Icon(
                category['icon'] as IconData,
                color: FlutterFlowTheme.of(context).primary,
                size: iconSize,
              ),
            ),
            const SizedBox(height: iconTextSpacing),
            SizedBox(
              height: textContainerHeight, // LOCKED 40dp HEIGHT
              child: Text(
                category['name'] as String,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: FlutterFlowTheme.of(context).bodySmall.override(
                  font: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                  ),
                  fontSize: 10.0,
                  letterSpacing: 0.0,
                  lineHeight: 1.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
