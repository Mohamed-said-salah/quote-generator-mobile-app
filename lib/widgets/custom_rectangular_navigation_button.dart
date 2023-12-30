import 'package:flutter/material.dart';

class CustomRectangularNavigationButton extends StatelessWidget {
  final Icon? icon;
  final String text;
  final VoidCallback onTab;
  const CustomRectangularNavigationButton(
      {super.key, required this.onTab, required this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        height: 80,
        margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        decoration: const BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) icon ?? const Icon(Icons.broken_image_sharp),
            Text(
              text,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
