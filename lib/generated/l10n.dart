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

  /// `Transaction options like, send money, read QR code, PIX and more`
  String get homeScreen_TOOLTIP_fab_options {
    return Intl.message(
      'Transaction options like, send money, read QR code, PIX and more',
      name: 'homeScreen_TOOLTIP_fab_options',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get homeScreen_first_fab_optionsDescription {
    return Intl.message(
      'Send',
      name: 'homeScreen_first_fab_optionsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Receive`
  String get homeScreen_second_fab_optionsDescription {
    return Intl.message(
      'Receive',
      name: 'homeScreen_second_fab_optionsDescription',
      desc: '',
      args: [],
    );
  }

  /// `QR code`
  String get homeScreen_third_fab_optionsDescription {
    return Intl.message(
      'QR code',
      name: 'homeScreen_third_fab_optionsDescription',
      desc: '',
      args: [],
    );
  }

  /// `PIX`
  String get homeScreen_fourth_fab_optionsDescription {
    return Intl.message(
      'PIX',
      name: 'homeScreen_fourth_fab_optionsDescription',
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

  /// `Search`
  String get appBar_searchInput_title {
    return Intl.message(
      'Search',
      name: 'appBar_searchInput_title',
      desc: '',
      args: [],
    );
  }

  /// `Search whole app`
  String get appBar_TOOLTIP_searchInput_hint {
    return Intl.message(
      'Search whole app',
      name: 'appBar_TOOLTIP_searchInput_hint',
      desc: '',
      args: [],
    );
  }

  /// `Dark theme`
  String get appBar_switchDarkTheme_title {
    return Intl.message(
      'Dark theme',
      name: 'appBar_switchDarkTheme_title',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get appBar_TOOLTIP_backButton_hint {
    return Intl.message(
      'Back',
      name: 'appBar_TOOLTIP_backButton_hint',
      desc: '',
      args: [],
    );
  }

  /// `{quantity} new notifications`
  String appBar_notificationsButton_newNotificationsMessage(Object quantity) {
    return Intl.message(
      '$quantity new notifications',
      name: 'appBar_notificationsButton_newNotificationsMessage',
      desc: '',
      args: [quantity],
    );
  }

  /// `Notifications`
  String get appBar_TOOLTIP_notificationsButton_hint {
    return Intl.message(
      'Notifications',
      name: 'appBar_TOOLTIP_notificationsButton_hint',
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

  /// `Add credit or debit cards, Gift cards, Transit and more`
  String get cardScreen_TOOLTIP_fab_options {
    return Intl.message(
      'Add credit or debit cards, Gift cards, Transit and more',
      name: 'cardScreen_TOOLTIP_fab_options',
      desc: '',
      args: [],
    );
  }

  /// `Debit or credit card`
  String get cardScreen_first_fab_optionsDescription {
    return Intl.message(
      'Debit or credit card',
      name: 'cardScreen_first_fab_optionsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Gift card`
  String get cardScreen_second_fab_optionsDescription {
    return Intl.message(
      'Gift card',
      name: 'cardScreen_second_fab_optionsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Loyalty`
  String get cardScreen_third_fab_optionsDescription {
    return Intl.message(
      'Loyalty',
      name: 'cardScreen_third_fab_optionsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Transit`
  String get cardScreen_fourth_fab_optionsDescription {
    return Intl.message(
      'Transit',
      name: 'cardScreen_fourth_fab_optionsDescription',
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

  /// `Jump down!`
  String get activityScreen_TOOLTIP_fabDownward_description {
    return Intl.message(
      'Jump down!',
      name: 'activityScreen_TOOLTIP_fabDownward_description',
      desc: '',
      args: [],
    );
  }

  /// `Jump up!`
  String get activityScreen_TOOLTIP_fabUpward_description {
    return Intl.message(
      'Jump up!',
      name: 'activityScreen_TOOLTIP_fabUpward_description',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get __3 {
    return Intl.message(
      '',
      name: '__3',
      desc: '',
      args: [],
    );
  }

  /// `Add a card`
  String get scanCardScreen_tabBarTitle {
    return Intl.message(
      'Add a card',
      name: 'scanCardScreen_tabBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Line it up with the frame\nso we can read the details`
  String get scanCardScreen_tabBarDescription {
    return Intl.message(
      'Line it up with the frame\nso we can read the details',
      name: 'scanCardScreen_tabBarDescription',
      desc: '',
      args: [],
    );
  }

  /// `Click to scan`
  String get scanCardScreen_clickToScan_title {
    return Intl.message(
      'Click to scan',
      name: 'scanCardScreen_clickToScan_title',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get scanCardScreen_or_text {
    return Intl.message(
      'or',
      name: 'scanCardScreen_or_text',
      desc: '',
      args: [],
    );
  }

  /// `Enter card details manually`
  String get scanCardScreen_enterCardManually_title {
    return Intl.message(
      'Enter card details manually',
      name: 'scanCardScreen_enterCardManually_title',
      desc: '',
      args: [],
    );
  }

  /// `Make sure cardholder name and other info\nis exactly as it appears on card`
  String get scanCardScreen_makeSureCardHolderNameAnd_bottomNote {
    return Intl.message(
      'Make sure cardholder name and other info\nis exactly as it appears on card',
      name: 'scanCardScreen_makeSureCardHolderNameAnd_bottomNote',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get __4 {
    return Intl.message(
      '',
      name: '__4',
      desc: '',
      args: [],
    );
  }

  /// `Google account and more other settings`
  String get googleAccountDialog_TOOLTIP_googleAccountDialog_description {
    return Intl.message(
      'Google account and more other settings',
      name: 'googleAccountDialog_TOOLTIP_googleAccountDialog_description',
      desc: '',
      args: [],
    );
  }

  /// `Manage your Google Account`
  String get googleAccountDialog_manageGoogleAccount_title {
    return Intl.message(
      'Manage your Google Account',
      name: 'googleAccountDialog_manageGoogleAccount_title',
      desc: '',
      args: [],
    );
  }

  /// `username@email.com`
  String get googleAccountDialog_EXAMPLE_email {
    return Intl.message(
      'username@email.com',
      name: 'googleAccountDialog_EXAMPLE_email',
      desc: '',
      args: [],
    );
  }

  /// `Your Name`
  String get googleAccountDialog_EXAMPLE_fullName {
    return Intl.message(
      'Your Name',
      name: 'googleAccountDialog_EXAMPLE_fullName',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get googleAccountDialog_TOOLTIP_account_hint {
    return Intl.message(
      'Account',
      name: 'googleAccountDialog_TOOLTIP_account_hint',
      desc: '',
      args: [],
    );
  }

  /// `Signed in as`
  String get googleAccountDialog_TOOLTIP_signedInAsAccount_description {
    return Intl.message(
      'Signed in as',
      name: 'googleAccountDialog_TOOLTIP_signedInAsAccount_description',
      desc: '',
      args: [],
    );
  }

  /// `Add another account`
  String get googleAccountDialog_addAnotherAccount_button_title {
    return Intl.message(
      'Add another account',
      name: 'googleAccountDialog_addAnotherAccount_button_title',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get googleAccountDialog_settings_button_title {
    return Intl.message(
      'Settings',
      name: 'googleAccountDialog_settings_button_title',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get googleAccountDialog_help_button_title {
    return Intl.message(
      'Help',
      name: 'googleAccountDialog_help_button_title',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get googleAccountDialog_privacyPolicy_button_title {
    return Intl.message(
      'Privacy Policy',
      name: 'googleAccountDialog_privacyPolicy_button_title',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Service`
  String get googleAccountDialog_termsOfService_button_title {
    return Intl.message(
      'Terms of Service',
      name: 'googleAccountDialog_termsOfService_button_title',
      desc: '',
      args: [],
    );
  }

  /// `Read`
  String get googleAccountDialog_TOOLTIP_readTerms_hint {
    return Intl.message(
      'Read',
      name: 'googleAccountDialog_TOOLTIP_readTerms_hint',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get __5 {
    return Intl.message(
      '',
      name: '__5',
      desc: '',
      args: [],
    );
  }

  /// `SELECT THE DAY FOR YOUR TRANSFER`
  String get googleDateTimePicker_dateOfTransfer_description {
    return Intl.message(
      'SELECT THE DAY FOR YOUR TRANSFER',
      name: 'googleDateTimePicker_dateOfTransfer_description',
      desc: '',
      args: [],
    );
  }

  /// `CANCEL`
  String get googleDateTimePicker_cancel_button_title {
    return Intl.message(
      'CANCEL',
      name: 'googleDateTimePicker_cancel_button_title',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get googleDateTimePicker_okay_button_title {
    return Intl.message(
      'OK',
      name: 'googleDateTimePicker_okay_button_title',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get ___ {
    return Intl.message(
      '',
      name: '___',
      desc: '',
      args: [],
    );
  }

  /// `Feature unavailable at the moment. We'll fix it right away!`
  String get snackBar_featureUnavailableButBeingFixed_text {
    return Intl.message(
      'Feature unavailable at the moment. We\'ll fix it right away!',
      name: 'snackBar_featureUnavailableButBeingFixed_text',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get other_TOOLTIP_closeButton {
    return Intl.message(
      'Close',
      name: 'other_TOOLTIP_closeButton',
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
