import 'dart:convert';

import 'package:flutter/material.dart';
import '../../widgets/video.dart';

import '../../core/core.dart';
import '../../widgets/widgets.dart';

const pegaCorretaResourcesPath = 'resources/promocao_cuidados/pega_correta';

class PegaCorreta extends StatelessWidget {
  static const title = 'Pega Correta';
  static final routeName = '/${title.toLowerCase()}';

  PegaCorreta({super.key});
  static Map<String, String> get properties =>
      {'title': title, 'routeName': routeName};

  final content = [
    GenericContentTab(
      header: 'Como Fazer\nPega Correta',
      getWidgets: getPegaCorretaContent(
          '$pegaCorretaResourcesPath/comofazerpegacorreta.json'),
    ),
    GenericContentTab(
      header: 'Sinais de\nPega Inadequada',
      getWidgets: getDegradeList(
          '$pegaCorretaResourcesPath/indicativosdepegainadequada.json'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GenericTabScreen(title: title, tabContents: content);
  }
}

// TODO - refatorar para inserir no content model
Future<List<Widget>> getDegradeList(String jsonResource) async {
  final data = await parseJsonFromAssets(jsonResource);
  final content = data['content'] as List;
  final text = await getTextFromTxt(content[0]['subtitle']);
  LineSplitter ls = const LineSplitter();
  List<String> lines = ls.convert(text);
  final widgets = <Widget>[];
  for (var i = 0; i < lines.length; i++) {
    widgets.add(
      Card(
        color: (i % 2 == 0) ? primaryColor : secondaryColor,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            lines[i],
            style:
                const TextStyle(fontSize: mediumFontSize, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget colum = Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: widgets,
  );
  return [colum];
}

Future<List<Widget>> getPegaCorretaContent(String jsonResource) async {
  final data = await parseJsonFromAssets(jsonResource);
  final contents = data['content'] as List;
  final widgets = <Widget>[];

  for (var i = 0; i < contents.length; i++) {
    widgets.add(
      Card(
        color: (i % 2 == 0) ? primaryColor : secondaryColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                contents[i]['text'],
                style: const TextStyle(
                    fontSize: mediumFontSize, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
            if (contents[i]['type'] == 'video')
              Builder(builder: (context) {
                return TextButton(
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Assitir Vídeo',
                        style: TextStyle(
                            fontSize: smallFontSize, color: Colors.black),
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
                        content: Video(
                          asset: contents[i]['media'],
                        ),
                      ),
                    );
                  },
                );
              })
          ],
        ),
      ),
    );
  }

  final colum = Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: widgets,
  );

  return [colum];
}
