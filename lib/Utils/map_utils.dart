import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vector_math/vector_math_64.dart';

class MapUtils {
  static List<LatLng> convertToLatLng(List points)  {
    List<LatLng> result = <LatLng>[];
    for (int i = 0; i < points.length; i++) {
      if (i % 2 != 0) {
        result.add(LatLng(points[i - 1], points[i]));
      }
    }
    print(result[0]);
    print(result[50]);
    print(result.length);

    return result;
  }

  static List decodePoly(String poly) {
    var list = poly.codeUnits;
    var lList = [];
    int index = 0;
    int len = poly.length;
    int c = 0;
    // repeating until all attributes are decoded
    do {
      var shift = 0;
      int result = 0;

      // for decoding value of one attribute
      do {
        c = list[index] - 63;
        result |= (c & 0x1F) << (shift * 5);
        index++;
        shift++;
      } while (c >= 32);
      /* if value is negative then bitwise not the value */
      if (result & 1 == 1) {
        result = ~result;
      }
      var result1 = (result >> 1) * 0.00001;
      lList.add(result1);
    } while (index < len);

    /*adding to previous value as done in encoding */
    for (var i = 2; i < lList.length; i++) lList[i] += lList[i - 2];

    print(lList.toString());

    return lList;
  }

  static double calculateDistance(LatLng latLng1, LatLng latLng2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((latLng1.latitude - latLng1.longitude) * p) / 2 +
        c(latLng1.latitude * p) * c(latLng2.latitude * p) * (1 - c((latLng2.longitude - latLng1.longitude) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

 static double getRotation(LatLng start, LatLng end) {
    double latDifference = (start.latitude - end.latitude).abs();
    double lngDifference = (start.longitude - end.longitude).abs();
    double rotation = -1;
    if (start.latitude < end.latitude && start.longitude < end.longitude) {
      rotation = degrees(atan(lngDifference / latDifference));
    }
    if (start.latitude >= end.latitude && start.longitude < end.longitude) {
      rotation = (90 - degrees(atan(lngDifference / latDifference)) + 90);
    }
    if (start.latitude >= end.latitude && start.longitude >= end.longitude) {
      rotation = (degrees(atan(lngDifference / latDifference)) + 180);
    }
    if (start.latitude < end.latitude && start.longitude >= end.longitude) {
      rotation = (90 - degrees(atan(lngDifference / latDifference)) + 270);
    }

    return rotation;
  }
}
