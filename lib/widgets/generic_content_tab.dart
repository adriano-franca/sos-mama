import 'package:flutter/material.dart';

import '../core/core.dart';

class GenericContentTab extends StatelessWidget {
  final String? header;
  final Future? getWidgets;

  const GenericContentTab({super.key, this.header, this.getWidgets});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getWidgets,
      initialData: const [],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final data = snapshot.data as List<Widget>;
          return Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Column(
              children: [
                UIHelper.largerVerticalSpacer,
                Expanded(
                  child: Scrollbar(
                    thumbVisibility: true,
                    trackVisibility: true,
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (_, i) => Padding(
                          padding: const EdgeInsets.only(bottom: 50),
                          child: data[i]),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
