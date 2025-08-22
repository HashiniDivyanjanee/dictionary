// repository/dictionary_repository.dart
import 'dart:convert';
import 'package:dictionary/model/wordEntry.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DictionaryRepository {
  static const String key = "words";

  Future<List<Wordentry>> loadWords() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList(key) ?? [];
    return data.map((e) => Wordentry.fromJson(json.decode(e))).toList();
  }

  Future<void> saveWords(List<Wordentry> words) async {
    final prefs = await SharedPreferences.getInstance();
    final data = words.map((e) => json.encode(e.toJson())).toList();
    await prefs.setStringList(key, data);
  }
}
