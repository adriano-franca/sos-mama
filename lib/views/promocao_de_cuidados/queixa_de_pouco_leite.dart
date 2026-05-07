import 'dart:convert';

import 'package:flutter/material.dart';

import '../../core/core.dart';
import '../../widgets/widgets.dart';

class QueixaDePoucoLeite extends StatelessWidget {
  static const title = 'Queixa de Pouco Leite';
  static final routeName = '/${title.toLowerCase()}';

  QueixaDePoucoLeite({super.key});

  static Map<String, String> get properties =>
      {'title': title, 'routeName': routeName};

  static const resourcesPath =
      'resources/promocao_cuidados/queixa_pouco_leite/content.json';

  final future = getContent(resourcesPath);

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
            return Padding(
              padding: const EdgeInsets.only(right: 12, left: 12),
              child: Scrollbar(
                thumbVisibility: true,
                trackVisibility: true,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      UIHelper.mediumVerticalSpacer,
                      ...(snapshot.data as List) as List<Widget>
                    ],
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

Future<List<Widget>> getContent(String json) async {
  final data = await parseJsonFromAssets(json);
  final content = data['content'] as List;
  final text = await getTextFromTxt(content[0]['text']);
  LineSplitter ls = const LineSplitter();
  List<String> lines = ls.convert(text);
  final widgets = <Widget>[];

  widgets.add(
    Container(
      child: Image.asset(
        content[0]['image'],
        height: 400,
      ),
    ),
  );
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
