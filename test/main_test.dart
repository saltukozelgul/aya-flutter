// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:aya_project/core/database/shared_manager.dart';
import 'package:aya_project/core/enums/global_enums.dart';
import 'package:aya_project/core/extension/regex_extensions.dart';
import 'package:http/http.dart' as http;
import 'package:aya_project/feature/util/validator/validation_functions.dart';

void main() {
  test('regex control email', () {
    List<String> emails = [
      'fodawo5876@quamox.com',
      'napada@getcashstash.com',
      'Sorliand1943@cuvox.de',
      'mert71719601@gmail.com',
      'user1@hotmail.com',
      'user2@gmail.com',
      'user3@company.com',
      'user4 @company.com',
      'notanemail.com',
      'workingexample@email.com',
      'another_working@somethingelse.org',
      'notworking@1.com',
    ];

    for (String email in emails) {
      print('Email: $email, result: ${email.isEmailValid}');
    }
  });

  test('regex control name-surname', () {
    List<String> names = [
      'Walter Hanna',
      "Arman O'Reilly",
      'Maxim Boyd',
      'Samir Eaton',
      'Linda Bright',
      'Raees Houston',
      'Moses Mills',
      'Celeste Day',
      'Ava-Rose Cohen',
      'Tasneem Benson',
      'Miles Chang',
      'Nabil Ray',
      'Brianna Daniels',
      'Ellie-May Blaese',
      'Elsa Cantrell',
      'Clark Stanton',
      'Muhammad Peck',
      'Dulcie Beck',
      'Albie Welch',
      'Maizie Faulkner',
      'Anan1234',
      'Anan baban123',
      'Anan baban 123 213!',
      'Anan!'
    ];

    for (String name in names) {
      print('Name-Surname: $name, result: ${name.isNameValid}');
    }
  });

  test('regex control password', () {
    List<String> passwords = [
      '6xf5#TMC54rr7+tJ',
      "C@+b9*GSd8!JR&nk",
      'yYE%(RZ8FBawstSa',
      'FhcNYeH8tE4FV&vY',
      'FTUkK4Inu4u^s^Kz',
      'Je&tKbsUu36MCAL4',
      'D5k#!AF2h(BjPKp',
      'HcC@V*GJePdf#c37',
      'Anan!',
      'x',
      'xxys',
    ];

    for (String password in passwords) {
      print('Password: $password, result: ${password.isPasswordValid}');
    }
  });

  test('badword control check', () async {
    List<String> words = [
      'sikecem',
      'agla',
      // 'amk',
      // 'sss',
      // 'assadas',
      // 'naber yarak',
      // 'asdas',
      // 'selam',
      // 'canim',
    ];

    print(await Validator().validateUsername(words[0]));

    // for (String word in words) {
    //   print(
    //     'Word: $word, word-result: ${BadwordFilter().isWordUnvalid(word)}, sentence-result: ${BadwordFilter().isSentenceUnvalid(word)}',
    //   );
    // }
  });
}
