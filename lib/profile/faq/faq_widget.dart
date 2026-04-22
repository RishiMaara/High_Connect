import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/profile/components/z_faq_card/z_faq_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'faq_model.dart';
export 'faq_model.dart';

class FaqWidget extends StatefulWidget {
  const FaqWidget({super.key});

  static String routeName = 'FAQ';
  static String routePath = '/faq';

  @override
  State<FaqWidget> createState() => _FaqWidgetState();
}

class _FaqWidgetState extends State<FaqWidget> {
  late FaqModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FaqModel());

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
                context.safePop();
              },
            ),
          ),
          title: Text(
            'FAQ',
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
                color: FlutterFlowTheme.of(context).optionalColor2,
              ),
            ),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.zFaqCardModel1,
                updateCallback: () => safeSetState(() {}),
                child: ZFaqCardWidget(
                  question: 'What is HIGH Connect?',
                  answer:
                      'HIGH Connect is a platform that links everyday people with trusted civil engineers for their projects. Engineers showcase their skills with a simple profile fee, while users access services for free.',
                ),
              ),
              wrapWithModel(
                model: _model.zFaqCardModel2,
                updateCallback: () => safeSetState(() {}),
                child: ZFaqCardWidget(
                  question:
                      'Can I use HIGH Connect for ongoing or multiple projects?',
                  answer:
                      'Absolutely! You can save favorite engineers, maintain multiple conversations, and use the platform for all your civil engineering needs, whether one-time or ongoing projects.',
                ),
              ),
              wrapWithModel(
                model: _model.zFaqCardModel3,
                updateCallback: () => safeSetState(() {}),
                child: ZFaqCardWidget(
                  question:
                      'Is this service really free for me? What\'s the catch?',
                  answer:
                      'Yes, it is completely free for you to search, browse profiles, and contact engineers on HIGH Connect. There is no catch. Our platform is funded by the engineers who pay a fee to showcase their profiles and connect with clients like you.',
                ),
              ),
              wrapWithModel(
                model: _model.zFaqCardModel4,
                updateCallback: () => safeSetState(() {}),
                child: ZFaqCardWidget(
                  question: 'How do I pay the engineer?',
                  answer:
                      'All payments are handled directly between you and the engineer, outside of our platform. After agreeing on a price, you can pay them via bank transfer, UPI, cash, or any other method you both decide on. We do not hold or process any funds.',
                ),
              ),
              wrapWithModel(
                model: _model.zFaqCardModel5,
                updateCallback: () => safeSetState(() {}),
                child: ZFaqCardWidget(
                  question: 'How do I book a service on HIGH Connect?',
                  answer:
                      'Find an engineer on our app and message them directly. Discuss your project and agree on a price. Then, hire and pay them to get started.',
                ),
              ),
              wrapWithModel(
                model: _model.zFaqCardModel6,
                updateCallback: () => safeSetState(() {}),
                child: ZFaqCardWidget(
                  question: 'Can I meet the engineer in person before hiring?',
                  answer:
                      'Absolutely. We encourage it! You can use our in-app messaging to schedule a free initial consultation or site visit. All final agreements should be made directly between you and the engineer.',
                ),
              ),
              wrapWithModel(
                model: _model.zFaqCardModel7,
                updateCallback: () => safeSetState(() {}),
                child: ZFaqCardWidget(
                  question: 'Is my contact information visible to everyone?',
                  answer:
                      'Yes, your contact information along with profile will be visible once you have paid for provider account.',
                ),
              ),
              wrapWithModel(
                model: _model.zFaqCardModel8,
                updateCallback: () => safeSetState(() {}),
                child: ZFaqCardWidget(
                  question: 'Is HIGH Connect available in my area?',
                  answer: 'Yes, HIGH Connect is available all over India.',
                ),
              ),
              wrapWithModel(
                model: _model.zFaqCardModel9,
                updateCallback: () => safeSetState(() {}),
                child: ZFaqCardWidget(
                  question:
                      'Can I list different prices for different services?',
                  answer:
                      'Absolutely. We encourage you to be transparent about your pricing.',
                ),
              ),
              wrapWithModel(
                model: _model.zFaqCardModel10,
                updateCallback: () => safeSetState(() {}),
                child: ZFaqCardWidget(
                  question:
                      'How do I know if my project needs a civil engineer?',
                  answer:
                      'If your project involves structural changes, foundation work, soil testing, drainage systems, or property boundary issues, you likely need a civil engineer. When in doubt, you can always consult one on our platform for advice.',
                ),
              ),
              wrapWithModel(
                model: _model.zFaqCardModel11,
                updateCallback: () => safeSetState(() {}),
                child: ZFaqCardWidget(
                  question:
                      'Can I get a cost estimate before contacting an engineer?',
                  answer:
                      'Many engineers list starting prices or service packages on their profiles. For accurate pricing, we recommend contacting 2-3 engineers with your project details to compare quotes.',
                ),
              ),
            ]
                .divide(SizedBox(height: 15.0))
                .addToStart(SizedBox(height: 15.0))
                .addToEnd(SizedBox(height: 15.0)),
          ),
        ),
      ),
    );
  }
}
