import 'package:url_launcher/url_launcher.dart';

class UriLauncher {
  static Future<void> openUrlonBrowser(String url) async {
    if (url != "Not Available") {
      Uri uri = Uri.parse(url);
      if (!await launchUrl(uri)) {
        throw Exception('Could not launch $uri');
      }
    }
  }

  static Future<void> openUrlonPhone(String url) async {
    if (url != "Not Available") {
      final Uri uri = Uri(
        scheme: 'tel',
        path: url,
      );
      await launchUrl(uri);
    }
  }
}
