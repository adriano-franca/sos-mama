import 'package:flutter/material.dart';

import '../core/core.dart';
import '../widgets/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/services.dart';

class ChatDasMaes extends StatelessWidget {
  static const title = 'Chat Das Mães';
  final url = 'https://chat.whatsapp.com/JmqE867vGWoIDPEbXC9oos';
  static final routeName = title.toLowerCase();

  const ChatDasMaes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title,
        context: context,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: <Widget>[
            UIHelper.largerVerticalSpacer,
            const Icon(
              Icons.chat,
              size: 100,
              color: primaryColor,
            ),
            UIHelper.largerVerticalSpacer,
            Expanded(
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: RichText(
                    textAlign: TextAlign.justify,
                    text: const TextSpan(
                        style: TextStyle(
                          fontSize: mediumFontSize,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'O ',
                          ),
                          TextSpan(
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold),
                            text: 'Chat das Mães do SOS Mama ',
                          ),
                          TextSpan(
                            text: 'é um grupo no ',
                          ),
                          TextSpan(
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                            text: 'Whatsapp ',
                          ),
                          TextSpan(
                            text:
                                'com o objetivo de possibilitar a troca de experiências entre as mães.\n\n',
                          ),
                          TextSpan(
                            text:
                                'Um local onde podem conversar e tirar duvidas com outras mamães.\n\nPara conseguir entrar no ',
                          ),
                          TextSpan(
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold),
                            text: 'Chat das Mães do SOS Mama ',
                          ),
                          TextSpan(
                            text: 'é nescessário:\n\n',
                          ),
                          TextSpan(
                            text: '1. Ter o ',
                          ),
                          TextSpan(
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                            text: 'Whatsapp ',
                          ),
                          TextSpan(
                            text: 'instalado no seu smartphone.',
                          ),
                        ]),
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    TextButton(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: primaryColor, width: 2),
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Copiar link do grupo',
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: mediumFontSize),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: url));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Text copied to clipboard')),
                          );
                        }),
                    TextButton(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: primaryColor, width: 2),
                            color: primaryColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Abrir no WhatsApp  ',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: mediumFontSize),
                            ),
                          ),
                        ),
                        onPressed: () {
                          launchUrl(Uri.parse(url))
                              .onError((error, stackTrace) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('ERRO'),
                                    content: const Text(
                                        'Não foi possível inicar o Whatsapp'),
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
                            return false;
                          });
                        }),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
