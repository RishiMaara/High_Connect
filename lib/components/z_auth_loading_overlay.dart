import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/app_state.dart';

/// Overlay widget that blocks UI interactions and back navigation
/// when authentication is in progress.
/// 
/// Wrap your auth screens with this widget to prevent accidental
/// navigation away during auth operations.
class ZAuthLoadingOverlay extends StatelessWidget {
  final Widget child;
  
  const ZAuthLoadingOverlay({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isAuthLoading = context.watch<FFAppState>().isAuthLoading;

    return PopScope(
      // Block back navigation when loading
      canPop: !isAuthLoading,
      child: Stack(
        children: [
          child,
          if (isAuthLoading) ...[
            // Semi-transparent background that blocks touches
            ModalBarrier(
              dismissible: false,
              color: Colors.black.withOpacity(0.5),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF007BFF)),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Please wait...',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Inter',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Static overlay that can be shown anywhere in the widget tree
/// when [isAuthLoading] is true.
class ZAuthLoadingIndicator extends StatelessWidget {
  const ZAuthLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final isAuthLoading = context.watch<FFAppState>().isAuthLoading;

    if (!isAuthLoading) {
      return const SizedBox.shrink();
    }

    return Stack(
      children: [
        ModalBarrier(
          dismissible: false,
          color: Colors.black.withOpacity(0.5),
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF007BFF)),
                ),
                const SizedBox(height: 16),
                Text(
                  'Please wait...',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
