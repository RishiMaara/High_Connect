import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/loading/l_text/l_text_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'z_chats_card_model.dart';
export 'z_chats_card_model.dart';

class ZChatsCardWidget extends StatefulWidget {
  const ZChatsCardWidget({
    super.key,
    required this.chatDoc,
  });

  final ChatsRecord? chatDoc;

  @override
  State<ZChatsCardWidget> createState() => _ZChatsCardWidgetState();
}

class _ZChatsCardWidgetState extends State<ZChatsCardWidget> {
  late ZChatsCardModel _model;

  // ═══════════════════════════════════════════════════════════════════
  // LOCKED DIMENSIONS - DO NOT MODIFY
  // ═══════════════════════════════════════════════════════════════════
  static const double rowHeight = 72.0;           // FIXED row height
  static const double avatarSize = 48.0;          // FIXED avatar size
  static const double onlineIndicatorSize = 10.0; // FIXED online dot size
  static const double onlineIndicatorBorder = 2.0;// FIXED white border
  static const double textContainerHeight = 48.0; // FIXED text block height
  static const double rightSectionWidth = 48.0;   // FIXED right section width
  static const double unreadBadgeMinSize = 18.0;  // FIXED min badge size
  static const double horizontalPadding = 15.0;   // FIXED padding
  // ═══════════════════════════════════════════════════════════════════

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ZChatsCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  // Helper to get unread count for current user
  int _getUnreadCount() {
    if (widget.chatDoc == null) return 0;
    
    if (widget.chatDoc!.user1 == currentUserReference) {
      return widget.chatDoc!.unreadCountUser1;
    } else if (widget.chatDoc!.user2 == currentUserReference) {
      return widget.chatDoc!.unreadCountUser2;
    }
    
    final usersRef = widget.chatDoc!.usersRef;
    if (usersRef.isNotEmpty && usersRef.first == currentUserReference) {
      return widget.chatDoc!.unreadCountUser1;
    }
    return widget.chatDoc!.unreadCountUser2;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: StreamBuilder<UsersRecord>(
        stream: UsersRecord.getDocument(functions.noMyRef(
            widget.chatDoc!.usersRef.toList(), currentUserReference!)),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(
              height: rowHeight,
              child: Center(
                child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              ),
            );
          }

          final containerUsersRecord = snapshot.data!;
          final unreadCount = _getUnreadCount();

          return InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed(
                ChatWidget.routeName,
                queryParameters: {
                  'userRef': serializeParam(
                    containerUsersRecord.reference,
                    ParamType.DocumentReference,
                  ),
                }.withoutNulls,
              );
            },
            child: Container(
              height: rowHeight, // LOCKED HEIGHT
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ════════════════════════════════════════════════════════
                  // AVATAR SECTION (LEFT) - LOCKED 48×48
                  // ════════════════════════════════════════════════════════
                  SizedBox(
                    width: avatarSize,
                    height: avatarSize,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // Avatar image
                        Container(
                          width: avatarSize,
                          height: avatarSize,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondary,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                containerUsersRecord.photoUrl,
                              ),
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                        // Online indicator - ABSOLUTELY POSITIONED
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: onlineIndicatorSize + (onlineIndicatorBorder * 2),
                            height: onlineIndicatorSize + (onlineIndicatorBorder * 2),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondaryBackground,
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: Container(
                              width: onlineIndicatorSize,
                              height: onlineIndicatorSize,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).success,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(width: 12.0),

                  // ════════════════════════════════════════════════════════
                  // TEXT SECTION (CENTER) - LOCKED HEIGHT 48dp
                  // ════════════════════════════════════════════════════════
                  Expanded(
                    child: SizedBox(
                      height: textContainerHeight, // LOCKED HEIGHT
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Username - single line
                          Text(
                            containerUsersRecord.displayName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                  ),
                                  letterSpacing: 0.0,
                                  lineHeight: 1.2,
                                ),
                          ),
                          const SizedBox(height: 4.0),
                          // Message preview - single line
                          _buildMessagePreview(context, unreadCount),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 8.0),

                  // ════════════════════════════════════════════════════════
                  // RIGHT SECTION (TIME + BADGE) - LOCKED WIDTH 48dp
                  // ════════════════════════════════════════════════════════
                  SizedBox(
                    width: rightSectionWidth,
                    height: textContainerHeight,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Time text
                        Text(
                          widget.chatDoc!.lastMessageTime != null
                              ? dateTimeFormat(
                                  "Hm",
                                  widget.chatDoc!.lastMessageTime!,
                                  locale: FFLocalizations.of(context).languageCode,
                                )
                              : '',
                          style: FlutterFlowTheme.of(context)
                              .labelSmall
                              .override(
                                font: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                ),
                                color: FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                              ),
                        ),
                        const SizedBox(height: 4.0),
                        // Unread badge
                        if (unreadCount > 0)
                          Container(
                            constraints: BoxConstraints(
                              minWidth: unreadBadgeMinSize,
                              minHeight: unreadBadgeMinSize,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 6.0),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).primary,
                              borderRadius: BorderRadius.circular(9.0),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              unreadCount > 99 ? '99+' : unreadCount.toString(),
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                    ),
                                    color: Colors.white,
                                    fontSize: unreadCount > 99 ? 8.0 : 10.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          )
                        else
                          SizedBox(height: unreadBadgeMinSize), // Placeholder to maintain alignment
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMessagePreview(BuildContext context, int unreadCount) {
    if (widget.chatDoc!.lastMessageText.isNotEmpty) {
      return Text(
        widget.chatDoc!.lastMessageText,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: FlutterFlowTheme.of(context).labelMedium.override(
          font: GoogleFonts.inter(
            fontWeight: unreadCount > 0 ? FontWeight.w600 : FontWeight.w400,
          ),
          color: unreadCount > 0
              ? FlutterFlowTheme.of(context).primaryText
              : FlutterFlowTheme.of(context).secondaryText,
          letterSpacing: 0.0,
          lineHeight: 1.2,
        ),
      );
    }
    
    if (!widget.chatDoc!.hasLastMessage()) {
      return const SizedBox.shrink();
    }
    
    return StreamBuilder<ChatMessagesRecord>(
      stream: ChatMessagesRecord.getDocument(widget.chatDoc!.lastMessage!),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LTextWidget(height: 14.0, width: 100.0);
        }

        final message = snapshot.data!;
        String previewText = message.message.isNotEmpty 
            ? message.message 
            : (message.image.isNotEmpty ? '📷 Image' : '');

        return Text(
          previewText,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: FlutterFlowTheme.of(context).labelMedium.override(
            font: GoogleFonts.inter(
              fontWeight: FontWeight.w400,
            ),
            color: FlutterFlowTheme.of(context).secondaryText,
            letterSpacing: 0.0,
            lineHeight: 1.2,
          ),
        );
      },
    );
  }
}
