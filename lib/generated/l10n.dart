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

  /// `Transactions`
  String get homeScreen_transactions_categoryTitle {
    return Intl.message(
      'Transactions',
      name: 'homeScreen_transactions_categoryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Bills Resume`
  String get homeScreen_billsResume_categoryTitle {
    return Intl.message(
      'Bills Resume',
      name: 'homeScreen_billsResume_categoryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Sales Store`
  String get homeScreen_salesStore_categoryTitle {
    return Intl.message(
      'Sales Store',
      name: 'homeScreen_salesStore_categoryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Support Chat`
  String get homeScreen_supportChat_categoryTitle {
    return Intl.message(
      'Support Chat',
      name: 'homeScreen_supportChat_categoryTitle',
      desc: '',
      args: [],
    );
  }

  /// `more`
  String get homeScreen_more_categoryTitle {
    return Intl.message(
      'more',
      name: 'homeScreen_more_categoryTitle',
      desc: '',
      args: [],
    );
  }

  /// `User Cards Section`
  String get homeScreen_userCardSection_pageSubtitle {
    return Intl.message(
      'User Cards Section',
      name: 'homeScreen_userCardSection_pageSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Recent Transactions`
  String get homeScreen_recentTransactions_pageSubtitle {
    return Intl.message(
      'Recent Transactions',
      name: 'homeScreen_recentTransactions_pageSubtitle',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get __0 {
    return Intl.message(
      '',
      name: '__0',
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

  /// ``
  String get __1 {
    return Intl.message(
      '',
      name: '__1',
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

  /// `Card`
  String get cardWidget_singularCard_title {
    return Intl.message(
      'Card',
      name: 'cardWidget_singularCard_title',
      desc: '',
      args: [],
    );
  }

  /// `more card options`
  String get cardWidget_TOOLTIP_cardOnTapHint {
    return Intl.message(
      'more card options',
      name: 'cardWidget_TOOLTIP_cardOnTapHint',
      desc: '',
      args: [],
    );
  }

  /// `CARD NAME`
  String get cardWidget_cardName_title {
    return Intl.message(
      'CARD NAME',
      name: 'cardWidget_cardName_title',
      desc: '',
      args: [],
    );
  }

  /// `EXP DATE`
  String get cardWidget_expDate_title {
    return Intl.message(
      'EXP DATE',
      name: 'cardWidget_expDate_title',
      desc: '',
      args: [],
    );
  }

  /// `Card Expiration date`
  String get cardWidget_expDate_description {
    return Intl.message(
      'Card Expiration date',
      name: 'cardWidget_expDate_description',
      desc: '',
      args: [],
    );
  }

  /// `EXPIRED`
  String get cardWidget_expDateExpired_title {
    return Intl.message(
      'EXPIRED',
      name: 'cardWidget_expDateExpired_title',
      desc: '',
      args: [],
    );
  }

  /// `CVV NUMBER`
  String get cardWidget_cvvNumber_title {
    return Intl.message(
      'CVV NUMBER',
      name: 'cardWidget_cvvNumber_title',
      desc: '',
      args: [],
    );
  }

  /// `CVV NUMBER`
  String get cardWidget_cvvNumber_description {
    return Intl.message(
      'CVV NUMBER',
      name: 'cardWidget_cvvNumber_description',
      desc: '',
      args: [],
    );
  }

  /// `Secret`
  String get cardWidget_TOOLTIP_cvvNumber_hint {
    return Intl.message(
      'Secret',
      name: 'cardWidget_TOOLTIP_cvvNumber_hint',
      desc: '',
      args: [],
    );
  }

  /// `Add payment method`
  String get cardWidgetOutlined_addPaymentMethod_title {
    return Intl.message(
      'Add payment method',
      name: 'cardWidgetOutlined_addPaymentMethod_title',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get __2 {
    return Intl.message(
      '',
      name: '__2',
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
