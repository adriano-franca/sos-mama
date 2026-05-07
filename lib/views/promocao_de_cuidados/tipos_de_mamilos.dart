import 'package:flutter/material.dart';
import '../../core/core.dart';

import '../../widgets/widgets.dart';

Future getTiposContent(String json) async {
  final resource = await parseJsonFromAssets(json);
  final content = resource['content'] as List;
  final widget = <Widget>[];
  for (var c in content) {
    widget.add(CustomContent(
        model: CustomImageContentModel(
            imageResouce: c['image'], subtitleResource: c['text'])));
  }
  return widget;
}

class TiposDeMamilos extends StatelessWidget {
  static const title = 'Tipos de Mamilos';
  static final routeName = '/${title.toLowerCase()}';
  static const resource =
      'resources/promocao_cuidados/tipos_mamilo/content.json';

  TiposDeMamilos({super.key});

  static Map<String, String> get properties =>
      {'title': title, 'routeName': routeName};

  final future = getTiposContent(resource);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title,
        context: context,
      ),
      body: FutureBuilder(
        future: future,
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: Column(
                children: (snapshot.data as List) as List<Widget>,
              ),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
