import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';
import 'intercorrencias_na_mama.dart';

class IntercorrenciasNaMama extends StatelessWidget {
  static const String title = 'Intercorrências na Mama';
  static const String routeName = '/IntercorrenciasNaMama';
  static const String icon = 'resources/intercorrencias_mama/icon.png';

  const IntercorrenciasNaMama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title,
        context: context,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Column(
              children: <Widget>[
                PrimaryButton(
                  text: LeiteEmpedrado.title,
                  onTap: () =>
                      Navigator.pushNamed(context, LeiteEmpedrado.routeName),
                ),
                PrimaryButton(
                  text: FissurasNoMamilo.title,
                  onTap: () =>
                      Navigator.pushNamed(context, FissurasNoMamilo.routeName),
                ),
                PrimaryButton(
                  text: Mastite.title,
                  onTap: () => Navigator.pushNamed(context, Mastite.routeName),
                ),
                PrimaryButton(
                  text: BloqueioDeDuctos.title,
                  onTap: () =>
                      Navigator.pushNamed(context, BloqueioDeDuctos.routeName),
                ),
                PrimaryButton(
                  text: AbscessoMamario.title,
                  onTap: () =>
                      Navigator.pushNamed(context, AbscessoMamario.routeName),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
