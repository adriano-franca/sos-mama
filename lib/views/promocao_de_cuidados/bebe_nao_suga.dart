import 'package:flutter/material.dart';

import '../../core/core.dart';
import '../../widgets/widgets.dart';

class BebeNaoSuga extends StatelessWidget {
  static const title = 'Bebê não suga';
  static final routeName = '/${title.toLowerCase()}';

  BebeNaoSuga({super.key});

  static Map<String, String> get properties =>
      {'title': title, 'routeName': routeName};

  final future = getCustomContentFromJson(
      'resources/promocao_cuidados/bebe_nao_suga/content.json');

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
