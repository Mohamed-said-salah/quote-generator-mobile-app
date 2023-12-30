import 'package:flutter/material.dart';
import 'package:quote_generator_mobiel_app/data/model.dart';
import 'package:quote_generator_mobiel_app/widgets/custom_outlined_button.dart';
import 'package:quote_generator_mobiel_app/widgets/custom_rectangular_navigation_button.dart';
import 'package:quote_generator_mobiel_app/widgets/customized_scaffold.dart';
import 'package:quote_generator_mobiel_app/widgets/quote_card.dart';
import 'package:quote_generator_mobiel_app/widgets/search_input_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritePage extends StatefulWidget {
  static const String favoriteRoute = '/favorite';

  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  bool isFavoriteButtonPressed = false;
  SharedPreferences? prefs;
  List<String>? keys;

  getKeys() async {
    keys = prefs?.getKeys().toList().reversed.toList();
    if (_isSearchMode) {
      List<String> newKeys = [];
      for (var key in keys ?? []) {
        String json = prefs?.getString(key) ?? '';
        Quote quote = Quote.fromJson(json);
        String quoteText = quote.quoteText?.toLowerCase() ?? "";
        String quoteAuthor = quote.author?.toLowerCase() ?? "";
        String quoteTags = quote.tags?.join(' ').toLowerCase() ?? '';
        String searchText = _searchController.text.toLowerCase();

        // * Next boolean is the if statement that checks if the search word matches any quote
        bool isSearchTextMatchesQuote = quoteText.contains(searchText) ||
            quoteTags.contains(searchText) ||
            quoteAuthor.contains(searchText);

        if (isSearchTextMatchesQuote) newKeys.add(key);
      }
      keys = newKeys;
    }
    setState(() {});
  }

  getPrefs() async {
    prefs = await SharedPreferences.getInstance();
    getKeys();
  }

  final TextEditingController _searchController = TextEditingController();
  // final FocusNode _focusNode = FocusNode();
  bool _isSearchMode = false;

  void _onSearchChanges() {
    if (_searchController.text.isEmpty) _isSearchMode = false;

    if (_searchController.text.isNotEmpty) _isSearchMode = true;
    getKeys();
  }

  @override
  void initState() {
    getPrefs();
    super.initState();
    _searchController.addListener(_onSearchChanges);
  }

  @override
  Widget build(BuildContext context) {
    return CustomizedScaffold(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 40),
        CustomRectangularNavigationButton(
          onTab: () => Navigator.pop(context),
          text: "Back To Home Screen",
          icon: const Icon(Icons.arrow_back_ios),
        ),
        SearchInputField(
          searchController: _searchController,
          isSearchMode: _isSearchMode,
        ),
        const SizedBox(height: 10.0),
        Expanded(
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              // color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                final String id = keys!.elementAt(index);
                final String? json = prefs?.getString(id);
                Quote quote = Quote.fromJson(json!);

                return QuoteCard(
                  quote: quote,
                  buttons: [
                    CustomOutlinedFavoriteButton(
                      onPressed: () async {
                        if (!isFavoriteButtonPressed) {
                          isFavoriteButtonPressed = true;
                          if (quote.isFavorite == true) {
                            await quote.removeFromCache();
                          } else {
                            await quote.toCache();
                          }
                          getKeys();
                          isFavoriteButtonPressed = false;
                        }
                      },
                      isFavorite: quote.isFavorite!,
                      text: "Remove From Favorites",
                    )
                  ],
                );
              },
              separatorBuilder: (BuildContext context, index) =>
                  const SizedBox.shrink(),
              itemCount: keys != null ? keys!.length : 0,
              scrollDirection: Axis.vertical,
            ),
          ),
        ),
      ],
    ));
  }
}
