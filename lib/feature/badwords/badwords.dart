import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aya_project/core/constants/local_paths/local_paths.dart';

// BadwordFilter class is used to check if a word or a sentence contains badwords
class BadwordFilter {
  List<String> swears = [];

  Future<void> _loadBadwords() async {
    WidgetsFlutterBinding.ensureInitialized();
    final json = await rootBundle.loadString(LocalPaths().jsonPath);
    List<String> list = (jsonDecode(json) as List<dynamic>).cast<String>();

    swears = list;
  }

  Future<bool> isWordUnvalid(String word) async {
    await _loadBadwords();
    return swears.contains(word);
  }

  Future<bool> isSentenceUnvalid(String sentence) async {
    await _loadBadwords();
    List<String> words = sentence.split(' ');
    for (String word in words) {
      if (swears.contains(word)) {
        return true;
      }
    }
    return false;
  }
}
