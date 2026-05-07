import 'package:flutter/material.dart';

import '../../core/core.dart';
import '../../widgets/widgets.dart';

const String fissurasResourcePath =
    'resources/intercorrencias_mama/fissuras_no_mamilo';

Future ff() async {
  await Future.delayed(const Duration(seconds: 1));
  return [const Text('dd')];
}

class FissurasNoMamilo extends StatelessWidget {
  static const title = 'Fissuras no Mamilo';
  static final routeName = '/${title.toLowerCase()}';

  FissurasNoMamilo({super.key});
  static Map<String, String> get properties => {'title': title, 'routeName': routeName};

  final content = [
    GenericContentTab(
        header: 'O que é?',
        getWidgets:
            getCustomContentFromJson('$fissurasResourcePath/oquee.json')),
    GenericContentTab(
        header: 'Como prevenir?',
        getWidgets: getCustomContentFromJson(
            '$fissurasResourcePath/comoprevenir.json')),
    GenericContentTab(
        header: 'Como tratar?',
        getWidgets:
            getCustomContentFromJson('$fissurasResourcePath/comotratar.json')),
    GenericContentTab(
        header: 'Dicas',
        getWidgets:
            getCustomContentFromJson('$fissurasResourcePath/dicas.json')),
  ];

  @override
  Widget build(BuildContext context) {
    return GenericTabScreen(
      title: title,
      tabContents: content,
    );
  }
}
