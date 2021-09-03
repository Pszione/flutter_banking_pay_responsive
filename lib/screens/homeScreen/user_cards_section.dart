import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/components/card_widget.dart';
import 'package:flutter_banking_pay_responsive/models/card.dart';

class UserCardsSection extends StatelessWidget {
  const UserCardsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
          physics: const ClampingScrollPhysics(),
          separatorBuilder: (context, index) {
            return const SizedBox(width: 10);
          },
          itemCount: myCards.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CardWidget(
              card: myCards[index],
              onPress: () {},
            );
          }),
    );
  }
}
