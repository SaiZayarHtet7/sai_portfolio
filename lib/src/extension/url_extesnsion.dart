import 'package:url_launcher/url_launcher.dart';

extension UrlExtension on String {
  Future<void> goToUrl() async {
    if (!await launchUrl(Uri.parse(this))) {
      throw Exception('Could not launch $this');
    }
  }
}
