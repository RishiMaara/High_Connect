import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/service_profile/z_service_offerings/z_service_offerings_widget.dart';
import '/index.dart';
import 'main_information_widget.dart' show MainInformationWidget;
import 'package:flutter/material.dart';

class MainInformationModel extends FlutterFlowModel<MainInformationWidget> {
  ///  Local state fields for this page.

  int? locationType = 0;

  int? serviceRadius = 5;

  int? floorPrice = 5;

  CategoriesRecord? serviceCategory;

  int? stepId = 1;

  /// Selected work category index from the hardcoded list
  int? selectedCategoryIndex;

  /// Selected work category title
  String? selectedCategoryTitle;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for Title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  String? _titleTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter a service name.';
    }

    return null;
  }

  // State field(s) for Description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  String? _descriptionTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Service description cannot be empty.';
    }

    return null;
  }

  bool isDataUploading_coverPhoto = false;
  FFUploadedFile uploadedLocalFile_coverPhoto =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_coverPhoto = '';

  // Models for zServiceOfferings dynamic component.
  late FlutterFlowDynamicModels<ZServiceOfferingsModel> zServiceOfferingsModels;
  // State field(s) for AddressLine widget.
  FocusNode? addressLineFocusNode;
  TextEditingController? addressLineTextController;
  String? Function(BuildContext, String?)? addressLineTextControllerValidator;
  // State field(s) for ZipCode widget.
  FocusNode? zipCodeFocusNode;
  TextEditingController? zipCodeTextController;
  String? Function(BuildContext, String?)? zipCodeTextControllerValidator;
  // State field(s) for Country widget.
  FocusNode? countryFocusNode;
  TextEditingController? countryTextController;
  String? Function(BuildContext, String?)? countryTextControllerValidator;
  // State field(s) for CategorySearch widget.
  FocusNode? categorySearchFocusNode;
  TextEditingController? categorySearchTextController;
  bool isDataUploading_field12 = false;
  FFUploadedFile uploadedLocalFile_field12 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_field12 = '';

  bool isDataUploading_field123 = false;
  FFUploadedFile uploadedLocalFile_field123 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_field123 = '';

  bool isDataUploading_field1234 = false;
  FFUploadedFile uploadedLocalFile_field1234 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_field1234 = '';

  bool isDataUploading_field12345 = false;
  FFUploadedFile uploadedLocalFile_field12345 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_field12345 = '';

  bool isDataUploading_field123456 = false;
  FFUploadedFile uploadedLocalFile_field123456 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_field123456 = '';

  bool isDataUploading_field1234567 = false;
  FFUploadedFile uploadedLocalFile_field1234567 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_field1234567 = '';

  @override
  void initState(BuildContext context) {
    titleTextControllerValidator = _titleTextControllerValidator;
    descriptionTextControllerValidator = _descriptionTextControllerValidator;
    zServiceOfferingsModels =
        FlutterFlowDynamicModels(() => ZServiceOfferingsModel());
  }

  @override
  void dispose() {
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    zServiceOfferingsModels.dispose();
    addressLineFocusNode?.dispose();
    addressLineTextController?.dispose();

    zipCodeFocusNode?.dispose();
    zipCodeTextController?.dispose();

    countryFocusNode?.dispose();
    countryTextController?.dispose();

    categorySearchFocusNode?.dispose();
    categorySearchTextController?.dispose();
  }
}
