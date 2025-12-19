import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

Set<Polyline> polylineSet = {};
List<LatLng> polyLineCoordinates = [];

Future<void> getPolyLine(
  double lat,
  double long,
  double disLat,
  double disLong,
) async {
  final url = "https://api.openrouteservice.org/v2/directions/driving-car/json";

  final headers = {
    "Content-Type": "application/json; charset=utf-8",
    "Authorization":
        "your api key" // ضع مفتاحك هنا
  };

  final body = jsonEncode({
    "coordinates": [
      [long, lat], // نقطة البداية (lon, lat)
      [disLong, disLat], // نقطة النهاية (lon, lat)
    ],
  });

  final response = await http.post(
    Uri.parse(url),
    headers: headers,
    body: body,
  );
  print(body);

  if (response.statusCode == 200 || response.statusCode == 201) {
    var data = jsonDecode(response.body);

    // ORS يرجع coordinates بالشكل [lon, lat]
    List coords = data['features'][0]['geometry']['coordinates'];

    polyLineCoordinates.clear();
    for (var c in coords) {
      polyLineCoordinates.add(LatLng(c[1], c[0])); // قلب الترتيب
    }

    // خزّن الخط بالرسم
    polylineSet = {
      Polyline(points: polyLineCoordinates, strokeWidth: 10, color: Colors.red),
    };
  } else {
    print("Error: ${response.statusCode}");
    print(response.body);
  }
}
