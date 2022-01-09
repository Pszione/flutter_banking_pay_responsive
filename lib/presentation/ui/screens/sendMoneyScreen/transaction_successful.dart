import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../ui.dart';

class TransactionSuccessful extends StatelessWidget {
  const TransactionSuccessful({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(
          child: ResponsiveWidthConstrained(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: kDefaultPadding),
                  child: Text(
                    S.of(context).transactionSuccessfulScreen_success_title,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.kListTileTitle.copyWith(fontSize: 24),
                  ),
                ),
                Image.asset(
                  'assets/images/success.png',
                  height: MediaQuery.of(context).size.height *
                      (MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? 0.4
                          : 0.6), // 40%
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
