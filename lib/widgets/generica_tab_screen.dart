import 'package:flutter/material.dart';
import '../views/views.dart';

import '../core/core.dart';
import 'generic_content_tab.dart';

class TabContent {
  final String? tabTitle;
  final Widget? content;

  TabContent({this.tabTitle, this.content});
}

class GenericTabScreen extends StatelessWidget {
  final String? title;

  final List<GenericContentTab>? tabContents;

  const GenericTabScreen({super.key, this.title, this.tabContents});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabContents!.length,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              title!,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context, Home.routeName, (Route<dynamic> route) => false),
              )
            ],
            iconTheme: const IconThemeData(color: Colors.white),
            bottom: TabBar(
              tabs: tabContents!
                  .map(
                    (tabContent) => Text(
                      tabContent.header!,
                      style: const TextStyle(
                          fontSize: smallFontSize, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  )
                  .toList(),
            ),
          ),
          body: TabBarView(
              children: tabContents!.map((tabContent) => tabContent).toList())),
    );
  }
}
