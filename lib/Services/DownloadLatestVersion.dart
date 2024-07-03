import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:install_plugin/install_plugin.dart';
import 'package:path_provider/path_provider.dart';

Future<void> downloadAndUpdateApp(String apkUrl) async {
  final directory = await getTemporaryDirectory();
  final filePath = '${directory.path}/update_test_project.apk';

  final response = await http.get(Uri.parse(apkUrl));
  final file = File(filePath);
  await file.writeAsBytes(response.bodyBytes);

  InstallPlugin.installApk(filePath, appId: 'com.update.test').then((result) {
    print('Install result: $result');
  }).catchError((error) {
    print('Install error: $error');
  });
}
