import 'package:shared_preferences/shared_preferences.dart';

class DictionaryRepository {
  static const String key = "word";

  Future<List<String>> loadWords() async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key) ?? [];
  }

  Future<void> saveWords(List<String> words)async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, words);
  }

} 