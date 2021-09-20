import 'package:flutter/material.dart';

class AccountModel {
  AccountModel({
    required this.ID,
    required this.email,
    required this.fullname,
    this.avatar,
    this.avatarThumbnail,
  });

  final String ID;
  final String? fullname;
  final String? email;
  final String? avatar, avatarThumbnail;
}

List<AccountModel> myAccounts = [
  AccountModel(
    ID: '027846599',
    email: 'pedrinho554@gmail.com',
    fullname: 'Pedro Santos',
    avatar: 'assets/images/35244548_pedro_santos.png',
    avatarThumbnail: 'assets/images/35244548_pedro_santos.png',
  ),
  AccountModel(
    ID: '2256554436',
    email: 'oused.games@gmail.com',
    fullname: 'Oused Games',
    avatar: 'assets/icons/logo_master_card.png',
    avatarThumbnail: 'assets/icons/logo_master_card.png',
  ),
  AccountModel(
    ID: '44859659',
    email: 'euacredito@gmail.com',
    fullname: 'Eu Acredito Na Humanidade',
    avatar: 'assets/images/_earth_TEST07B.jpg',
    avatarThumbnail: 'assets/images/_earth_TEST07B.jpg',
  ),
];
