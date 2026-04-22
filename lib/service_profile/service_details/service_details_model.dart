import '/flutter_flow/flutter_flow_util.dart';
import 'service_details_widget.dart' show ServiceDetailsWidget;
import '/home/components/z_home_page_address/z_home_page_address_widget.dart';
import 'package:flutter/material.dart';

class ServiceDetailsModel extends FlutterFlowModel<ServiceDetailsWidget> {
  ///  Local state fields for this page.

  List<String> serviceImages = [];
  void addToServiceImages(String item) => serviceImages.add(item);
  void removeFromServiceImages(String item) => serviceImages.remove(item);
  void removeAtIndexFromServiceImages(int index) =>
      serviceImages.removeAt(index);
  void insertAtIndexInServiceImages(int index, String item) =>
      serviceImages.insert(index, item);
  void updateServiceImagesAtIndex(int index, Function(String) updateFn) =>
      serviceImages[index] = updateFn(serviceImages[index]);

  double? floorPrice;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
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

  bool isDataUploading_uploadDataRd0 = false;
  FFUploadedFile uploadedLocalFile_uploadDataRd0 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataRd0 = '';

  bool isDataUploading_image11 = false;
  FFUploadedFile uploadedLocalFile_image11 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_image11 = '';

  bool isDataUploading_image12 = false;
  FFUploadedFile uploadedLocalFile_image12 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_image12 = '';

  bool isDataUploading_image13 = false;
  FFUploadedFile uploadedLocalFile_image13 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_image13 = '';

  bool isDataUploading_image14 = false;
  FFUploadedFile uploadedLocalFile_image14 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_image14 = '';

  bool isDataUploading_image15 = false;
  FFUploadedFile uploadedLocalFile_image15 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_image15 = '';

  bool isDataUploading_image16 = false;
  FFUploadedFile uploadedLocalFile_image16 =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_image16 = '';

  // Model for ZHomePageAddress component.
  late ZHomePageAddressModel zHomePageAddressModel;

  @override
  void initState(BuildContext context) {
    zHomePageAddressModel = createModel(context, () => ZHomePageAddressModel());
    titleTextControllerValidator = _titleTextControllerValidator;
    descriptionTextControllerValidator = _descriptionTextControllerValidator;
  }

  @override
  void dispose() {
    zHomePageAddressModel.dispose();
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
