import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/components/card_widget.dart';
import 'package:flutter_banking_pay_responsive/models/card.dart';
import 'package:flutter_banking_pay_responsive/screens/homeScreen/user_cards_section.dart';

import '../../constant_text_styles.dart';
import '../../constants.dart';
import '../../size_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  get userCards => null;

  //late SizeConfig _sizes;

  @override
  Widget build(BuildContext context) {
    //final SizeConfig _sizes = SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Bank',
          style: AppTextStyle.kMenuTitle,
        ),
        automaticallyImplyLeading: true,
        leadingWidth: 100,
        leading: Row(
          children: [
            IconButton(
              // padding: EdgeInsets.all(8.0),
              padding: const EdgeInsets.only(left: kDefaultPadding),
              icon: const Icon(
                Icons.notifications_active_outlined,
                color: kDarkColor,
                size: kMediumIconSize,
              ),
              onPressed: () {},
            ),
            // TODO: make it clickable
            IconButton(
              icon: const Icon(
                Icons.search_rounded,
                color: kDarkColor,
                size: kMediumIconSize,
              ),
              onPressed: () {},
            )
          ],
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: kDefaultPadding),
            icon: const CircleAvatar(
              backgroundImage:
                  NetworkImage('https://placeimg.com/640/480/people'),
            ),
            iconSize: kHugeIconSize,
            onPressed: () {},
          ),
        ],
      ),
      // Cards
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: const <Widget>[
              UserCardsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
