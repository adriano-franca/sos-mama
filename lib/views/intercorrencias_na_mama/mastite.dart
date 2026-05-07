import 'package:flutter/material.dart';

import '../../core/utils.dart';
import '../../widgets/widgets.dart';

const mastiteResourcePath = 'resources/intercorrencias_mama/mastite';

class Mastite extends StatelessWidget {
  static const title = 'Mastite';
  static final routeName = '/${title.toLowerCase()}';

  Mastite({super.key});
  static Map<String, String> get properties => {'title': title, 'routeName': routeName};

  final content = [
    GenericContentTab(
        header: 'O que é?',
        getWidgets:
            getCustomContentFromJson('$mastiteResourcePath/oquee.json')),
    GenericContentTab(
        header: 'Como prevenir?',
        getWidgets:
            getCustomContentFromJson('$mastiteResourcePath/comoprevenir.json')),
    GenericContentTab(
        header: 'Sintomas',
        getWidgets:
            getCustomContentFromJson('$mastiteResourcePath/sintomas.json')),
    GenericContentTab(
        header: 'Como tratar?',
        getWidgets:
            getCustomContentFromJson('$mastiteResourcePath/comotratar.json')),
  ];

  @override
  Widget build(BuildContext context) {
    return GenericTabScreen(
      title: title,
      tabContents: content,
    );
  }
}
