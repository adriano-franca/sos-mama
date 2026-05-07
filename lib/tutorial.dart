import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'core/core.dart';
import 'views/views.dart';
import 'widgets/widgets.dart';

class Tutorial extends StatelessWidget {
  static const String routeName = '/Tutorial';

  const Tutorial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "SOS Mama",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: primaryColor,
      ),
      body: TutorialBody(),
    );
  }
}

class TutorialBody extends StatelessWidget {
  final pages = [
    BoasVindas(),
    MainContent(),
    BancoDeLeite(),
    Cronometro(),
    const Chat(),
    const Agradecimentos()
  ];

  TutorialBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: IntroductionScreen(
            pages: pages
                .map((e) =>
                    PageViewModel(titleWidget: const SizedBox(), bodyWidget: e))
                .toList(),
            onDone: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, Home.routeName, (Route<dynamic> route) => false);
            },
            showDoneButton: true,
            showNextButton: true,
            showSkipButton: true,
            next: const Text("Próximo",
                style: TextStyle(fontWeight: FontWeight.w600)),
            skip: const Text("Pular",
                style: TextStyle(fontWeight: FontWeight.w600)),
            done: const Text("Ir para o App",
                style: TextStyle(fontWeight: FontWeight.w600)),
            dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              activeColor: primaryColor,
              color: secondaryColor,
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
            controlsPadding: const EdgeInsets.all(0),
            controlsMargin: const EdgeInsets.all(0),
          ),
        )
      ],
    );
  }
}

class CustomCard extends StatelessWidget {
  final Widget? child;

  const CustomCard({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      color: secondaryColor,
      child: Padding(padding: const EdgeInsets.all(20), child: child),
    );
  }
}

class CustomItem extends StatelessWidget {
  final String? text;

  const CustomItem({super.key, this.text});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      color: primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(
          text!,
          style: const TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class BoasVindas extends StatelessWidget {
  final text = RichText(
    textAlign: TextAlign.justify,
    text: const TextSpan(
        style:
            TextStyle(fontSize: mediumFontSize, color: tutorialTextCardColor),
        children: [
          TextSpan(text: 'O '),
          TextSpan(
              text: 'SOS Mama ', style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: '''
é um aplicativo desenvolvido para auxiliar com orientações relacionadas as principais dificuldades vivenciadas durante o aleitamento materno.

Ele apresenta os principais problemas e como enfrentá-los:'''),
        ]),
  );

  BoasVindas({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomCard(child: text),
            const Row(children: [
              Expanded(child: CustomItem(text: 'Leite Empedrado'))
            ]),
            const Row(children: [
              Expanded(child: CustomItem(text: 'Fissuras no Mamilo'))
            ]),
            const Row(children: [Expanded(child: CustomItem(text: 'Mastite'))]),
            const Row(children: [
              Expanded(child: CustomItem(text: 'Bloqueio de Ductos'))
            ]),
            const Row(children: [
              Expanded(child: CustomItem(text: 'Abcesso Mamário'))
            ]),
          ],
        ),
      ),
    );
  }

  final textStyle = const TextStyle(fontSize: 22, color: Colors.white);
}

const tutorialTextCardColor = Colors.black;

