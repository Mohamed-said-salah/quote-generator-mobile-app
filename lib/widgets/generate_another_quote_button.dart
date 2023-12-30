import 'package:flutter/material.dart';

class GenerateAnotherQuoteButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool visible;
  const GenerateAnotherQuoteButton(
      {super.key, required this.onTap, required this.visible});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          color: Colors.deepPurple.withOpacity(0.9),
          borderRadius:
              const BorderRadius.only(bottomLeft: Radius.circular(10.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 10),
            Visibility(
              visible: visible,
              replacement: const Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Positioned(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Generate Another Quote",
                    style: TextStyle(
                      color: Colors.transparent,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 22 / 20,
                    ),
                  ),
                ],
              ),
              child: const Text(
                "Generate Another Quote",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 22 / 20,
                ),
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
