import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Urllunch {
  launchURLApp(String urrl) async {
    var url = Uri.parse(urrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.inAppWebView);
    } else {
      throw 'Could not launch $url';
    }
  }

  // Future<void> launchInWebViewOrVC(String urlll) async {
  //   var url = Uri.parse(urlll);
  //   if (!await launchUrl(
  //     url,
  //     mode: LaunchMode.inAppWebView,
  //     webViewConfiguration: const WebViewConfiguration(
  //         headers: <String, String>{'my_header_key': 'my_header_value'}),
  //   )) {
  //     throw 'Could not launch $url';
  //   }
  // }

  // Future<void> openMap(String urlll) async {
  //   var url = Uri.parse(urlll);
  //   if (await canLaunchUrlString(urlll)) {
  //     await launchUrl(url, mode: LaunchMode);
  //   } else {
  //     throw ' could not open map';
  //   }
  // }
}
