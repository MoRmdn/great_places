import 'package:location/location.dart';

class LocationHelper {
  static const String apiKey = 'AIzaSyAFqICkpGxnxM9Cq86uslbvZSImIbXuwtc';

  static String generateImagePreview({double? altitude, longitude}) {
    String imagePreview =
        'https://maps.googleapis.com/maps/api/staticmap?center=&$altitude,$longitude&zoom=25&size=800x400&maptype=roadmap&markers=color:red%7Clabel:A%7C$altitude,$longitude&key=$apiKey';
    return imagePreview;
  }
}
