import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'z_category_card_model.dart';
export 'z_category_card_model.dart';

class ZCategoryCardWidget extends StatefulWidget {
  const ZCategoryCardWidget({
    super.key,
    required this.categoryDoc,
  });

  final CategoriesRecord? categoryDoc;

  @override
  State<ZCategoryCardWidget> createState() => _ZCategoryCardWidgetState();
}

class _ZCategoryCardWidgetState extends State<ZCategoryCardWidget> {
  late ZCategoryCardModel _model;

  // ═══════════════════════════════════════════════════════════════════
  // LOCKED DIMENSIONS - MANDATORY ALIGNMENT
  // ═══════════════════════════════════════════════════════════════════
  static const double iconContainerSize = 48.0; // FIXED icon container
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
    _model = createModel(context, () => ZCategoryCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        FFAppState().selectedCategories = [];
        FFAppState().update(() {});
        FFAppState().addToSelectedCategories(widget.categoryDoc!.category);
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
                color: FlutterFlowTheme.of(context).optionalColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.network(
                  widget.categoryDoc!.image,
                  width: 28.0,
                  height: 28.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: iconTextSpacing),
            SizedBox(
              height: textContainerHeight, // LOCKED 40dp HEIGHT
              child: Text(
                widget.categoryDoc?.category ?? 'null',
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
