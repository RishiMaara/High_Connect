import 'dart:math';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';

double calculateDistance(LatLng? latLng1, LatLng? latLng2) {
  if (latLng1 == null || latLng2 == null) return double.maxFinite;
  var p = 0.017453292519943295;
  var c = cos;
  var a = 0.5 -
      c((latLng2.latitude - latLng1.latitude) * p) / 2 +
      c(latLng1.latitude * p) * c(latLng2.latitude * p) *
          (1 - c((latLng2.longitude - latLng1.longitude) * p)) / 2;
  
  // Ensure 'a' is safely within [0.0, 1.0] to prevent NaN inside sqrt/asin due to floating point precision
  final safeA = min(1.0, max(0.0, a));
  return 12742 * asin(sqrt(safeA));
}

class ServiceScore {
  final ServicesRecord service;
  final double score;
  final double distance;

  ServiceScore(this.service, this.score, this.distance);
}

List<ServicesRecord> getRecommendedServices(
  List<ServicesRecord> services,
  FFAppState appState,
  LatLng? userLocation,
) {
  List<ServiceScore> scoredServices = services.map((service) {
    double score = 0.0;
    
    // 1. Location proximity (30%)
    double distance = calculateDistance(userLocation, service.geopoint);
    if (distance != double.maxFinite) {
      double maxDist = 50.0; // Assuming 50km is the max distance of interest
      double locScore = max(0.0, (1.0 - (distance / maxDist)) * 30.0);
      score += locScore;
    }

    // 2. Specialization match (25%)
    if (appState.selectedCategories.isNotEmpty &&
        appState.selectedCategories.contains(service.category)) {
      score += 25.0;
    } else if (appState.selectedCategories.isEmpty) {
      // If no specialization selected, give baseline score
      score += 12.5;
    }

    // 3. Ratings/reviews (20%)
    score += (service.rate / 5.0) * 20.0;

    // 4. Availability (15%)
    if (service.availableDays.isNotEmpty) {
      score += 15.0;
    }

    // 5. Portfolio richness bonus (10%)
    if (service.gallery.isNotEmpty) {
      score += min(10.0, service.gallery.length * 2.0);
    }

    return ServiceScore(service, score, distance);
  }).toList();

  // Sort descending by score (handle NaNs gracefully for release APK)
  scoredServices.sort((a, b) {
    double scoreA = a.score.isNaN ? 0.0 : a.score;
    double scoreB = b.score.isNaN ? 0.0 : b.score;
    return scoreB.compareTo(scoreA);
  });

  return scoredServices.map((s) => s.service).toList();
}
