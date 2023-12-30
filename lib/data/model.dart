import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Quote {
  String? _id;
  bool? isFavorite;
  String? quoteText;
  String? author;
  List<dynamic>? tags;

  Quote({
    required this.isFavorite,
    this.quoteText,
    this.author,
    this.tags,
  });

  set id(String id) => _id = id;

  Quote.fromJson(String json) {
    _fromJson(json);
  }

  void _fromJson(String json) {
    final Map map = jsonDecode(json);

    _id = map['_id'];

    isFavorite = map['isFavorite'] ?? false;

    quoteText = map['content'];

    author = map['author'];

    tags = map['tags'];
  }

  Map<String, dynamic> _toMap() {
    return {
      '_id': _id,
      'isFavorite': true,
      'content': quoteText ?? "",
      'author': author ?? "",
      'tags': tags ?? [],
    };
  }

  String _toJson() {
    return jsonEncode(_toMap());
  }

  Future<bool> toCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      await prefs.setString(_id!, _toJson());
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<bool> removeFromCache() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      await prefs.remove(_id ?? "");
    } catch (e) {
      return false;
    }
    return true;
  }
}
