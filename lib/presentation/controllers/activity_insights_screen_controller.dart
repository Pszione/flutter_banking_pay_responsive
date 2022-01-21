import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../layers/layers.dart';
import '../ui/ui.dart';

class ActivityInsightsScreenController {
  List<TransactionModel> transactions = [];
  List<int> indicesVisible = <int>[];
  final double listScrollBottomSpacer = 360.0;

  ActivityInsightsScreenController() {
    transactions = myTransactions;
  }

  Future<void> showShareOptions(BuildContext context) {
    return Share.share(
      '${S.of(context).share_message_checkOutMyNewProject} $K_WEBSITE_PEDRO_SANTOS',
      subject: S.of(context).share_message_iveDoneIt,
    );
  }

  void handleObservableTransactionOpening(
      BuildContext context, void Function(int) successCallback) async {
    await Future.delayed(const Duration(milliseconds: 500));
    var provider = Provider.of<DBSyncProvider>(context, listen: false);

    if (provider.clickedTransactionIndex != null) {
      print('Transactions index is: ${provider.clickedTransactionIndex}');
      successCallback(provider.clickedTransactionIndex!);

      await Future.delayed(const Duration(seconds: 3));
      provider.clearClickedTransactionIndex(); // important
    }
  }

  calculateScrollUpIndices() => (indicesVisible.first / 2.5).abs().ceil();

  calculateScrollDownIndices() => (indicesVisible.last * 1.5).abs().round();
}
