import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class ScholarChat extends StatelessWidget {
  const ScholarChat({
    super.key,
    required this.imageSize,
    required this.textSize,
  });
  final double imageSize;
  final double textSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset(kLogo, height: imageSize, fit: BoxFit.fill),
          Text(
            "Scholar Chat",
            style: TextStyle(
              fontSize: textSize,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Pacifico',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
