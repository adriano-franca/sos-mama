import 'package:flutter/material.dart';

import '../core/core.dart';

class PrimaryButton extends StatelessWidget {
  final String? text;
  final Widget? icon;
  final VoidCallback? onTap;

  const PrimaryButton({super.key, this.text, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        color: primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(0),
                margin: const EdgeInsets.all(0),
                height: 50,
                width: icon != null ? 50 : 0,
                child: icon,
              ),
              Expanded(
                child: Text(
                  text!,
                  style: const TextStyle(
                      fontSize: mediumFontSize,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
