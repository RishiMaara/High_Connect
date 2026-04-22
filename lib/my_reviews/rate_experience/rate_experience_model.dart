import '/flutter_flow/flutter_flow_util.dart';
import '/my_reviews/z_service_aspects/z_service_aspects_widget.dart';
import 'rate_experience_widget.dart' show RateExperienceWidget;
import 'package:flutter/material.dart';

class RateExperienceModel extends FlutterFlowModel<RateExperienceWidget> {
  ///  Local state fields for this page.

  List<String> serviceAspects = [
    'Professionalism',
    'Punctuality',
    'Quality of Work',
    'Friendliness',
    'Cleanliness',
    'Efficiency',
    'Communication'
  ];
  void addToServiceAspects(String item) => serviceAspects.add(item);
  void removeFromServiceAspects(String item) => serviceAspects.remove(item);
  void removeAtIndexFromServiceAspects(int index) =>
      serviceAspects.removeAt(index);
  void insertAtIndexInServiceAspects(int index, String item) =>
      serviceAspects.insert(index, item);
  void updateServiceAspectsAtIndex(int index, Function(String) updateFn) =>
      serviceAspects[index] = updateFn(serviceAspects[index]);

  bool anonymous = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for Comment widget.
  FocusNode? commentFocusNode;
  TextEditingController? commentTextController;
  String? Function(BuildContext, String?)? commentTextControllerValidator;
  bool isDataUploading_image1 = false;
  FFUploadedFile uploadedLocalFile_image1 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_image1 = '';

  bool isDataUploading_image2 = false;
  FFUploadedFile uploadedLocalFile_image2 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_image2 = '';

  bool isDataUploading_image3 = false;
  FFUploadedFile uploadedLocalFile_image3 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_image3 = '';

  bool isDataUploading_image4 = false;
  FFUploadedFile uploadedLocalFile_image4 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_image4 = '';

  bool isDataUploading_image5 = false;
  FFUploadedFile uploadedLocalFile_image5 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_image5 = '';

  bool isDataUploading_image6 = false;
  FFUploadedFile uploadedLocalFile_image6 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_image6 = '';

  // Models for zServiceAspects dynamic component.
  late FlutterFlowDynamicModels<ZServiceAspectsModel> zServiceAspectsModels;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? reviewCount;

  @override
  void initState(BuildContext context) {
    zServiceAspectsModels =
        FlutterFlowDynamicModels(() => ZServiceAspectsModel());
  }

  @override
  void dispose() {
    commentFocusNode?.dispose();
    commentTextController?.dispose();

    zServiceAspectsModels.dispose();
  }
}
