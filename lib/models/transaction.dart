import 'package:flutter/material.dart';

class Transaction {
  Transaction({
    this.title,
    this.avatar,
    this.month,
    this.currentBalance,
    this.changePercentageIndicator,
    this.changePercentage,
    this.color,
  });

  String? title;
  String? avatar;
  String? month;
  String? currentBalance;
  String? changePercentageIndicator;
  String? changePercentage;
  Color? color;
}

List<Transaction> myTransactions = [
  Transaction(
    avatar: "assets/icons/avatar1.png",
    currentBalance: "\$5482",
    changePercentage: "0.41%",
    changePercentageIndicator: "up",
    month: "Jan",
    title: "Supreme Leader",
    color: Colors.green[100],
  ),
  Transaction(
    avatar: "assets/icons/avatar2.png",
    currentBalance: "\$4252",
    changePercentageIndicator: "down",
    changePercentage: "4.54%",
    month: "Mar",
    title: "Jane Doe",
    color: Colors.orange[100],
  ),
  Transaction(
    avatar: "assets/icons/avatar3.png",
    currentBalance: "\$4052",
    changePercentage: "1.27%",
    changePercentageIndicator: "down",
    month: "Mar",
    title: "Alex Doe",
    color: Colors.red[100],
  ),
  Transaction(
    avatar: "assets/icons/avatar4.png",
    currentBalance: "\$5052",
    changePercentageIndicator: "up",
    changePercentage: "3.09%",
    month: "Mar",
    title: "Sam Doe",
    color: Colors.deepPurple[100],
  ),
  Transaction(
    avatar: "assets/icons/avatar1.png",
    currentBalance: "\$5482",
    changePercentage: "0.41%",
    changePercentageIndicator: "up",
    month: "Jan",
    title: "Supreme Leader",
    color: Colors.green[100],
  ),
  Transaction(
    avatar: "assets/icons/avatar2.png",
    currentBalance: "\$4252",
    changePercentageIndicator: "down",
    changePercentage: "4.54%",
    month: "Mar",
    title: "Jane Doe",
    color: Colors.orange[100],
  ),
];
