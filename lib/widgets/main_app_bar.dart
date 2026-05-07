import 'package:flutter/material.dart';
import 'package:sos_mama/core/colors.dart';
import '../views/views.dart';

class MainAppBar extends AppBar {
  final String _title;
  final BuildContext context;
  final List<Widget> _actions = [];

  MainAppBar(this._title,
      {super.key, required this.context, List<Widget>? actions})
      : super(centerTitle: true, backgroundColor: primaryColor) {
    _actions.add(
      IconButton(
        icon: const Icon(Icons.home),
        onPressed: () => Navigator.pushNamedAndRemoveUntil(
            context, Home.routeName, (Route<dynamic> route) => false),
      ),
    );

    if (actions != null) {
      _actions.clear();
      _actions.addAll(actions);
    }
  }

  @override
  Widget get title =>
      Text(_title, softWrap: true, style: const TextStyle(color: Colors.white));

  @override
  List<Widget> get actions => _actions;

  @override
  IconThemeData get iconTheme => const IconThemeData(color: Colors.white);
}
