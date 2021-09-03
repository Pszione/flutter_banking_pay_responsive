import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/components/app_bar_complete.dart';
import 'package:flutter_banking_pay_responsive/components/card_widget.dart';
import 'package:flutter_banking_pay_responsive/models/card.dart';

import '../../constant_text_styles.dart';
import '../../constants.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarComplete(
        title: 'My Cards',
        hasNotifications: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 550,
            padding: const EdgeInsets.all(kDefaultPadding),
            child: ListView.separated(
              physics: const ClampingScrollPhysics(),
              separatorBuilder: (context, index) {
                return const SizedBox(height: 20);
              },
              itemCount: myCards.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return CardWidget(
                  card: myCards[index],
                  onPress: () {},
                );
              },
            ),
          ),
          const CircleAvatar(
            radius: kHugeIconSize,
            child: Icon(
              Icons.add,
              size: 50,
            ),
          ),
          const SizedBox(height: kHalfPadding),
          Text(
            'Add Card'.toUpperCase(),
            style: AppTextStyle.kListTileTitle,
          )
        ],
      ),
    );
  }
}
