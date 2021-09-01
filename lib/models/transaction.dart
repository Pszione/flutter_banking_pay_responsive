import 'package:flutter/material.dart';

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
}

List<TransactionModel> myTransactions = [
  TransactionModel(
    title: "Supreme Leader",
    avatar: "assets/icons/avatars/avatar1.png",
    month: "Jan",
    price: 22.47,
    paymentMethod: 'Google Pay',
    currentBalance: "\$5482",
    changePercentage: "0.41%",
    changePercentageIndicator: "up",
    color: Colors.green[100],
  ),
  TransactionModel(
    title: "Jane Doe",
    avatar: "assets/icons/avatars/avatar2.png",
    month: "Mar",
    price: 1230,
    paymentMethod: 'Google Pay',
    currentBalance: "\$4252",
    changePercentageIndicator: "down",
    changePercentage: "4.54%",
    color: Colors.orange[100],
  ),
  TransactionModel(
    title: "Alex Doe",
    avatar: "assets/icons/avatars/avatar3.png",
    month: "Mar",
    price: 200,
    paymentMethod: 'Google Pay',
    currentBalance: "\$4052",
    changePercentage: "1.27%",
    changePercentageIndicator: "down",
    color: Colors.red[100],
  ),
  TransactionModel(
    title: "Sam Doe",
    avatar: "assets/icons/avatars/avatar4.png",
    month: "Mar",
    price: 1215.6,
    paymentMethod: 'Bank Deposit',
    currentBalance: "\$5267",
    changePercentageIndicator: "up",
    changePercentage: "30%",
    color: Colors.deepPurple[100],
  ),
  TransactionModel(
    title: "Supreme Leader",
    avatar: "assets/icons/avatars/avatar1.png",
    month: "Jan",
    price: 215,
    paymentMethod: 'Google Pay',
    currentBalance: "\$5482",
    changePercentage: "4.1%",
    changePercentageIndicator: "up",
    color: Colors.green[100],
  ),
  TransactionModel(
    title: "Target Supermarket",
    //avatar: "assets/icons/avatars/avatar2.png",
    month: "Mar",
    price: 1230,
    paymentMethod: 'Credit Card',
    currentBalance: "\$4252",
    changePercentageIndicator: "down",
    changePercentage: "4.54%",
    color: Colors.red[100],
  ),
  TransactionModel(
    title: "Steam Games",
    //avatar: "assets/icons/avatars/avatar2.png",
    month: "Mar",
    price: 102,
    paymentMethod: 'Credit Card',
    currentBalance: "\$4150",
    changePercentageIndicator: "down",
    changePercentage: "2.4%",
    color: Colors.grey[100],
  ),
];
