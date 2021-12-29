import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/layers/data/card_brand.dart';
import 'package:flutter_banking_pay_responsive/presentation/ui/designSystem/constants.dart';
import 'package:flutter_banking_pay_responsive/generated/l10n.dart';

class CardModel {
  CardModel({
    this.cardHolderName,
    required this.cardNumber,
    required this.cvv,
    required this.expDate,
    this.cardBrand = CardBrand.mastercard,
    this.cardColor,
    this.nickname,
  });

  String? cardHolderName;
  String? cardNumber;
  String? expDate;
  String? cvv;
  CardBrand cardBrand;
  Color? cardColor;
  String? nickname;

  static Color getCardColorNullSafety(
      {required CardModel card, double opacity = 1.0}) {
    Color selectedColor = card.cardColor ?? Colors.black45;

    if (selectedColor == Colors.white) {
      // TODO: is it the right way to do it?
      return kGrayColor;
    } else {
      return selectedColor.withOpacity(opacity);
    }
  }

  static String? getCardNickname(CardModel card) {
    return card.nickname ?? card.cardNumber;
  }

  static bool hasCardExpired(String? expDate) {
    if (expDate == null || expDate.isEmpty) {
      return true; // warning
    } else if (expDate.contains('/')) {
      var currentYear = DateTime.now();
      var expMonth = expDate.split('/').first;
      var expYear = expDate.split('/').last;

      var cardDate = expYear.length <= 2
          ? DateTime(2000 + int.parse(expYear), int.parse(expMonth))
          : DateTime(int.parse(expYear), int.parse(expMonth));

      return cardDate.isBefore(currentYear);
    }
    return false;
  }

  static DateTime? parseExpDateStringToDateTime(String? expDate) {
    if (expDate == null || expDate.isEmpty) {
      return null;
    } else if (expDate.contains('/')) {
      var expMonth = expDate.split('/').first;
      var expYear = expDate.split('/').last;

      return expYear.length <= 2
          ? DateTime(2000 + int.parse(expYear), int.parse(expMonth))
          : DateTime(int.parse(expYear), int.parse(expMonth));
    }
  }

  static String? parseDateTimeMonthToString(
      String? date, BuildContext? context) {
    if (date == null || date.isEmpty) {
      return null;
    } else {
      int? month = parseExpDateStringToDateTime(date)?.month;
      if (month != null) {
        switch (month) {
          case 1:
            return context != null ? S.of(context).dateTime_january : 'January';
          case 2:
            return context != null
                ? S.of(context).dateTime_february
                : 'February';
          case 3:
            return context != null ? S.of(context).dateTime_march : 'March';
          case 4:
            return context != null ? S.of(context).dateTime_april : 'April';
          case 5:
            return context != null ? S.of(context).dateTime_may : 'May';
          case 6:
            return context != null ? S.of(context).dateTime_june : 'June';
          case 7:
            return context != null ? S.of(context).dateTime_july : 'July';
          case 8:
            return context != null ? S.of(context).dateTime_august : 'August';
          case 9:
            return context != null
                ? S.of(context).dateTime_september
                : 'September';
          case 10:
            return context != null ? S.of(context).dateTime_october : 'October';
          case 11:
            return context != null
                ? S.of(context).dateTime_november
                : 'November';
          case 12:
            return context != null
                ? S.of(context).dateTime_december
                : 'December';
        }
      }
      return date;
    }
  }

  /// Obscure given string character with ** (secret)
  static String obscureCardInfo(String info, int? visibleCharactersLength) {
    const secret = '*';
    var regex = RegExp('[0-9]');
    var newObscuredString = <String>[];

    /// Obscure all string characters
    if (visibleCharactersLength == null ||
        visibleCharactersLength >= info.length) {
      for (var i = 0; i < info.length; i++) {
        newObscuredString.add(secret);
      }
      return newObscuredString.join();
    }
    for (var i = 0; i < info.length; i++) {
      if (i < info.length - visibleCharactersLength &&
          regex.hasMatch(info[i])) {
        newObscuredString.add(secret);
      } else {
        newObscuredString.add(info[i]);
      }
    }
    return newObscuredString.join();
    //email.replaceAll(RegExp(r'(?<=.{1}).(?=.*@)'), '*') // j******@email.com
    //return info.replaceAll(RegExp('r[0-9]'), info.length - visibleCharactersLength, secret);
  }

  static String substringCardInfo(String info, int? remainingCharactersLength) {
    /// Display all string characters
    if (remainingCharactersLength == null ||
        remainingCharactersLength >= info.length) {
      return info;
    }

    return info.substring(info.length - remainingCharactersLength);
  }
}

List<CardModel> myCards = [
  CardModel(
    cardHolderName: "Pedro A B C",
    cardNumber: "1234 1234 1234 1234",
    cvv: "501",
    expDate: "12/21",
    cardColor: const Color(0xf63d96db),
    cardBrand: CardBrand.mastercard,
  ),
  CardModel(
    cardHolderName: "Pedro A B C",
    cardNumber: "5678 5678 5678 5678",
    cvv: "009",
    expDate: "01/22",
    cardBrand: CardBrand.visaPlatinum,
    cardColor: kSecondaryColor,
    nickname: 'C6 Pink',
  ),
  // CardModel(
  //   cardHolderName: "Pedro A B C",
  //   cardNumber: "1122 1122 1122 1122",
  //   cvv: "121",
  //   expDate: "12/20",
  //   cardBrand: CardBrand.americanExpress,
  //   // cardColor: kSecondaryColor,
  //   nickname: 'Black Unlimited',
  // ),
  // CardModel(
  //   cardHolderName: "Pedro A B C",
  //   cardNumber: "2552 2552 2552 2552",
  //   cvv: "343",
  //   expDate: "03/20",
  //   cardBrand: CardBrand.mastercard,
  //   cardColor: Colors.white,
  // ),
  //
  CardModel(
      cardHolderName: "Pedro A B C",
      cardNumber: "3344 3344 3344 3344",
      cvv: "2345",
      expDate: "05/25",
      cardBrand: CardBrand.mastercard,
      cardColor: const Color(0xffde3838),
      nickname: 'iFood Card'),
  CardModel(
    cardHolderName: "Pedro A B C",
    cardNumber: "9988 9988 9988 9988",
    cvv: "1100",
    expDate: "10/21",
    cardBrand: CardBrand.mastercard,
    cardColor: kComplementaryColor,
    nickname: 'PayPal',
  ),
];
