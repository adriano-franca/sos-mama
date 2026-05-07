import 'package:flutter/material.dart';

class TelaInicialButton extends StatelessWidget {
  final Widget title;
  final Color? color;
  final Color? borderColor;
  final Function? onTap;
  final Widget? icon;
  final String? descricao;

  const TelaInicialButton(
      {super.key, required this.title,
      this.color,
      this.onTap,
      this.icon,
      this.borderColor,
      this.descricao});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, left: 2, right: 2),
      child: GestureDetector(
        onTap: onTap as void Function()?,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                width: 1, style: BorderStyle.solid, color: borderColor!),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: color,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: icon!,
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        title,
                        Text(
                          descricao!,
                          style: const TextStyle(fontSize: 12),
                          textAlign: TextAlign.left,
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
