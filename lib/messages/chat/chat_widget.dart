import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/loading/l_message/l_message_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'chat_model.dart';
export 'chat_model.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({
    super.key,
    required this.userRef,
  });

  final DocumentReference? userRef;

  static String routeName = 'Chat';
  static String routePath = '/chat';

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  late ChatModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.chatDoc = (await queryChatsRecordOnce(
        queryBuilder: (chatsRecord) => chatsRecord.where(
          'users_ref',
          arrayContains: currentUserReference,
        ),
      ))
          .firstWhereOrNull(
              (c) => c.usersRef.contains(widget.userRef));
      
      // Reset unread count for current user
      if (_model.chatDoc != null) {
        final isUser1 = _model.chatDoc!.user1 == currentUserReference ||
            (_model.chatDoc!.usersRef.isNotEmpty && 
             _model.chatDoc!.usersRef.first == currentUserReference);
        
        if (isUser1) {
          await _model.chatDoc!.reference.update({'unread_count_user1': 0});
        } else {
          await _model.chatDoc!.reference.update({'unread_count_user2': 0});
        }
      }
      
      _model.messageCount = await queryChatMessagesRecordCount(
        parent: _model.chatDoc?.reference,
        queryBuilder: (chatMessagesRecord) => chatMessagesRecord
            .where(
              'seen',
              isEqualTo: false,
            )
            .where(
              'sender',
              isEqualTo: widget.userRef,
            ),
      );
      _model.messagesCount = _model.messageCount;
      safeSetState(() {});
      while (_model.messagesCount! > 0) {
        _model.messageDoc = await queryChatMessagesRecordOnce(
          parent: _model.chatDoc?.reference,
          queryBuilder: (chatMessagesRecord) => chatMessagesRecord
              .where(
                'seen',
                isEqualTo: false,
              )
              .where(
                'sender',
                isEqualTo: widget.userRef,
              ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);

        await _model.messageDoc!.reference.update(createChatMessagesRecordData(
          seen: true,
        ));
        _model.messagesCount = _model.messagesCount! + -1;
        safeSetState(() {});
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(widget.userRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 35.0,
                height: 35.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }

        final chatUsersRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(0.0),
              child: AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
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
                centerTitle: false,
                elevation: 0.0,
              ),
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              6.0, 6.0, 0.0, 6.0),
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              6.0, 0.0, 0.0, 0.0),
                          child: Container(
                            width: 56.0,
                            height: 56.0,
                            child: Stack(
                              children: [
                                Container(
                                  width: 56.0,
                                  height: 56.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    chatUsersRecord.photoUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, 1.0),
                                  child: Container(
                                    width: 13.0,
                                    height: 13.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: 10.0,
                                      height: 10.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .success,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  chatUsersRecord.displayName
                                      .maybeHandleOverflow(
                                    maxChars: 25,
                                    replacement: '…',
                                  ),
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
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                        lineHeight: 1.0,
                                      ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Text(
                                      'Offline',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                            lineHeight: 1.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 6.0, 6.0, 6.0),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 22.0,
                            borderWidth: 1.0,
                            buttonSize: 44.0,
                            icon: Icon(
                              FFIcons.kphone,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              final phoneNumber = chatUsersRecord.phoneNumber;
                              if (phoneNumber.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Phone number not available.'),
                                    backgroundColor: FlutterFlowTheme.of(context).error,
                                  ),
                                );
                                return;
                              }
                              // Copy phone number to clipboard
                              await Clipboard.setData(ClipboardData(text: phoneNumber));
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Phone number copied to clipboard'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                              // Log call in Firestore
                              await CallsRecord.collection.doc().set({
                                ...createCallsRecordData(
                                  callAccepted: true,
                                  callType: 0,
                                  callTime: getCurrentTimestamp,
                                  outgoing: currentUserReference,
                                ),
                                ...mapToFirestore(
                                  {
                                    'users_ref': functions.usersRefList(
                                        chatUsersRecord.reference,
                                        currentUserReference!),
                                  },
                                ),
                              });
                              // Open native phone dialer
                              await launchUrl(Uri(
                                scheme: 'tel',
                                path: phoneNumber,
                              ));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: StreamBuilder<List<ChatsRecord>>(
                    stream: queryChatsRecord(
                      queryBuilder: (chatsRecord) => chatsRecord.where(
                        'users_ref',
                        arrayContains: currentUserReference,
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return LMessageWidget();
                      }
                      final containerChatsRecord = snapshot.data!
                          .firstWhereOrNull((c) =>
                              c.usersRef.contains(chatUsersRecord.reference));
                      // Return an empty Container when the item does not exist.
                      if (containerChatsRecord == null) {
                        return Container();
                      }

                      return Container(
                        decoration: BoxDecoration(),
                        child: StreamBuilder<List<ChatMessagesRecord>>(
                          stream: queryChatMessagesRecord(
                            parent: containerChatsRecord.reference,
                            queryBuilder: (chatMessagesRecord) =>
                                chatMessagesRecord.orderBy('time_stamp',
                                    descending: true),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return LMessageWidget();
                            }
                            List<ChatMessagesRecord>
                                listViewChatMessagesRecordList = snapshot.data!;

                            return ListView.separated(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                12.0,
                                0,
                                12.0,
                              ),
                              reverse: true,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewChatMessagesRecordList.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 8.0),
                              itemBuilder: (context, listViewIndex) {
                                final listViewChatMessagesRecord =
                                    listViewChatMessagesRecordList[
                                        listViewIndex];
                                return Builder(
                                  builder: (context) {
                                    if (listViewChatMessagesRecord.sender ==
                                        currentUserReference) {
                                      return Align(
                                        alignment:
                                            AlignmentDirectional(1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.7,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(15.0),
                                                bottomRight:
                                                    Radius.circular(5.0),
                                                topLeft: Radius.circular(15.0),
                                                topRight: Radius.circular(15.0),
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                if (listViewChatMessagesRecord
                                                            .image !=
                                                        '')
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(3.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 200.0,
                                                      child: Stack(
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await Navigator
                                                                  .push(
                                                                context,
                                                                PageTransition(
                                                                  type:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  child:
                                                                      FlutterFlowExpandedImageView(
                                                                    image: Image
                                                                        .network(
                                                                      listViewChatMessagesRecord
                                                                          .image,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                    allowRotation:
                                                                        false,
                                                                    tag: listViewChatMessagesRecord
                                                                        .image,
                                                                    useHeroAnimation:
                                                                        true,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            child: Hero(
                                                              tag:
                                                                  listViewChatMessagesRecord
                                                                      .image,
                                                              transitionOnUserGestures:
                                                                  true,
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          valueOrDefault<
                                                                              double>(
                                                                    listViewChatMessagesRecord.message !=
                                                                                ''
                                                                        ? 8.0
                                                                        : 13.0,
                                                                    0.0,
                                                                  )),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          valueOrDefault<
                                                                              double>(
                                                                    listViewChatMessagesRecord.message !=
                                                                                ''
                                                                        ? 8.0
                                                                        : 3.0,
                                                                    0.0,
                                                                  )),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          13.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          13.0),
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  listViewChatMessagesRecord
                                                                      .image,
                                                                  width: double
                                                                      .infinity,
                                                                  height: 200.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          if (listViewChatMessagesRecord
                                                                      .message ==
                                                                  '')
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0, 1.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            8.0),
                                                                child:
                                                                    Container(
                                                                  height: 20.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .barrier,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: [
                                                                        Text(
                                                                          dateTimeFormat(
                                                                            "Hm",
                                                                            listViewChatMessagesRecord.timeStamp!,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                lineHeight: 1.0,
                                                                              ),
                                                                        ),
                                                                        Builder(
                                                                          builder:
                                                                              (context) {
                                                                            if (listViewChatMessagesRecord.seen) {
                                                                              return Opacity(
                                                                                opacity: 0.8,
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                  child: Icon(
                                                                                    FFIcons.kchecks,
                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                    size: 16.0,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            } else {
                                                                              return Opacity(
                                                                                opacity: 0.8,
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                  child: Icon(
                                                                                    FFIcons.kcheck,
                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                    size: 16.0,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                if (listViewChatMessagesRecord.location != null)
                                                  InkWell(
                                                    onTap: () async {
                                                      final lat = listViewChatMessagesRecord.location!.latitude;
                                                      final lng = listViewChatMessagesRecord.location!.longitude;
                                                      final url = Uri.parse('https://www.google.com/maps/search/?api=1&query=' + lat.toString() + ',' + lng.toString());
                                                      await launchUrl(url);
                                                    },
                                                    child: Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 4.0),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          color: FlutterFlowTheme.of(context).primary.withOpacity(0.2),
                                                          borderRadius: BorderRadius.circular(8.0),
                                                        ),
                                                        padding: EdgeInsets.all(10.0),
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            Icon(Icons.location_on, color: FlutterFlowTheme.of(context).info, size: 20.0),
                                                            SizedBox(width: 6.0),
                                                            Text('Tap to open map', style: FlutterFlowTheme.of(context).bodySmall.override(font: GoogleFonts.inter(), color: FlutterFlowTheme.of(context).info, letterSpacing: 0.0)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (listViewChatMessagesRecord
                                                            .message !=
                                                        '')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12.0,
                                                                12.0,
                                                                12.0,
                                                                6.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, -1.0),
                                                          child: Text(
                                                            listViewChatMessagesRecord
                                                                .message,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .info,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                  lineHeight:
                                                                      1.5,
                                                                ),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Opacity(
                                                              opacity: 0.8,
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        1.0),
                                                                child: Text(
                                                                  dateTimeFormat(
                                                                    "Hm",
                                                                    listViewChatMessagesRecord
                                                                        .timeStamp!,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelSmall
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            Builder(
                                                              builder:
                                                                  (context) {
                                                                if (listViewChatMessagesRecord
                                                                    .seen) {
                                                                  return Opacity(
                                                                    opacity:
                                                                        0.8,
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Icon(
                                                                        FFIcons
                                                                            .kchecks,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        size:
                                                                            16.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                } else {
                                                                  return Opacity(
                                                                    opacity:
                                                                        0.8,
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Icon(
                                                                        FFIcons
                                                                            .kcheck,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .info,
                                                                        size:
                                                                            16.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 4.0)),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      return Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          child: Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.7,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(5.0),
                                                bottomRight:
                                                    Radius.circular(15.0),
                                                topLeft: Radius.circular(15.0),
                                                topRight: Radius.circular(15.0),
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                if (listViewChatMessagesRecord
                                                            .image !=
                                                        '')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                3.0,
                                                                3.0,
                                                                3.0,
                                                                valueOrDefault<
                                                                    double>(
                                                                  listViewChatMessagesRecord.message !=
                                                                              ''
                                                                      ? 0.0
                                                                      : 3.0,
                                                                  0.0,
                                                                )),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 200.0,
                                                      child: Stack(
                                                        children: [
                                                          InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await Navigator
                                                                  .push(
                                                                context,
                                                                PageTransition(
                                                                  type:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  child:
                                                                      FlutterFlowExpandedImageView(
                                                                    image: Image
                                                                        .network(
                                                                      listViewChatMessagesRecord
                                                                          .image,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                    allowRotation:
                                                                        false,
                                                                    tag: listViewChatMessagesRecord
                                                                        .image,
                                                                    useHeroAnimation:
                                                                        true,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            child: Hero(
                                                              tag:
                                                                  listViewChatMessagesRecord
                                                                      .image,
                                                              transitionOnUserGestures:
                                                                  true,
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          valueOrDefault<
                                                                              double>(
                                                                    listViewChatMessagesRecord.message !=
                                                                                ''
                                                                        ? 8.0
                                                                        : 3.0,
                                                                    0.0,
                                                                  )),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          valueOrDefault<
                                                                              double>(
                                                                    listViewChatMessagesRecord.message !=
                                                                                ''
                                                                        ? 8.0
                                                                        : 13.0,
                                                                    0.0,
                                                                  )),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          13.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          13.0),
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  listViewChatMessagesRecord
                                                                      .image,
                                                                  width: double
                                                                      .infinity,
                                                                  height: 200.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          if (listViewChatMessagesRecord
                                                                      .message ==
                                                                  '')
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0, 1.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            8.0),
                                                                child:
                                                                    Container(
                                                                  height: 20.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .barrier,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            4.0,
                                                                            8.0,
                                                                            4.0),
                                                                    child: Text(
                                                                      dateTimeFormat(
                                                                        "Hm",
                                                                        listViewChatMessagesRecord
                                                                            .timeStamp!,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).info,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                            lineHeight:
                                                                                1.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                if (listViewChatMessagesRecord.location != null)
                                                  InkWell(
                                                    onTap: () async {
                                                      final lat = listViewChatMessagesRecord.location!.latitude;
                                                      final lng = listViewChatMessagesRecord.location!.longitude;
                                                      final url = Uri.parse('https://www.google.com/maps/search/?api=1&query=' + lat.toString() + ',' + lng.toString());
                                                      await launchUrl(url);
                                                    },
                                                    child: Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 4.0),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                          borderRadius: BorderRadius.circular(8.0),
                                                          border: Border.all(color: FlutterFlowTheme.of(context).primary.withOpacity(0.3)),
                                                        ),
                                                        padding: EdgeInsets.all(10.0),
                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            Icon(Icons.location_on, color: FlutterFlowTheme.of(context).primary, size: 20.0),
                                                            SizedBox(width: 6.0),
                                                            Text('Tap to open map', style: FlutterFlowTheme.of(context).bodySmall.override(font: GoogleFonts.inter(), color: FlutterFlowTheme.of(context).primaryText, letterSpacing: 0.0)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (listViewChatMessagesRecord
                                                            .message !=
                                                        '')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12.0,
                                                                12.0,
                                                                12.0,
                                                                6.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, -1.0),
                                                          child: Text(
                                                            listViewChatMessagesRecord
                                                                .message,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                  lineHeight:
                                                                      1.5,
                                                                ),
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Opacity(
                                                              opacity: 0.8,
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        1.0),
                                                                child: Text(
                                                                  dateTimeFormat(
                                                                    "Hm",
                                                                    listViewChatMessagesRecord
                                                                        .timeStamp!,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .inter(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodySmall
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodySmall
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 4.0)),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                );
                              },
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (_model.uploadedFileUrl_uploadData4ul != '')
                        Container(
                          width: double.infinity,
                          height: 220.0,
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(3.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.fade,
                                        child: FlutterFlowExpandedImageView(
                                          image: Image.network(
                                            _model
                                                .uploadedFileUrl_uploadData4ul,
                                            fit: BoxFit.contain,
                                          ),
                                          allowRotation: false,
                                          tag: _model
                                              .uploadedFileUrl_uploadData4ul,
                                          useHeroAnimation: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: _model.uploadedFileUrl_uploadData4ul,
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.network(
                                        _model.uploadedFileUrl_uploadData4ul,
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 15.0, 15.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      safeSetState(() {
                                        _model.isDataUploading_uploadData4ul =
                                            false;
                                        _model.uploadedLocalFile_uploadData4ul =
                                            FFUploadedFile(
                                                bytes: Uint8List.fromList([]),
                                                originalFilename: '');
                                        _model.uploadedFileUrl_uploadData4ul =
                                            '';
                                      });
                                    },
                                    child: Container(
                                      width: 30.0,
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .barrier,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        FFIcons.kxClose,
                                        color: FlutterFlowTheme.of(context)
                                            .infoBlack,
                                        size: 18.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            if (_model.isLocationUploading)
                              Padding(
                                padding: EdgeInsets.all(12.0),
                                child: SizedBox(
                                  width: 24.0,
                                  height: 24.0,
                                  child: CircularProgressIndicator(
                                    color: FlutterFlowTheme.of(context).primary,
                                    strokeWidth: 2.0,
                                  ),
                                ),
                              )
                            else
                              FlutterFlowIconButton(
                                borderRadius: 10.0,
                                borderWidth: 1.0,
                                buttonSize: 48.0,
                                fillColor: FlutterFlowTheme.of(context).secondary,
                                icon: Icon(
                                  Icons.location_on_outlined,
                                  color: FlutterFlowTheme.of(context).icons,
                                  size: 24.0,
                                ),
                                onPressed: () async {
                                  safeSetState(() {
                                    _model.isLocationUploading = true;
                                  });
                                  final pos = await getCurrentUserLocation(
                                      defaultLocation: const LatLng(0.0, 0.0));
                                  if (pos.latitude == 0.0 && pos.longitude == 0.0) {
                                    safeSetState(() { _model.isLocationUploading = false; });
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: const Text('Could not get location. Enable location permissions and try again.'),
                                      backgroundColor: FlutterFlowTheme.of(context).error,
                                    ));
                                    return;
                                  }
                                  final chatDoc = await queryChatsRecordOnce(
                                    queryBuilder: (q) => q.where('users_ref', arrayContains: currentUserReference),
                                  ).then((s) => s.firstWhereOrNull((c) => c.usersRef.contains(widget.userRef)));
                                  if (chatDoc != null) {
                                    final msgRef = ChatMessagesRecord.createDoc(chatDoc.reference);
                                    await msgRef.set(createChatMessagesRecordData(
                                      message: '',
                                      timeStamp: getCurrentTimestamp,
                                      seen: false,
                                      image: '',
                                      sender: currentUserReference,
                                      location: pos,
                                    ));
                                    final isRecv1 = chatDoc.user1 == widget.userRef ||
                                        (chatDoc.usersRef.isNotEmpty && chatDoc.usersRef.first == widget.userRef);
                                    await chatDoc.reference.update({
                                      'last_message': msgRef,
                                      'last_message_text': 'Shared a location',
                                      'last_message_time': getCurrentTimestamp,
                                    });
                                    if (isRecv1) {
                                      await chatDoc.reference.update({'unread_count_user1': FieldValue.increment(1)});
                                    } else {
                                      await chatDoc.reference.update({'unread_count_user2': FieldValue.increment(1)});
                                    }
                                    await NotificationsRecord.createDoc(widget.userRef!).set(createNotificationsRecordData(
                                      title: 'New Message',
                                      description: 'Shared a location',
                                      type: 'chat_message',
                                      timeStamp: getCurrentTimestamp,
                                      read: false,
                                    ));
                                  }
                                  safeSetState(() { _model.isLocationUploading = false; });
                                },
                              ),
                            SizedBox(width: 8.0),
                            FlutterFlowIconButton(
                              borderRadius: 10.0,
                              borderWidth: 1.0,
                              buttonSize: 48.0,
                              fillColor: FlutterFlowTheme.of(context).secondary,
                              icon: Icon(
                                FFIcons.kpaperclip,
                                color: FlutterFlowTheme.of(context).icons,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                final selectedMedia =
                                    await selectMediaWithSourceBottomSheet(
                                  context: context,
                                  allowPhoto: true,
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  safeSetState(() => _model
                                      .isDataUploading_uploadData4ul = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];

                                  var downloadUrls = <String>[];
                                  try {
                                    selectedUploadedFiles = selectedMedia
                                        .map((m) => FFUploadedFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                              height: m.dimensions?.height,
                                              width: m.dimensions?.width,
                                              blurHash: m.blurHash,
                                              originalFilename:
                                                  m.originalFilename,
                                            ))
                                        .toList();

                                    downloadUrls = (await Future.wait(
                                      selectedMedia.map(
                                        (m) async => await uploadData(
                                            m.storagePath, m.bytes),
                                      ),
                                    ))
                                        .where((u) => u != null)
                                        .map((u) => u!)
                                        .toList();
                                  } finally {
                                    _model.isDataUploading_uploadData4ul =
                                        false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                          selectedMedia.length &&
                                      downloadUrls.length ==
                                          selectedMedia.length) {
                                    safeSetState(() {
                                      _model.uploadedLocalFile_uploadData4ul =
                                          selectedUploadedFiles.first;
                                      _model.uploadedFileUrl_uploadData4ul =
                                          downloadUrls.first;
                                    });
                                  } else {
                                    safeSetState(() {});
                                    return;
                                  }
                                }
                              },
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 200.0,
                                          child: TextFormField(
                                            controller: _model.textController,
                                            focusNode:
                                                _model.textFieldFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.textController',
                                              Duration(milliseconds: 0),
                                              () => safeSetState(() {}),
                                            ),
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              isDense: false,
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                              hintText: 'Message...',
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0x00000000),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              ),
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          15.0, 0.0, 15.0, 0.0),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                            maxLines: 6,
                                            minLines: 1,
                                            cursorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            validator: _model
                                                .textControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ),
                                      StreamBuilder<List<ChatsRecord>>(
                                        stream: queryChatsRecord(
                                          queryBuilder: (chatsRecord) =>
                                              chatsRecord.where(
                                            'users_ref',
                                            arrayContains: currentUserReference,
                                          ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 35.0,
                                                height: 35.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<ChatsRecord>
                                              iconButtonChatsRecordList =
                                              snapshot.data!;
                                          final iconButtonChatsRecord =
                                              iconButtonChatsRecordList
                                                  .firstWhereOrNull((c) => c
                                                      .usersRef
                                                      .contains(chatUsersRecord
                                                          .reference));

                                          return FlutterFlowIconButton(
                                            borderRadius: 10.0,
                                            buttonSize: 48.0,
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .transparent,
                                            icon: Icon(
                                              FFIcons.ksend03,
                                              color: (_model.textController
                                                                  .text !=
                                                              '') ||
                                                      (_model.uploadedFileUrl_uploadData4ul !=
                                                              '')
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .icons,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              if ((_model.uploadedFileUrl_uploadData4ul !=
                                                          '') ||
                                                  (_model.textController
                                                              .text !=
                                                          '')) {
                                                if (iconButtonChatsRecord !=
                                                    null) {
                                                  var chatMessagesRecordReference1 =
                                                      ChatMessagesRecord.createDoc(
                                                          iconButtonChatsRecord
                                                              .reference);
                                                  await chatMessagesRecordReference1
                                                      .set(
                                                          createChatMessagesRecordData(
                                                    message: _model
                                                        .textController.text,
                                                    timeStamp:
                                                        getCurrentTimestamp,
                                                    seen: false,
                                                    image: _model
                                                        .uploadedFileUrl_uploadData4ul,
                                                    sender:
                                                        currentUserReference,
                                                  ));
                                                  _model.lastMessage =
                                                      ChatMessagesRecord
                                                          .getDocumentFromData(
                                                              createChatMessagesRecordData(
                                                                message: _model
                                                                    .textController
                                                                    .text,
                                                                timeStamp:
                                                                    getCurrentTimestamp,
                                                                seen: false,
                                                                image: _model
                                                                    .uploadedFileUrl_uploadData4ul,
                                                                sender:
                                                                    currentUserReference,
                                                              ),
                                                              chatMessagesRecordReference1);

                                                  // Determine if receiver is user1 or user2
                                                  final isReceiverUser1 = iconButtonChatsRecord.user1 == widget.userRef ||
                                                      (iconButtonChatsRecord.usersRef.isNotEmpty && 
                                                       iconButtonChatsRecord.usersRef.first == widget.userRef);
                                                  
                                                  final messageText = _model.textController.text.isNotEmpty 
                                                      ? _model.textController.text 
                                                      : (_model.uploadedFileUrl_uploadData4ul.isNotEmpty ? '📷 Photo' : '');

                                                  await iconButtonChatsRecord
                                                      .reference
                                                      .update({
                                                    'last_message': _model.lastMessage?.reference,
                                                    'last_message_text': messageText,
                                                    'last_message_time': getCurrentTimestamp,
                                                  });
                                                  if (isReceiverUser1) {
                                                    await iconButtonChatsRecord.reference.update({'unread_count_user1': FieldValue.increment(1)});
                                                  } else {
                                                    await iconButtonChatsRecord.reference.update({'unread_count_user2': FieldValue.increment(1)});
                                                  }

                                                  // Send notification to receiver
                                                  await NotificationsRecord.createDoc(
                                                    widget.userRef!,
                                                  ).set(createNotificationsRecordData(
                                                    title: 'New Message',
                                                    description: messageText.length > 50 
                                                        ? '${messageText.substring(0, 50)}...' 
                                                        : messageText,
                                                    type: 'chat_message',
                                                    timeStamp: getCurrentTimestamp,
                                                    read: false,
                                                  ));
                                                } else {
                                                  var chatsRecordReference =
                                                      ChatsRecord.collection
                                                          .doc();
                                                  
                                                  final newMessageText = _model.textController.text.isNotEmpty 
                                                      ? _model.textController.text 
                                                      : (_model.uploadedFileUrl_uploadData4ul.isNotEmpty ? '📷 Photo' : '');
                                                  
                                                  try {
                                                    await chatsRecordReference.set({
                                                      ...createChatsRecordData(
                                                        startDate: getCurrentTimestamp,
                                                        user1: widget.userRef,
                                                        user2: currentUserReference,
                                                        unreadCountUser1: 1, // Receiver (widget.userRef) is user1
                                                        unreadCountUser2: 0,
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'users_ref': functions.usersRefList(
                                                            widget.userRef!,
                                                            currentUserReference!,
                                                          ),
                                                        },
                                                      ),
                                                    });
                                                  } catch (e) {
                                                    rethrow;
                                                  }

                                                  _model.chatRef = ChatsRecord.getDocumentFromData(
                                                    {
                                                      ...createChatsRecordData(
                                                        startDate: getCurrentTimestamp,
                                                        user1: widget.userRef,
                                                        user2: currentUserReference,
                                                      ),
                                                      ...mapToFirestore(
                                                        {
                                                          'users_ref': functions.usersRefList(
                                                            widget.userRef!,
                                                            currentUserReference!,
                                                          ),
                                                        },
                                                      ),
                                                    },
                                                    chatsRecordReference,
                                                  );

                                                  var chatMessagesRecordReference2 =
                                                      ChatMessagesRecord
                                                          .createDoc(_model
                                                              .chatRef!
                                                              .reference);
                                                  await chatMessagesRecordReference2
                                                      .set(
                                                          createChatMessagesRecordData(
                                                    message: _model
                                                        .textController.text,
                                                    timeStamp:
                                                        getCurrentTimestamp,
                                                    seen: false,
                                                    image: _model
                                                        .uploadedFileUrl_uploadData4ul,
                                                    sender:
                                                        currentUserReference,
                                                  ));
                                                  _model.firstLastMessage =
                                                      ChatMessagesRecord
                                                          .getDocumentFromData(
                                                              createChatMessagesRecordData(
                                                                message: _model
                                                                    .textController
                                                                    .text,
                                                                timeStamp:
                                                                    getCurrentTimestamp,
                                                                seen: false,
                                                                image: _model
                                                                    .uploadedFileUrl_uploadData4ul,
                                                                sender:
                                                                    currentUserReference,
                                                              ),
                                                              chatMessagesRecordReference2);

                                                  await _model
                                                      .chatRef!.reference
                                                      .update({
                                                    'last_message': _model.firstLastMessage?.reference,
                                                    'last_message_text': newMessageText,
                                                    'last_message_time': getCurrentTimestamp,
                                                  });

                                                  // Send notification to receiver
                                                  await NotificationsRecord.createDoc(
                                                    widget.userRef!,
                                                  ).set(createNotificationsRecordData(
                                                    title: 'New Message',
                                                    description: newMessageText.length > 50 
                                                        ? '${newMessageText.substring(0, 50)}...' 
                                                        : newMessageText,
                                                    type: 'chat_message',
                                                    timeStamp: getCurrentTimestamp,
                                                    read: false,
                                                  ));
                                                }

                                                safeSetState(() {
                                                  _model.isDataUploading_uploadData4ul =
                                                      false;
                                                  _model.uploadedLocalFile_uploadData4ul =
                                                      FFUploadedFile(
                                                          bytes: Uint8List
                                                              .fromList([]),
                                                          originalFilename: '');
                                                  _model.uploadedFileUrl_uploadData4ul =
                                                      '';
                                                });

                                                safeSetState(() {
                                                  _model.textController
                                                      ?.clear();
                                                });
                                              }

                                              safeSetState(() {});
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
