import 'package:flutter/material.dart';

import '../../core/core.dart';
import '../../widgets/widgets.dart';

const String resourcePath = 'resources/intercorrencias_mama/leite_empedrado';

class LeiteEmpedrado extends StatelessWidget {
  static const title = 'Leite Empedrado';
  static final routeName = '/${title.toLowerCase()}';

  LeiteEmpedrado({super.key});

  static Map<String, String> get properties => {'title': title, 'routeName': routeName};

  final content = [
    GenericContentTab(
        header: 'O que é?',
        getWidgets: getCustomContentFromJson('$resourcePath/oquee.json')),
    GenericContentTab(
        header: 'O que causa?',
        getWidgets: getCustomContentFromJson('$resourcePath/oquecausa.json')),
    GenericContentTab(
        header: 'Como prevenir?',
        getWidgets:
            getCustomContentFromJson('$resourcePath/comoprevenir.json')),
    GenericContentTab(
        header: 'Como tratar?',
        getWidgets: getCustomContentFromJson('$resourcePath/comotratar.json')),
  ];

  @override
  Widget build(BuildContext context) {
    return GenericTabScreen(title: title, tabContents: content);
  }
}
