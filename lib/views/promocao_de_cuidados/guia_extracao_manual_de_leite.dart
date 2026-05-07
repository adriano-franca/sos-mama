import 'package:flutter/material.dart';
import '../../core/core.dart';
import '../../widgets/main_app_bar.dart';
import '../../widgets/video.dart';

import '../../widgets/widgets.dart';

const guiaResourcesPath =
    'resources/promocao_cuidados/guia_extracao_manual_leite';

class GuiaExtracaoManualDeLeite extends StatelessWidget {
  static const title = 'Guia de Extração Manual de Leite';
  static final routeName = '/${title.toLowerCase()}';

  GuiaExtracaoManualDeLeite({super.key});

  static Map<String, String> get properties =>
      {'title': title, 'routeName': routeName};

  final future = getRawInfo('$guiaResourcesPath/guiaextracaomanualleite.json');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        "Guia de Extração\nManual de Leite",
        context: context,
      ),
      body: FutureBuilder(
        future: future,
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final data = snapshot.data as List<Map>;
            final children = buildContent(context, data);
            return Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [UIHelper.largerVerticalSpacer, ...children],
                  ),
                ),
              ),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}

List<Widget> buildContent(BuildContext context, List<Map> data) {
  final children = <Widget>[];
  for (var i = 0; i < data.length; i++) {
    final text = data[i]['text'];
    final String? videoAsset = data[i]['video'];
    final card = Card(
      color: (i % 2 == 0) ? primaryColor : secondaryColor,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text(
              text,
              style: const TextStyle(fontSize: mediumFontSize),
              textAlign: TextAlign.center,
            ),
            TextButton(
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Assitir Vídeo',
                    style:
                        TextStyle(fontSize: smallFontSize, color: Colors.black),
                  ),
                  Icon(
                    Icons.play_arrow,
                    color: Colors.green,
                  ),
                ],
              ),
              onPressed: () async {
                return showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    content: Video(asset: videoAsset),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
    children.add(card);
  }
  return children;
}

Future getRawInfo(String json) async {
  final data = await parseJsonFromAssets(json);
  final rawCon = data['content'] as List;
  final content = <Map>[];
  for (var i = 0; i < rawCon.length; i++) {
    final text = await getTextFromTxt(rawCon[i]['text']);
    content.add({'text': text, 'video': rawCon[i]['video']});
  }
  return content;
}
