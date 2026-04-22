import '/buttons/settings_button/settings_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/home/components/z_nawbar/z_nawbar_widget.dart';
import '/profile/components/z_continue_as_provider/z_continue_as_provider_widget.dart';
import '/index.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ProfileInformation.
  late SettingsButtonModel profileInformationModel;
  // Model for ServiceDetail.
  late SettingsButtonModel serviceDetailModel;
  // Model for Availability.
  late SettingsButtonModel availabilityModel;
  // Model for ServiceArea.
  late SettingsButtonModel serviceAreaModel;
  // Model for zContinueAsProvider component.
  late ZContinueAsProviderModel zContinueAsProviderModel;
  // Model for MyAddresses.
  late SettingsButtonModel myAddressesModel;
  // Model for MyReview.
  late SettingsButtonModel myReviewModel1;
  // Model for MyReview.
  late SettingsButtonModel myReviewModel2;
  // Model for MyNotifications.
  late SettingsButtonModel myNotificationsModel;
  // Model for Language.
  late SettingsButtonModel languageModel;
  // Model for AppSecurity.
  late SettingsButtonModel appSecurityModel;
  // Model for Settings.
  late SettingsButtonModel settingsModel;
  // Model for Notifications.
  late SettingsButtonModel notificationsModel1;
  // Model for Notifications.
  late SettingsButtonModel notificationsModel2;
  // Model for Notifications.
  late SettingsButtonModel notificationsModel3;
  // Model for Notifications.
  late SettingsButtonModel notificationsModel4;
  // Model for zNawbar component.
  late ZNawbarModel zNawbarModel;

  @override
  void initState(BuildContext context) {
    profileInformationModel = createModel(context, () => SettingsButtonModel());
    serviceDetailModel = createModel(context, () => SettingsButtonModel());
    availabilityModel = createModel(context, () => SettingsButtonModel());
    serviceAreaModel = createModel(context, () => SettingsButtonModel());
    zContinueAsProviderModel =
        createModel(context, () => ZContinueAsProviderModel());
    myAddressesModel = createModel(context, () => SettingsButtonModel());
    myReviewModel1 = createModel(context, () => SettingsButtonModel());
    myReviewModel2 = createModel(context, () => SettingsButtonModel());
    myNotificationsModel = createModel(context, () => SettingsButtonModel());
    languageModel = createModel(context, () => SettingsButtonModel());
    appSecurityModel = createModel(context, () => SettingsButtonModel());
    settingsModel = createModel(context, () => SettingsButtonModel());
    notificationsModel1 = createModel(context, () => SettingsButtonModel());
    notificationsModel2 = createModel(context, () => SettingsButtonModel());
    notificationsModel3 = createModel(context, () => SettingsButtonModel());
    notificationsModel4 = createModel(context, () => SettingsButtonModel());
    zNawbarModel = createModel(context, () => ZNawbarModel());
  }

  @override
  void dispose() {
    profileInformationModel.dispose();
    serviceDetailModel.dispose();
    availabilityModel.dispose();
    serviceAreaModel.dispose();
    zContinueAsProviderModel.dispose();
    myAddressesModel.dispose();
    myReviewModel1.dispose();
    myReviewModel2.dispose();
    myNotificationsModel.dispose();
    languageModel.dispose();
    appSecurityModel.dispose();
    settingsModel.dispose();
    notificationsModel1.dispose();
    notificationsModel2.dispose();
    notificationsModel3.dispose();
    notificationsModel4.dispose();
    zNawbarModel.dispose();
  }
}
