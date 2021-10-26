// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `My Bank`
  String get homeScreen_first_tabBarTitle {
    return Intl.message(
      'My Bank',
      name: 'homeScreen_first_tabBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `My cards`
  String get homeScreen_second_tabBarTitle {
    return Intl.message(
      'My cards',
      name: 'homeScreen_second_tabBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Activity Insights`
  String get homeScreen_third_tabBarTitle {
    return Intl.message(
      'Activity Insights',
      name: 'homeScreen_third_tabBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Transactions`
  String get homeScreen_fab_title {
    return Intl.message(
      'Transactions',
      name: 'homeScreen_fab_title',
      desc: '',
      args: [],
    );
  }

  /// `Pay`
  String get navigationBar_first_title {
    return Intl.message(
      'Pay',
      name: 'navigationBar_first_title',
      desc: '',
      args: [],
    );
  }

  /// `Cards`
  String get navigationBar_second_title {
    return Intl.message(
      'Cards',
      name: 'navigationBar_second_title',
      desc: '',
      args: [],
    );
  }

  /// `Insights`
  String get navigationBar_third_title {
    return Intl.message(
      'Insights',
      name: 'navigationBar_third_title',
      desc: '',
      args: [],
    );
  }

  /// `Add Card`
  String get cardScreen_fab_title {
    return Intl.message(
      'Add Card',
      name: 'cardScreen_fab_title',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'pt', countryCode: 'BR'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
