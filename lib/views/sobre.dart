import 'package:flutter/material.dart';
import '../widgets/main_app_bar.dart';
import '../core/core.dart';

Future<List<Widget>> getSobreContent(String json) async {
  final widgets = <Widget>[];
  final content = await parseJsonFromAssets(json);
  final data = content['content'] as List;
  for (var item in data) {
    final image = item['picture'];
    final name = item['name'];
    final description = item['description'];

    if (widgets.isEmpty) {
      widgets.add(SobreItemSOS(
          imageResource: image, name: name, description: description));
    } else {
      widgets.add(
        SobreItem(imageResource: image, name: name, description: description),
      );
    }
  }

  return widgets;
}

class Sobre extends StatelessWidget {
  static const title = 'Sobre';
  static final routeName = title.toLowerCase();

  final future = getSobreContent('resources/sobre/sobre.json');

  Sobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title, context: context),
      body: FutureBuilder(
        future: future,
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Scrollbar(
                child: ListView(
                  children: [
                    UIHelper.largerVerticalSpacer,
                    ...((snapshot.data as List) as List<Widget>)
                  ],
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class SobreItemSOS extends StatelessWidget {
  final String? imageResource;
  final String? description;
  final String? name;

  const SobreItemSOS(
      {super.key, this.imageResource, this.description, this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 150,
            width: 150,
            child: CircleAvatar(
              backgroundImage: AssetImage(imageResource!),
            ),
          ),
          UIHelper.smallVerticalSpacer,
          (name == null)
              ? Container()
              : Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    name!,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: mediumFontSize,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Text(
              description!,
              style: const TextStyle(
                  color: Colors.black, fontSize: mediumFontSize),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class SobreItem extends StatelessWidget {
  final String? imageResource;
  final String? description;
  final String? name;

  const SobreItem({super.key, this.imageResource, this.description, this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 100,
              width: 100,
              child: CircleAvatar(
                backgroundImage: AssetImage(imageResource!),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  (name == null)
                      ? Container()
                      : Text(name!,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: mediumFontSize,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left),
                  Text(description!,
                      style: const TextStyle(
                          color: Colors.black, fontSize: mediumFontSize),
                      textAlign: TextAlign.left),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
