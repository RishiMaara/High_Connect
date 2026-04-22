import '/booking/components/z_rooms_card/z_rooms_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'booking_rooms_widget.dart' show BookingRoomsWidget;
import 'package:flutter/material.dart';

class BookingRoomsModel extends FlutterFlowModel<BookingRoomsWidget> {
  ///  Local state fields for this page.

  List<String> residentialSpaces = [
    'Living Room',
    'Bedroom',
    'Kids\' Room',
    'Guest Room',
    'Home Office',
    'Dining Room',
    'Hallway',
    'Closet',
    'Laundry Room',
    'Basement'
  ];
  void addToResidentialSpaces(String item) => residentialSpaces.add(item);
  void removeFromResidentialSpaces(String item) =>
      residentialSpaces.remove(item);
  void removeAtIndexFromResidentialSpaces(int index) =>
      residentialSpaces.removeAt(index);
  void insertAtIndexInResidentialSpaces(int index, String item) =>
      residentialSpaces.insert(index, item);
  void updateResidentialSpacesAtIndex(int index, Function(String) updateFn) =>
      residentialSpaces[index] = updateFn(residentialSpaces[index]);

  List<String> bathrooms = [
    'Bathroom',
    'Shower Room',
    'Toilet / WC',
    'Powder Room'
  ];
  void addToBathrooms(String item) => bathrooms.add(item);
  void removeFromBathrooms(String item) => bathrooms.remove(item);
  void removeAtIndexFromBathrooms(int index) => bathrooms.removeAt(index);
  void insertAtIndexInBathrooms(int index, String item) =>
      bathrooms.insert(index, item);
  void updateBathroomsAtIndex(int index, Function(String) updateFn) =>
      bathrooms[index] = updateFn(bathrooms[index]);

  List<String> kitchen = ['Kitchen', 'Pantry', 'Utility Room'];
  void addToKitchen(String item) => kitchen.add(item);
  void removeFromKitchen(String item) => kitchen.remove(item);
  void removeAtIndexFromKitchen(int index) => kitchen.removeAt(index);
  void insertAtIndexInKitchen(int index, String item) =>
      kitchen.insert(index, item);
  void updateKitchenAtIndex(int index, Function(String) updateFn) =>
      kitchen[index] = updateFn(kitchen[index]);

  List<String> commercial = [
    'Office Space',
    'Conference Room',
    'Break Room',
    'Reception Area',
    'Warehouse'
  ];
  void addToCommercial(String item) => commercial.add(item);
  void removeFromCommercial(String item) => commercial.remove(item);
  void removeAtIndexFromCommercial(int index) => commercial.removeAt(index);
  void insertAtIndexInCommercial(int index, String item) =>
      commercial.insert(index, item);
  void updateCommercialAtIndex(int index, Function(String) updateFn) =>
      commercial[index] = updateFn(commercial[index]);

  List<String> garages = [
    'Garage',
    'Balcony/Terrace',
    'Garden/Patio',
    'Driveway'
  ];
  void addToGarages(String item) => garages.add(item);
  void removeFromGarages(String item) => garages.remove(item);
  void removeAtIndexFromGarages(int index) => garages.removeAt(index);
  void insertAtIndexInGarages(int index, String item) =>
      garages.insert(index, item);
  void updateGaragesAtIndex(int index, Function(String) updateFn) =>
      garages[index] = updateFn(garages[index]);

  ///  State fields for stateful widgets in this page.

  // Models for zRoomsCard dynamic component.
  late FlutterFlowDynamicModels<ZRoomsCardModel> zRoomsCardModels1;
  // Models for zRoomsCard dynamic component.
  late FlutterFlowDynamicModels<ZRoomsCardModel> zRoomsCardModels2;
  // Models for zRoomsCard dynamic component.
  late FlutterFlowDynamicModels<ZRoomsCardModel> zRoomsCardModels3;
  // Models for zRoomsCard dynamic component.
  late FlutterFlowDynamicModels<ZRoomsCardModel> zRoomsCardModels4;
  // Models for zRoomsCard dynamic component.
  late FlutterFlowDynamicModels<ZRoomsCardModel> zRoomsCardModels5;

  @override
  void initState(BuildContext context) {
    zRoomsCardModels1 = FlutterFlowDynamicModels(() => ZRoomsCardModel());
    zRoomsCardModels2 = FlutterFlowDynamicModels(() => ZRoomsCardModel());
    zRoomsCardModels3 = FlutterFlowDynamicModels(() => ZRoomsCardModel());
    zRoomsCardModels4 = FlutterFlowDynamicModels(() => ZRoomsCardModel());
    zRoomsCardModels5 = FlutterFlowDynamicModels(() => ZRoomsCardModel());
  }

  @override
  void dispose() {
    zRoomsCardModels1.dispose();
    zRoomsCardModels2.dispose();
    zRoomsCardModels3.dispose();
    zRoomsCardModels4.dispose();
    zRoomsCardModels5.dispose();
  }
}
