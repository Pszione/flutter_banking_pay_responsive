import 'package:flutter/material.dart';

class LocalizedTextContainer {
  LocalizedTextContainer({required locale, required this.text})
      : _locale = locale;

  final Locale _locale;
  String text;
}

class NewsModel {
  NewsModel({
    required this.title,
    required this.description,
    this.localizedTitles,
    this.localizedDescriptions,
  });

  String? title;
  String? description;
  final List<LocalizedTextContainer>? localizedTitles;
  final List<LocalizedTextContainer>? localizedDescriptions;

  String getLocalizedTitle(Locale locale) {
    if (localizedTitles != null) {
      var map = localizedTitles
          ?.map((data) =>
              locale.languageCode.contains(data._locale.languageCode)
                  ? data.text
                  : title)
          .first;
      return map ?? '';
    }
    return title ?? '';
  }

  String getLocalizedDescription(Locale locale) {
    // print(localizedDescriptions?.map((data) =>
    //     locale.languageCode.contains(data._locale.languageCode)
    //         ? data.text
    //         : description));
    //
    if (localizedDescriptions != null) {
      var map = localizedDescriptions
          ?.map((data) =>
              locale.languageCode.contains(data._locale.languageCode)
                  ? data.text
                  : description)
          .first;
      return map ?? '';
    }
    return description ?? '';
  }
}

List<NewsModel> myNews = [
  NewsModel(
      title: "More credit limit available",
      description:
          "Your bank just offered more pre-approved credit card limit.\nCome check it out and Enjoy!",
      localizedTitles: [
        LocalizedTextContainer(
            locale: Locale('pt'), text: 'Mais limite de crédito disponível'),
        LocalizedTextContainer(
            locale: Locale('de'), text: 'Mehr Kreditlimit verfügbar'),
      ],
      localizedDescriptions: [
        LocalizedTextContainer(
            locale: Locale('pt'),
            text:
                'Seu banco acabou de liberar mais crédito pré-aprovado no seu cartão.\n Venha conferir e Aproveite!')
      ]),
  NewsModel(
    title: "Cashback's",
    description:
        "Do you want to earn money back with the purchases you already normally make?",
    localizedTitles: [
      LocalizedTextContainer(locale: Locale('pt'), text: 'Ganhe cashbacks!'),
      LocalizedTextContainer(
          locale: Locale('de'), text: 'Cashbacks verdienen!'),
    ],
    localizedDescriptions: [
      LocalizedTextContainer(
          locale: Locale('pt'),
          text:
              'Você quer ganhar dinheiro de volta como parte das compras que você já faz?'),
    ],
  ),
];
