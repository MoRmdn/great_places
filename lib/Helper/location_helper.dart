import 'dart:convert';

import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class LocationHelper {
  static const String apiKey = 'AIzaSyAFqICkpGxnxM9Cq86uslbvZSImIbXuwtc';

  // get image review on flyURL
  static String generateImagePreview({double? altitude, longitude}) {
    String imagePreview =
        'https://maps.googleapis.com/maps/api/staticmap?center=&$altitude,$longitude&zoom=25&size=800x400&maptype=roadmap&markers=color:red%7Clabel:A%7C$altitude,$longitude&key=$apiKey';
    return imagePreview;
  }

  // send url to api to get me image Preview
  static Future<String> getAddress(double lat, lng) async {
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$apiKey';
    final response = await http.get(Uri.parse(url));
    final result =
        json.decode(response.body)['results'][0]['formatted_address'];
    return result;
  }
}
