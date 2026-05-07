import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/core.dart';
import '../widgets/widgets.dart';

Future getBancosContent(String json) async {
  final resources = await parseJsonFromAssets(json);
  final content = resources['content'] as List;

  return content
      .map(
        (e) => EncontrarAjudaItem(
          imageAsset: e['imageAsset'],
          region: e['region'],
          url: e['url'],
        ),
      )
      .toList();
}

class OndeEncontrarAjuda extends StatelessWidget {
  static const title = 'Onde Encontrar Ajuda';

  static final routeName = '/${title.toLowerCase()}';

  static const resource = 'resources/bancos_leite/content.json';

  final future = getBancosContent(resource);

  OndeEncontrarAjuda({super.key});

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
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Scrollbar(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        UIHelper.largerVerticalSpacer,
                        const Icon(
                          Icons.location_pin,
                          color: primaryColor,
                          size: 100,
                        ),
                        UIHelper.mediumVerticalSpacer,
                        ...((snapshot.data as List) as List<Widget>)
                      ],
                    ),
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

class EncontrarAjudaItem extends StatelessWidget {
  final String region;
  final String imageAsset;
  final String url;

  const EncontrarAjudaItem(
      {super.key,
      required this.region,
      required this.imageAsset,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: GestureDetector(
        onTap: () async {
          if (!await launchUrl(Uri.parse(url))) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('ERRO'),
                    content: const Text(
                        'Para acessar o conteúdo é nescessário acessoa a internet'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                });
          }
        },
        child: Card(
          color: primaryColor,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(imageAsset),
                ),
              ),
              Expanded(
                child: Container(
                  child: Center(
                    child: Text(
                      'Localizados na\nRegião $region',
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
