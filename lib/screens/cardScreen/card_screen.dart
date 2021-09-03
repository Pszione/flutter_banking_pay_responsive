import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/components/app_bar_complete.dart';
import 'package:flutter_banking_pay_responsive/components/card_widget.dart';
import 'package:flutter_banking_pay_responsive/models/card.dart';
import 'package:flutter_banking_pay_responsive/responsive.dart';

import '../../constant_text_styles.dart';
import '../../constants.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComplete(
        title: 'My Cards',
        hasNotifications: true,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: Responsive.isMobileLarge(context) ? 522 : 200,
                child: ListView.separated(
                  physics: const ClampingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                        width: kHalfPadding, height: kDefaultPadding);
                  },
                  itemCount: myCards.length,
                  shrinkWrap: true,
                  scrollDirection: Responsive.isMobileLarge(context)
                      ? Axis.vertical
                      : Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CardWidget(
                      card: myCards[index],
                      onPress: () {},
                    );
                  },
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: kHalfPadding),
                  const CircleAvatar(
                    radius: kMediumIconSize,
                    child: Icon(
                      Icons.add,
                      size: 50,
                    ),
                  ),
                  const SizedBox(height: kHalfPadding),
                  Text(
                    'Add Card'.toUpperCase(),
                    style: AppTextStyle.kListTileTitle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
