import 'package:flutter/material.dart';

class CustomOutlinedFavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final String? text;
  final VoidCallback onPressed;
  const CustomOutlinedFavoriteButton({
    super.key,
    required this.onPressed,
    this.text,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        // width: 100,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.deepPurple,
            width: 2.0,
          ),
          borderRadius: BorderRadius.only(
            bottomRight: const Radius.circular(10.0),
            bottomLeft: Radius.circular(text != null ? 10.0 : 0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: onPressed,
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
                  color: Colors.deepPurple,
                  size: 35,
                )),
            if (text != null)
              Text(
                text ?? "",
                style: const TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 20.0,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
