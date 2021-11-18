// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'de';

  static String m0(quantity) => "${quantity} neue benachrichtigungen";

  static String m1(lastDigits) =>
      "Letzte Ziffern der Kartennummer: ${lastDigits}";

  static String m2(current, length) => " ${current} von ${length}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "__0": MessageLookupByLibrary.simpleMessage(""),
        "__1": MessageLookupByLibrary.simpleMessage(""),
        "__2": MessageLookupByLibrary.simpleMessage(""),
        "__3": MessageLookupByLibrary.simpleMessage(""),
        "__4": MessageLookupByLibrary.simpleMessage(""),
        "__5": MessageLookupByLibrary.simpleMessage(""),
        "__6": MessageLookupByLibrary.simpleMessage(""),
        "___": MessageLookupByLibrary.simpleMessage(""),
        "activityScreen_TOOLTIP_fabDownward_description":
            MessageLookupByLibrary.simpleMessage("hinunterspringen!"),
        "activityScreen_TOOLTIP_fabUpward_description":
            MessageLookupByLibrary.simpleMessage("hochspringen!"),
        "appBar_TOOLTIP_backButton_hint":
            MessageLookupByLibrary.simpleMessage("Zurück"),
        "appBar_TOOLTIP_notificationsButton_hint":
            MessageLookupByLibrary.simpleMessage("Benachrichtigungen"),
        "appBar_TOOLTIP_searchInput_hint":
            MessageLookupByLibrary.simpleMessage("Suche in der App"),
        "appBar_notificationsButton_newNotificationsMessage": m0,
        "appBar_searchInput_title":
            MessageLookupByLibrary.simpleMessage("Suche"),
        "appBar_switchDarkTheme_title":
            MessageLookupByLibrary.simpleMessage("Dunkles Thema"),
        "cardScreen_TOOLTIP_fab_options": MessageLookupByLibrary.simpleMessage(
            "Add credit or debit cards, Gift cards, Transit and more"),
        "cardScreen_fab_title":
            MessageLookupByLibrary.simpleMessage("Hinzufügen"),
        "cardScreen_first_fab_optionsDescription":
            MessageLookupByLibrary.simpleMessage("Debitkarte oder Kreditkarte"),
        "cardScreen_fourth_fab_optionsDescription":
            MessageLookupByLibrary.simpleMessage("Fahrausweis"),
        "cardScreen_second_fab_optionsDescription":
            MessageLookupByLibrary.simpleMessage("Geschenkkarte"),
        "cardScreen_third_fab_optionsDescription":
            MessageLookupByLibrary.simpleMessage("Kundenkarte"),
        "cardWidgetOutlined_addPaymentMethod_title":
            MessageLookupByLibrary.simpleMessage("Zahlungsmethode hinzufügen"),
        "cardWidget_TOOLTIP_cardNumber_title": m1,
        "cardWidget_TOOLTIP_cardOnTapHint":
            MessageLookupByLibrary.simpleMessage("mehr Kartenoptionen"),
        "cardWidget_TOOLTIP_cvvNumber_hint":
            MessageLookupByLibrary.simpleMessage("Geheimnis"),
        "cardWidget_cardName_title":
            MessageLookupByLibrary.simpleMessage("KARTEN NAME"),
        "cardWidget_cvvNumber_description":
            MessageLookupByLibrary.simpleMessage("CVV NUMMER"),
        "cardWidget_cvvNumber_title":
            MessageLookupByLibrary.simpleMessage("CVV NUMMER"),
        "cardWidget_expDateExpired_title":
            MessageLookupByLibrary.simpleMessage("ABGELAUFEN"),
        "cardWidget_expDate_description":
            MessageLookupByLibrary.simpleMessage("Kartenablaufdatum"),
        "cardWidget_expDate_title":
            MessageLookupByLibrary.simpleMessage("VERFALLSDATUM"),
        "cardWidget_singularCard_title":
            MessageLookupByLibrary.simpleMessage("Karte"),
        "googleAccountDialog_EXAMPLE_email":
            MessageLookupByLibrary.simpleMessage("nutzername@email.com"),
        "googleAccountDialog_EXAMPLE_fullName":
            MessageLookupByLibrary.simpleMessage("Dein Name"),
        "googleAccountDialog_TOOLTIP_account_hint":
            MessageLookupByLibrary.simpleMessage("Konto"),
        "googleAccountDialog_TOOLTIP_googleAccountDialog_description":
            MessageLookupByLibrary.simpleMessage(
                "Google-Konto und weitere andere Einstellungen"),
        "googleAccountDialog_TOOLTIP_readTerms_hint":
            MessageLookupByLibrary.simpleMessage("Lesen"),
        "googleAccountDialog_TOOLTIP_signedInAsAccount_description":
            MessageLookupByLibrary.simpleMessage("Eingeloggt als"),
        "googleAccountDialog_addAnotherAccount_button_title":
            MessageLookupByLibrary.simpleMessage("Weiteres Konto hinzufügen"),
        "googleAccountDialog_help_button_title":
            MessageLookupByLibrary.simpleMessage("Hilfe"),
        "googleAccountDialog_manageGoogleAccount_title":
            MessageLookupByLibrary.simpleMessage("Ihr Google-Konto verwalten"),
        "googleAccountDialog_privacyPolicy_button_title":
            MessageLookupByLibrary.simpleMessage("Datenschutz-Bestimmungen"),
        "googleAccountDialog_settings_button_title":
            MessageLookupByLibrary.simpleMessage("Einstellungen"),
        "googleAccountDialog_termsOfService_button_title":
            MessageLookupByLibrary.simpleMessage("Nutzungsbedingungen"),
        "googleDateTimePicker_cancel_button_title":
            MessageLookupByLibrary.simpleMessage("ABBRECHEN"),
        "googleDateTimePicker_dateOfTransfer_description":
            MessageLookupByLibrary.simpleMessage(
                "WÄHLEN SIE DEN TAG FÜR DEN TRANSFER"),
        "googleDateTimePicker_okay_button_title":
            MessageLookupByLibrary.simpleMessage("OK"),
        "homeScreen_TOOLTIP_fab_options": MessageLookupByLibrary.simpleMessage(
            "Transaktionsoptionen wie Geld senden, QR-Code lesen, PIX und mehr"),
        "homeScreen_billsResume_categoryTitle":
            MessageLookupByLibrary.simpleMessage("Rechnungen"),
        "homeScreen_fab_title":
            MessageLookupByLibrary.simpleMessage("Transaktionen"),
        "homeScreen_first_fab_optionsDescription":
            MessageLookupByLibrary.simpleMessage("Senden"),
        "homeScreen_first_tabBarTitle":
            MessageLookupByLibrary.simpleMessage("Bank"),
        "homeScreen_fourth_fab_optionsDescription":
            MessageLookupByLibrary.simpleMessage("PIX"),
        "homeScreen_more_categoryTitle":
            MessageLookupByLibrary.simpleMessage("mehr"),
        "homeScreen_recentTransactions_pageSubtitle":
            MessageLookupByLibrary.simpleMessage("Kürzliche Transaktionen"),
        "homeScreen_salesStore_categoryTitle":
            MessageLookupByLibrary.simpleMessage("Verkaufsladen"),
        "homeScreen_second_fab_optionsDescription":
            MessageLookupByLibrary.simpleMessage("Erhalten"),
        "homeScreen_second_tabBarTitle":
            MessageLookupByLibrary.simpleMessage("Karten"),
        "homeScreen_supportChat_categoryTitle":
            MessageLookupByLibrary.simpleMessage("Support Chat"),
        "homeScreen_third_fab_optionsDescription":
            MessageLookupByLibrary.simpleMessage("QR code"),
        "homeScreen_third_tabBarTitle":
            MessageLookupByLibrary.simpleMessage("Neueste"),
        "homeScreen_transactions_categoryTitle":
            MessageLookupByLibrary.simpleMessage("Transaktionen"),
        "homeScreen_userCardSection_pageSubtitle":
            MessageLookupByLibrary.simpleMessage("Bereich Benutzerkarten"),
        "navigationBar_first_title":
            MessageLookupByLibrary.simpleMessage("Zahlen"),
        "navigationBar_second_title":
            MessageLookupByLibrary.simpleMessage("Karten"),
        "navigationBar_third_title":
            MessageLookupByLibrary.simpleMessage("Neueste"),
        "navigation_TOOTIP_listCount_description": m2,
        "other_TOOLTIP_closeButton":
            MessageLookupByLibrary.simpleMessage("Schließen"),
        "scanCardScreen_clickToScan_title":
            MessageLookupByLibrary.simpleMessage("Zum Scannen anklicken"),
        "scanCardScreen_enterCardManually_title":
            MessageLookupByLibrary.simpleMessage(
                "Kartendetails manuell eingeben"),
        "scanCardScreen_makeSureCardHolderNameAnd_bottomNote":
            MessageLookupByLibrary.simpleMessage(
                "Stellen Sie sicher, dass die\nKarteninhaberinformationen genau so sind,\nwie sie auf der Karte erscheinen"),
        "scanCardScreen_or_text": MessageLookupByLibrary.simpleMessage("oder"),
        "scanCardScreen_tabBarDescription": MessageLookupByLibrary.simpleMessage(
            "Richten Sie es mit dem Rahmen\n aus, damit wir die Details lesen können"),
        "scanCardScreen_tabBarTitle":
            MessageLookupByLibrary.simpleMessage("Karte hinzufügen"),
        "settingsScreen_optionAppSystemNFCSettings":
            MessageLookupByLibrary.simpleMessage("(System) Contactless/NFC"),
        "settingsScreen_optionAppSystemNFCSettings_description":
            MessageLookupByLibrary.simpleMessage(
                "Options to setup phone\'s NFC, your contactless payment uses it"),
        "settingsScreen_optionAppSystemSettings":
            MessageLookupByLibrary.simpleMessage("(System) App settings"),
        "settingsScreen_optionAppSystemSettings_description":
            MessageLookupByLibrary.simpleMessage(
                "Options to change app\'s permission, notifications and more"),
        "settingsScreen_optionEditAccountInfo":
            MessageLookupByLibrary.simpleMessage("Edit account info"),
        "settingsScreen_optionEditAccountInfo_description":
            MessageLookupByLibrary.simpleMessage(
                "Update your name, address, and any other account info"),
        "settingsScreen_optionEmailUpdates":
            MessageLookupByLibrary.simpleMessage("Email updates"),
        "settingsScreen_optionEmailUpdates_description":
            MessageLookupByLibrary.simpleMessage(
                "Get exclusive offers, tips, and invites"),
        "settingsScreen_optionPurchaseNotifications":
            MessageLookupByLibrary.simpleMessage("Purchase notifications"),
        "settingsScreen_optionPurchaseNotifications_description":
            MessageLookupByLibrary.simpleMessage(
                "See transactions details after you make a purchase"),
        "settingsScreen_optionShareUserLocation":
            MessageLookupByLibrary.simpleMessage("Share your location"),
        "settingsScreen_optionShareUserLocation_description":
            MessageLookupByLibrary.simpleMessage(
                "For your safety and fraud investigations. Baking Pay would like to access your location when you do a purchase"),
        "settingsScreen_optionTicketsUpdates":
            MessageLookupByLibrary.simpleMessage("Updates about your tickets"),
        "settingsScreen_optionTicketsUpdates_description":
            MessageLookupByLibrary.simpleMessage(
                "Stay up-to-date on your events, flights, saved offers and more"),
        "settingsScreen_optionTravelNotice":
            MessageLookupByLibrary.simpleMessage("Are you travelling?"),
        "settingsScreen_optionTravelNotice_description":
            MessageLookupByLibrary.simpleMessage(
                "Enjoy your trip! But please let us know, we monitor all purchases against possible frauds"),
        "settingsScreen_tabBarTitle":
            MessageLookupByLibrary.simpleMessage("Einstellungen"),
        "snackBar_featureUnavailableButBeingFixed_text":
            MessageLookupByLibrary.simpleMessage(
                "Funktion zur Zeit nicht verfügbar. Wir beheben es sofort!")
      };
}
