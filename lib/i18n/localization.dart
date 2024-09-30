import 'package:flutter/material.dart';

class AppLocalizations {
  static const List<String> languages = [
    'English', 
    'Swahili', 
    'Kikuyu', 
    'Luhya', 
    'Luo', 
    'Kalenjin', 
    'Kisii', 
    'Maasai', 
    'Meru', 
    'Embu', 
    'Taita', 
    'Borana', 
    'Somali', 
    'Turkana'
  ];

  static Map<String, Map<String, String>> localizedValues = {
    'en': {
      'issue_description': 'Issue Description',
      'submit': 'Submit',
    },
    'sw': {
      'issue_description': 'Maelezo ya Tatizo',
      'submit': 'Wasilisha',
    },
    'ki': {
      'issue_description': 'Wakiri wa Tuhuma',
      'submit': 'Wakiiriria',
    },
    'lu': {
      'issue_description': 'Eka Lwakhukhulu',
      'submit': 'Lwakhulili',
    },
    'luo': {
      'issue_description': 'Kakinyasa',
      'submit': 'Sumbul',
    },
    'kal': {
      'issue_description': 'Kalamet',
      'submit': 'Chumaka',
    },
    'ki': {
      'issue_description': 'Wakiri wa Tuhuma',
      'submit': 'Wakiiriria',
    },
    'kisii': {
      'issue_description': 'Naki oria',
      'submit': 'Naki bwatogori',
    },
    'maasai': {
      'issue_description': 'Olarakan',
      'submit': 'Oloraki',
    },
    'meru': {
      'issue_description': 'Kang’uru',
      'submit': 'Ikanjaki',
    },
    'embu': {
      'issue_description': 'Nathia',
      'submit': 'Nathia Muri',
    },
    'taita': {
      'issue_description': 'Mhando ya Mambo',
      'submit': 'Tazika',
    },
    'borana': {
      'issue_description': 'Garamana',
      'submit': 'Baanaan',
    },
    'somali': {
      'issue_description': 'Sharaxaad',
      'submit': 'Gudbi',
    },
    'turkana': {
      'issue_description': 'Oto',
      'submit': 'Sosola',
    },
  };

  static String translate(String key, Locale locale) {
    return localizedValues[locale.languageCode]![key] ?? key;
  }
}