class MainContent extends StatelessWidget {
  final texts = [
    RichText(
      textAlign: TextAlign.justify,
      text: const TextSpan(
        style:
            TextStyle(fontSize: mediumFontSize, color: tutorialTextCardColor),
        children: [
          TextSpan(text: 'O aplicativo apresenta a '),
          TextSpan(
              text: '“Promoção de Cuidados com as Mamas” ',
              style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(
              text:
                  '''com vídeos demonstrativos sobre pega correta e os sinais da pega inadequada.'''),
        ],
      ),
    ),
    RichText(
      textAlign: TextAlign.justify,
      text: const TextSpan(
        style:
            TextStyle(fontSize: mediumFontSize, color: tutorialTextCardColor),
        children: [
          TextSpan(text: 'Além disso, traz o '),
          TextSpan(
              text: '“Guia de Extração Manual do Leite” ',
              style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(
              text:
                  '''demonstrando a preparação, com a higiene das mãos, a massagem das mamas, extração do leite e esclarecimentos sobre a queixa de '''),
          TextSpan(
              text: '“pouco leite”.',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  ];

  MainContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomCard(child: texts[0]),
            PrimaryButton(
              text: 'PROMOÇÃO DE CUIDADOS',
              icon: Image.asset(
                "resources/tutorial/promocao_cuidados.png",
                fit: BoxFit.fill,
              ),
            ),
            CustomCard(child: texts[1]),
          ],
        ),
      ),
    );
  }
}

class BancoDeLeite extends StatelessWidget {
  final text = RichText(
    textAlign: TextAlign.justify,
    text: const TextSpan(
      style: TextStyle(fontSize: mediumFontSize, color: tutorialTextCardColor),
      children: [
        TextSpan(
            text:
                'Se você precisar de profissionais qualificados para ajudá-la, você encontra no  '),
        TextSpan(
            text: 'SOS Mama ', style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(
            text:
                '''o contato do Banco de Leite mais próximo, basta clicar em '''),
        TextSpan(
            text: '“Onde encontrar ajuda?”.',
            style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    ),
  );

  BancoDeLeite({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCard(
          child: text,
        ),
        const PrimaryButton(
          text: 'ONDE PROCURAR AJUDA',
          icon: Icon(
            Icons.location_pin,
            color: Colors.white,
            size: 50,
          ),
        )
      ],
    );
  }
}

class TutorialTextData {
  final String text;
  final bool bold;

  const TutorialTextData(this.text, {this.bold = false});
}

Widget buildRichText(List<TutorialTextData> textData) {
  return RichText(
    textAlign: TextAlign.justify,
    text: TextSpan(
      style: const TextStyle(
          fontSize: mediumFontSize, color: tutorialTextCardColor),
      children: textData
          .map(
            (customTextData) => TextSpan(
              text: customTextData.text,
              style: TextStyle(
                  fontSize: mediumFontSize,
                  fontWeight: customTextData.bold
                      ? FontWeight.bold
                      : FontWeight.normal),
            ),
          )
          .toList(),
    ),
  );
}

class Cronometro extends StatelessWidget {
  final text = [
    const TutorialTextData('Com o '),
    const TutorialTextData('“Cronômetro da Amamentação” ', bold: true),
    const TutorialTextData(
        'é possivel registrar cada mamada do seu bebê. \n\nLembrando que a amamentação deve ser realizada sob livre demanda.')
  ];

  Cronometro({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Column(
          children: [
            CustomCard(
              child: buildRichText(text),
            ),
            const PrimaryButton(
              text: 'CRONOMETRO DE AMAMENTAÇÃO',
              icon: Icon(
                Icons.timer,
                color: Colors.white,
                size: 50,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Chat extends StatelessWidget {
  final text = const [
    TutorialTextData('O '),
    TutorialTextData('“Chat das Mães” ', bold: true),
    TutorialTextData(
        'é o local para troca de experiências com outras mães que também vivenciam dificuldades para amamentar seu bebê.'),
  ];

  const Chat({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Column(
          children: [
            CustomCard(child: buildRichText(text)),
            const PrimaryButton(
              text: 'CHAT DAS MÃES',
              icon: Icon(
                Icons.chat,
                color: Colors.white,
                size: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Agradecimentos extends StatelessWidget {
  final text = const [
    TutorialTextData('Esperamos que o aplicativo '),
    TutorialTextData('SOS Mama ', bold: true),
    TutorialTextData('possa lhe ajudar com a amamentação do seu bebê.')
  ];

  const Agradecimentos({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 200,
          width: 200,
          child: CircleAvatar(
            backgroundImage: AssetImage('resources/tutorial/logo.png'),
          ),
        ),
        UIHelper.mediumVerticalSpacer,
        CustomCard(
          child: buildRichText(text),
        ),
      ],
    );
  }
}
