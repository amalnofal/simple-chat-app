import 'package:flutter/material.dart';

class OrSocial extends StatelessWidget {
  const OrSocial({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(child: Divider(thickness: 1, color: Colors.white)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("OR", style: TextStyle(color: Colors.white)),
              ),
              const Expanded(child: Divider(thickness: 1, color: Colors.white)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: Image.asset(
                  "assets/images/google_icon.png",
                  height: 25,
                  width: 25,
                ), //Gmail
              ),
              const SizedBox(width: 20),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: const Icon(
                  Icons.facebook,
                  size: 36,
                  color: Colors.blue,
                ), //Facebook
              ),
            ],
          ),
        ],
      ),
    );
  }
}
