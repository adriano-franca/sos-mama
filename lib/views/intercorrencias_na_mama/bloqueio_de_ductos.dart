import 'package:flutter/material.dart';

import '../../core/utils.dart';
import '../../widgets/widgets.dart';

const bloqueioDuctosResources =
    'resources/intercorrencias_mama/bloqueio_ductos';

class BloqueioDeDuctos extends StatelessWidget {
  static const title = 'Bloqueio de Ductos';
  static final routeName = '/${title.toLowerCase()}';

  BloqueioDeDuctos({super.key});
  static Map<String, String> get properties =>
      {'title': title, 'routeName': routeName};

  final content = [
    GenericContentTab(
        header: 'O que é?',
        getWidgets:
            getCustomContentFromJson('$bloqueioDuctosResources/oquee.json')),
    GenericContentTab(
        header: 'Como prevenir?',
        getWidgets: getCustomContentFromJson(
            '$bloqueioDuctosResources/comoprevenir.json')),
    GenericContentTab(
        header: 'Sintomas',
        getWidgets:
            getCustomContentFromJson('$bloqueioDuctosResources/sintomas.json')),
    GenericContentTab(
        header: 'Como tratar?',
        getWidgets: getCustomContentFromJson(
            '$bloqueioDuctosResources/comotratar.json')),
  ];

  @override
  Widget build(BuildContext context) {
    return GenericTabScreen(
      title: title,
      tabContents: content,
    );
  }
}
