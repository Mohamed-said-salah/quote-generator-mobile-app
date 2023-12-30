import 'package:flutter/material.dart';
import 'package:quote_generator_mobiel_app/data/api.dart';
import 'package:quote_generator_mobiel_app/data/model.dart';
import 'package:quote_generator_mobiel_app/pages/favorite_page.dart';
import 'package:quote_generator_mobiel_app/widgets/custom_outlined_button.dart';
import 'package:quote_generator_mobiel_app/widgets/custom_rectangular_navigation_button.dart';
import 'package:quote_generator_mobiel_app/widgets/customized_scaffold.dart';
import 'package:quote_generator_mobiel_app/widgets/generate_another_quote_button.dart';
import 'package:quote_generator_mobiel_app/widgets/quote_card.dart';

class HomePage extends StatefulWidget {
  static const String homeRoute = '/home';
  static Quote initialQuote() {
    final Quote quote = Quote(
      quoteText:
          "All is required to be happy was friendship and people i could admire.",
      author: 'Christian Dior',
      isFavorite: false,
    );
    quote.id = "651561654561616";
    return quote;
  }

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;

  Quote quote = HomePage.initialQuote();

  @override
  Widget build(BuildContext context) {
    return CustomizedScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomRectangularNavigationButton(
            text: "Click Here To View Favorite Quotes",
            onTab: () async {
              await Navigator.of(context).pushNamed(FavoritePage.favoriteRoute);
            },
          ),
          QuoteCard(
            quote: quote,
            buttons: [
              GenerateAnotherQuoteButton(
                onTap: () async {
                  if (!isLoading) {
                    isLoading = true;
                    setState(() {});
                    Quote newQuote = await getQuote();
                    quote = newQuote;
                    setState(() {});
                    isLoading = false;
                  }
                },
                visible: !isLoading,
              ),
              CustomOutlinedFavoriteButton(
                onPressed: () async {
                  setState(() {
                    quote.isFavorite = !quote.isFavorite!;
                  });
                  if (quote.isFavorite!) quote.toCache();
                  if (!quote.isFavorite!) {
                    quote.removeFromCache();
                  }
                },
                isFavorite: quote.isFavorite ?? false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
