import 'dart:convert';
import 'package:http/http.dart' as http;
import 'DownloadLatestVersion.dart';

Future<void> checkForUpdates() async {
  final currentVersion = '1.0.0';
  final latestVersionData = await getLatestVersionFromGitHub();

  if (latestVersionData['version'] != currentVersion) {
    await downloadAndUpdateApp(latestVersionData['apk_url']);
  }
}

Future<Map<String, dynamic>> getLatestVersionFromGitHub() async {
  final response = await http.get(Uri.parse(''));

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to fetch latest version from GitHub');
  }
}
