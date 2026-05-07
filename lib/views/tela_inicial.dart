import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class TelaInicial extends StatelessWidget {
  final corTexto = Colors.deepPurple;
  final corButton = Colors.transparent;
  final corTitulo = Colors.deepPurple;
  final corDescricao = Colors.black;

  final double fontSizeTitulo = 18;

  const TelaInicial({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Column(
          children: <Widget>[
            Expanded(
              child: TelaInicialButton(
                title: Text(
                  'Intercorrências na Mama',
                  style: TextStyle(color: corTitulo, fontSize: fontSizeTitulo),
                  textAlign: TextAlign.start,
                ),
                descricao:
                    'Principais dificuldades para amamentar e como manejar cada uma delas',
                color: corButton,
                borderColor: corTitulo,
                icon: Image.asset(
                  'resources/icons/mama_icon.png',
                  height: 80,
                ),
                onTap: () =>
                    Navigator.pushNamed(context, '/IntercorrenciasMamaMenu'),
              ),
            ),
            Expanded(
              child: TelaInicialButton(
                title: Text(
                  'Promoção de Cuidados',
                  style: TextStyle(color: corTexto, fontSize: fontSizeTitulo),
                  textAlign: TextAlign.start,
                ),
                descricao:
                    'Como cuidar das mamas e principais dúvidas na amamentação ',
                color: corButton,
                borderColor: corTitulo,
                icon: Image.asset(
                  'resources/icons/promocao_cuidados.png',
                  height: 80,
                ),
                onTap: () => Navigator.pushNamed(context, '/PromocaoCuidados'),
              ),
            ),
            Expanded(
              child: TelaInicialButton(
                title: Text(
                  'Onde encontrar Ajuda',
                  style: TextStyle(color: corTitulo, fontSize: fontSizeTitulo),
                  textAlign: TextAlign.start,
                ),
                descricao:
                    'Se precisar de profissionais qualificados, aqui está o contato dos Bancos de Leite mais próximo de você',
                color: corButton,
                borderColor: corTitulo,
                icon: Icon(
                  Icons.location_on,
                  color: corTitulo,
                  size: 80,
                ),
                onTap: () => Navigator.pushNamed(context, '/BancosLeite'),
              ),
            ),
            Expanded(
              child: TelaInicialButton(
                title: Text(
                  'Crônometro de Amamentação',
                  style: TextStyle(color: corTitulo, fontSize: fontSizeTitulo),
                  textAlign: TextAlign.start,
                ),
                descricao:
                    'É possível registrar as mamadas. Lembrando que a amamentação deve ser realizada sob livre demanda',
                color: corButton,
                borderColor: corTitulo,
                icon: Icon(
                  Icons.timer,
                  color: corTitulo,
                  size: 80,
                ),
                onTap: () =>
                    Navigator.pushNamed(context, '/CronometroAmamentacao'),
              ),
            ),
            Expanded(
              child: TelaInicialButton(
                title: Text(
                  'Chat das Mães',
                  style: TextStyle(color: corTitulo, fontSize: fontSizeTitulo),
                  textAlign: TextAlign.start,
                ),
                descricao:
                    'Local para troca de experiências com outras mães que também vivenciam dificuldades para amamentar seus bebês',
                color: corButton,
                borderColor: corTitulo,
                icon: Icon(
                  Icons.chat,
                  color: corTitulo,
                  size: 80,
                ),
                onTap: () => Navigator.pushNamed(context, '/ChatMamaes'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
