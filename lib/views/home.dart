import 'package:flutter/material.dart';

import '../core/core.dart';
import '../widgets/widgets.dart';
import 'views.dart';

class Home extends StatelessWidget {
  static const String routeName = '/Home';

  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        'SOS Mama',
        context: context,
        actions: [
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () => Navigator.pushNamed(context, Sobre.routeName),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 80, bottom: 80),
              child: Text('SOS MAMA', style: headerTextStyle),
            ),
            Expanded(
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      PrimaryButton(
                        text: IntercorrenciasNaMama.title,
                        icon: Image.asset(
                          IntercorrenciasNaMama.icon,
                          color: Colors.white,
                        ),
                        onTap: () => Navigator.pushNamed(
                            context, IntercorrenciasNaMama.routeName),
                      ),
                      PrimaryButton(
                        text: PromocaoDeCuidados.title,
                        icon: Image.asset(
                          PromocaoDeCuidados.icon,
                          color: Colors.white,
                        ),
                        onTap: () => Navigator.pushNamed(
                            context, PromocaoDeCuidados.routeName),
                      ),
                      PrimaryButton(
                        text: OndeEncontrarAjuda.title,
                        icon: const Icon(
                          Icons.location_pin,
                          color: Colors.white,
                          size: 50,
                        ),
                        onTap: () => Navigator.pushNamed(
                            context, OndeEncontrarAjuda.routeName),
                      ),
                      PrimaryButton(
                        text: CronometroDeAmamentacao.title,
                        icon: const Icon(
                          Icons.timer,
                          color: Colors.white,
                          size: 50,
                        ),
                        onTap: () => Navigator.pushNamed(
                            context, CronometroDeAmamentacao.routeName),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
