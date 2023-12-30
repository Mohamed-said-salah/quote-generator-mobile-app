import 'package:flutter/material.dart';
import 'package:quote_generator_mobiel_app/data/model.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final List<Widget> buttons;
  const QuoteCard({
    super.key,
    required this.quote,
    this.buttons = const <Widget>[],
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      color: Colors.white,
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '"${quote.quoteText}"',
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 22),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    quote.author ?? "",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: buttons,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
