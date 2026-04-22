import '/flutter_flow/flutter_flow_util.dart';
import 'do_not_disturb_widget.dart' show DoNotDisturbWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DoNotDisturbModel extends FlutterFlowModel<DoNotDisturbWidget> {
  ///  Local state fields for this page.

  int pageViewItem = 0;

  int? startHour;

  int? startMin;

  int? endHour;

  int? endMin;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController1;
  int carouselCurrentIndex1 = 0;

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController2;
  int carouselCurrentIndex2 = 0;

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController3;
  int carouselCurrentIndex3 = 0;

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController4;
  int carouselCurrentIndex4 = 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
