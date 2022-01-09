import 'package:flutter/material.dart';
// TODO: remove this dependency
import 'package:flutter_banking_pay_responsive/generated/l10n.dart';

class TransactionModel {
  TransactionModel({
    this.title,
    this.avatar,
    this.month,
    this.price,
    this.paymentMethod,
    this.currentBalance,
    this.changePercentageIndicator,
    this.changePercentage,
    this.color,
  });

  String? title;
  String? avatar;
  String? month;
  double? price;
  String? paymentMethod;
  String? currentBalance;
  String? changePercentageIndicator;
  String? changePercentage;
  Color? color;

  static String? parsePaymentMethodToLocalized(
      String? method, BuildContext? context) {
    if (method == null || method.isEmpty) {
      return null;
    } else {
      // TODO: domain layer knows about concrete class
      switch (method) {
        case 'Credit Card':
          return context != null
              ? S.of(context).paymentMethod_creditCard
              : 'Credit Card';
        case 'Debit Card':
          return context != null
              ? S.of(context).paymentMethod_debitCard
              : 'Debit Card';
        case 'Bank Deposit':
          return context != null
              ? S.of(context).paymentMethod_bankDeposit
              : 'Bank Deposit';
        case 'PIX':
          return 'PIX';
      }
    }
    return method;
  }
}

List<TransactionModel> myTransactions = [
  TransactionModel(
    title: "Leroy Merlin",
    avatar: "assets/icons/avatars/avatar1.png",
    month: "01/21",
    price: 22.47,
    paymentMethod: 'Credit Card',
    currentBalance: "\$5482",
    changePercentage: "0.41%",
    changePercentageIndicator: "up",
    color: Colors.green[100],
  ),
  TransactionModel(
    title: "Jane Santos",
    avatar: "assets/icons/avatars/avatar2.png",
    month: "02/21",
    price: 1230.00,
    paymentMethod: 'Google Pay',
    currentBalance: "\$4252",
    changePercentageIndicator: "down",
    changePercentage: "4.54%",
    color: Colors.orange[100],
  ),
  TransactionModel(
    title: "Alex Doe",
    avatar: "assets/icons/avatars/avatar3.png",
    month: "03/21",
    price: 200.33,
    paymentMethod: 'Google Pay',
    currentBalance: "\$4052",
    changePercentage: "1.27%",
    changePercentageIndicator: "down",
    color: Colors.red[100],
  ),
  TransactionModel(
    title: "Alex Chacón",
    avatar: "assets/icons/avatars/avatar4.png",
    month: "03/21",
    price: 1215.62,
    paymentMethod: 'Bank Deposit',
    currentBalance: "\$5267",
    changePercentageIndicator: "up",
    changePercentage: "30%",
    color: Colors.deepPurple[100],
  ),
  TransactionModel(
    title: "Supreme Leader",
    avatar: "assets/icons/avatars/avatar1.png",
    month: "05/21",
    price: 215.00,
    paymentMethod: 'PIX',
    currentBalance: "\$5482",
    changePercentage: "4.1%",
    changePercentageIndicator: "up",
    color: Colors.green[100],
  ),
  TransactionModel(
    title: "Target Supermarket",
    //avatar: "assets/icons/avatars/avatar2.png",
    month: "07/21",
    price: 1230.00,
    paymentMethod: 'Credit Card',
    currentBalance: "\$4252",
    changePercentageIndicator: "down",
    changePercentage: "4.54%",
    color: Colors.red[100],
  ),
  TransactionModel(
    title: "Steam Games",
    //avatar: "assets/icons/avatars/avatar2.png",
    month: "08/21",
    price: 102.00,
    paymentMethod: 'Credit Card',
    currentBalance: "\$4150",
    changePercentageIndicator: "down",
    changePercentage: "2.4%",
    color: Colors.grey[100],
  ),
  TransactionModel(
    title: "The Plant",
    //avatar: "assets/icons/avatars/avatar2.png",
    month: "09/21",
    price: 182.33,
    paymentMethod: 'Credit Card',
    currentBalance: "\$3967",
    changePercentageIndicator: "down",
    changePercentage: "4.39%",
    color: Colors.green[600],
  ),
  TransactionModel(
    title: "Bia Moraes",
    //avatar: "assets/icons/avatars/avatar2.png",
    month: "09/21",
    price: 1066.00,
    paymentMethod: 'Bank Deposit',
    currentBalance: "\$5033",
    changePercentageIndicator: "up",
    changePercentage: "26.9%",
    color: Colors.grey[100],
  ),
  TransactionModel(
    title: "JOB Paycheck",
    //avatar: "assets/icons/avatars/avatar2.png",
    month: "09/21",
    price: 35000.00,
    paymentMethod: 'Bank Deposit',
    currentBalance: "\$40033",
    changePercentageIndicator: "up",
    changePercentage: "695%",
    color: const Color(0xff1bc446),
  ),
  TransactionModel(
    title: "New Subaru Car",
    //avatar: "assets/icons/avatars/avatar2.png",
    month: "10/21",
    price: 23979.00,
    paymentMethod: 'Debit Card',
    currentBalance: "\$4150",
    changePercentageIndicator: "down",
    changePercentage: "59.9%",
    color: const Color(0xff1e74db),
  ),
];
