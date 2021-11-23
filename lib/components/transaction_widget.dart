import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/constant_text_styles.dart';
import 'package:flutter_banking_pay_responsive/constants.dart';
import 'package:flutter_banking_pay_responsive/data_providers.dart';
import 'package:flutter_banking_pay_responsive/extensions.dart';
import 'package:flutter_banking_pay_responsive/models/card.dart';
import 'package:flutter_banking_pay_responsive/models/transaction.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;
  final int? transactionIndex;
  final bool isClickable;
  final bool withAvatarImage, withClickableIndicator;
  final GestureTapCallback onPress;

  const TransactionCard({
    Key? key,
    required this.transaction,
    this.transactionIndex,
    this.isClickable = true,
    required this.onPress,
    this.withAvatarImage = true,
    this.withClickableIndicator = false,
  }) : super(key: key);

  static Widget defaultDimensionColored = Container(
    width: double.infinity,
    height: 60 + kDefaultPadding,
    decoration: ShapeDecoration(
      color: const Color(0xFF000000),
      shape: RoundedRectangleBorder(
        borderRadius: kDefaultBorderRadius,
        side: const BorderSide(width: 3),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final bool fullTransactionView = !withAvatarImage || withClickableIndicator;

    // TODO: terrible design
    final listProvider = Provider.of<DBSyncProvider>(context, listen: false);

    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: kDefaultBorderRadius,
        //border: Border.all(width: 2, color: Colors.grey[300]!),
        side: BorderSide(
            width: 2,
            color: listProvider.clickedTransactionIndex != null &&
                    listProvider.clickedTransactionIndex == transactionIndex
                ? kPrimaryColor
                : kLightGrayColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(kHalfPadding),
        child: InkWell(
          borderRadius: kDefaultBorderRadius,
          splashColor: Theme.of(context).colorScheme.secondary,
          onTap: () => onPress.call(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (withAvatarImage)
                    Container(
                      width: 57,
                      height: 57,
                      padding: const EdgeInsets.all(kHalfPadding),
                      decoration: BoxDecoration(
                        borderRadius: kDefaultBorderRadius,
                        color: transaction.color,
                      ),
                      child: transaction.avatar != null
                          ? Image.asset(transaction.avatar!)
                          : const Icon(
                              // TODO: initial letters
                              Icons.account_circle_rounded,
                              size: kHugeIconSize,
                              color: kTextGrayColor,
                            ),
                    ),
                  const SizedBox(width: kHalfPadding),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        // TODO
                        width: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? withAvatarImage
                                ? 140
                                : 180
                            : 300,
                        child: Text(
                          '${transaction.title}',
                          style: AppTextStyles.kListTileTitle
                              .copyWith(height: kTextSmallHeightSpacing),
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      // TODO
                      if (fullTransactionView)
                        SizedBox(
                          width: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? withAvatarImage
                                  ? 140
                                  : 180
                              : 300,
                          child: Text(
                            TransactionModel.parsePaymentMethodToLocalized(
                                    transaction.paymentMethod, context) ??
                                '',
                            style: AppTextStyles.kListTileTitle
                                .copyWith(fontSize: 16)
                                .copyWith(height: kTextMediumHeightSpacing),
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            softWrap: false,
                          ),
                        ),
                      Text(
                        CardModel.parseDateTimeMonthToString(
                                transaction.month, context) ??
                            '',
                        style: AppTextStyles.kListTileSubtitle
                            .copyWith(height: kTextMediumHeightSpacing),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            // '${transaction.currentBalance}',
                            //transaction.price! == transaction.price!.roundToDouble()
                            transaction.price!.hasFractional
                                ? '\$${transaction.price!}'
                                : '\$${transaction.price!.round()}',
                            style: fullTransactionView
                                ? AppTextStyles.kListTileTitle
                                    .copyWith(fontSize: 20)
                                : AppTextStyles.kListTileTitle,
                            textAlign: TextAlign.right,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        ExcludeSemantics(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              transaction.changePercentageIndicator == "up"
                                  ? Icon(
                                      FontAwesomeIcons.levelUpAlt,
                                      size: fullTransactionView ? 14 : 10,
                                      color: Colors.green,
                                    )
                                  : Icon(
                                      FontAwesomeIcons.levelDownAlt,
                                      size: fullTransactionView ? 14 : 10,
                                      color: Colors.red,
                                    ),
                              const SizedBox(width: kHalfPadding),
                              Text(
                                '${transaction.changePercentage}',
                                style: fullTransactionView
                                    ? AppTextStyles.kListTileSubtitle
                                        .copyWith(fontSize: 18)
                                    : AppTextStyles.kListTileSubtitle
                                        .copyWith(height: 1),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (isClickable && withClickableIndicator)
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: kSmallIconSize,
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.6),
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
