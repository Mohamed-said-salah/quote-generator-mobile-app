import 'package:http/http.dart';
import 'package:quote_generator_mobiel_app/data/model.dart';

final Uri randomQuoteUri = Uri.parse("https://api.quotable.io/random");

Future<Quote> getQuote() async {
  final Response response;
  Quote quote;

  try {
    response = await get(randomQuoteUri);

    if (response.statusCode != 200) throw Error();

    quote = Quote.fromJson(response.body);
  } catch (e) {
    return Quote(
        isFavorite: false,
        quoteText:
            "Something Went wrong or may be problem in internet connection");
  }

  return quote;
}
