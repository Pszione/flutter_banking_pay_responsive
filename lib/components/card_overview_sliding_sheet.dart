import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/models/card.dart';

import '../constant_text_styles.dart';
import '../constants.dart';

class CardOverviewSlidingSheet extends StatelessWidget {
  const CardOverviewSlidingSheet({Key? key, required this.card})
      : super(key: key);

  final CardModel card;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        //alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
            width: double.infinity,
            height: 450,
            color: CardModel.getCardColorNullSafety(card: card, opacity: 0.85),
          ),
          Container(
            width: double.infinity,
            height: 430,
            margin: const EdgeInsets.only(
                left: kDefaultPadding,
                right: kDefaultPadding,
                bottom: kHalfPadding),
            padding: const EdgeInsets.only(
                left: kDefaultPadding,
                right: kDefaultPadding,
                top: kDefaultPadding),
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: kHugeBorderRadius,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding * 2),
                  ),
                  child: const Text('Close'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              // Builder(
              //     // sheetController needs a builder around it to get the right context
              //     builder: (context) {
              //   return ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       shape: const StadiumBorder(),
              //       padding: const EdgeInsets.symmetric(
              //           horizontal: kDefaultPadding * 2),
              //     ),
              //     child: const Text('Show more'),
              //     onPressed: () =>
              //         SheetController.of(context)!.expand(),
              //   );
              // }),

              // const Padding(
              //   padding: EdgeInsets.all(kDefaultPadding),
              // ),
              // const SizedBox(height: kHalfPadding),
              Text(
                CardModel.getCardNickname(card)!,
                style: AppTextStyles.getBodyText(context)
                    .copyWith(fontSize: 22, overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
