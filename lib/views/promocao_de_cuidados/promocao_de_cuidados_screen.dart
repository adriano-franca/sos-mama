import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';
import 'promocao_de_cuidados.dart';

class PromocaoDeCuidados extends StatelessWidget {
  static const String title = 'Promoção de Cuidados';
  static final routeName = '/${title.toLowerCase()}';
  static const String icon = 'resources/promocao_cuidados/icon.png';

  const PromocaoDeCuidados({super.key});

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
                  text: PegaCorreta.title,
                  onTap: () =>
                      Navigator.pushNamed(context, PegaCorreta.routeName),
                ),
                PrimaryButton(
                  text: GuiaExtracaoManualDeLeite.title,
                  onTap: () => Navigator.pushNamed(
                      context, GuiaExtracaoManualDeLeite.routeName),
                ),
                PrimaryButton(
                  text: QueixaDePoucoLeite.title,
                  onTap: () => Navigator.pushNamed(
                      context, QueixaDePoucoLeite.routeName),
                ),
                PrimaryButton(
                  text: TiposDeMamilos.title,
                  onTap: () =>
                      Navigator.pushNamed(context, TiposDeMamilos.routeName),
                ),
                PrimaryButton(
                  text: DescidaDoLeite.title,
                  onTap: () =>
                      Navigator.pushNamed(context, DescidaDoLeite.routeName),
                ),
                PrimaryButton(
                  text: BebeNaoSuga.title,
                  onTap: () =>
                      Navigator.pushNamed(context, BebeNaoSuga.routeName),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
