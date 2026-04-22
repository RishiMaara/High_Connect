import 'dart:math';

class LatLng {
  final double latitude;
  final double longitude;
  LatLng(this.latitude, this.longitude);
}

double calculateDistance(LatLng? latLng1, LatLng? latLng2) {
  if (latLng1 == null || latLng2 == null) return double.maxFinite;
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((latLng2.latitude - latLng1.latitude) * p) / 2 +
      c(latLng1.latitude * p) * c(latLng2.latitude * p) *
          (1 - c((latLng2.longitude - latLng1.longitude) * p)) / 2;
  return 12742 * asin(sqrt(a));
}

void main() {
  print("Distance precision test:");
  LatLng sameLoc1 = LatLng(40.7127753, -74.0059728);
  LatLng sameLoc2 = LatLng(40.7127753, -74.0059728);
  
  double dist = calculateDistance(sameLoc1, sameLoc2);
  print("Distance between same locations: $dist (isNaN: ${dist.isNaN})");

  double closeLocDist = calculateDistance(
      LatLng(40.7127753, -74.0059728), 
      LatLng(40.7127754, -74.0059728));
  print("Distance close locations: $closeLocDist (isNaN: ${closeLocDist.isNaN})");

  print("All Tests Passed");
}
