import 'package:flutter/material.dart';

import '../../core/core.dart';
import '../../widgets/widgets.dart';

const abscessoResourcesPath = 'resources/intercorrencias_mama/abcesso';

class AbscessoMamario extends StatelessWidget {
  static const title = 'Abscesso Mamário';
  static final routeName = '/${title.toLowerCase()}';

  AbscessoMamario({super.key});
  static Map<String, String> get properties =>
      {'title': title, 'routeName': routeName};

  final content = [
    GenericContentTab(
        header: 'O que é?',
        getWidgets:
            getCustomContentFromJson('$abscessoResourcesPath/oquee.json')),
    GenericContentTab(
      header: 'Como prevenir?',
      getWidgets:
          getCustomContentFromJson('$abscessoResourcesPath/comoprevenir.json'),
    ),
    GenericContentTab(
        header: 'Sintomas',
        getWidgets:
            getCustomContentFromJson('$abscessoResourcesPath/sintomas.json')),
    GenericContentTab(
        header: 'Como tratar?',
        getWidgets:
            getCustomContentFromJson('$abscessoResourcesPath/comotratar.json')),
  ];

  @override
  Widget build(BuildContext context) {
    return GenericTabScreen(title: title, tabContents: content);
  }
}
