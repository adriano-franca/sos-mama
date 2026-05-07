import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import '../widgets/widgets.dart';

Future<Map<String, dynamic>> parseJsonFromAssets(String assetsPath) async {
  print('--- Parse json from: $assetsPath');
  return rootBundle
      .loadString(assetsPath)
      .then((jsonStr) => jsonDecode(jsonStr));
}

Future<String> getTextFromTxt(String path) async {
  print('--- Get text from: $path');
  return await rootBundle.loadString(path);
}

Future getCustomContentFromJson(String jsonResource) async {
  final data = await parseJsonFromAssets(jsonResource);
  final content = data['content'] as List;
  return content
      .map((e) => CustomContent(
            model: CustomContentModel.fromJson(e),
          ))
      .toList();
}
