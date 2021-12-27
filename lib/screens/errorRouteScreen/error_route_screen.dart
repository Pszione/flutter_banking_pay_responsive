import 'package:flutter/material.dart';
import 'package:flutter_banking_pay_responsive/components/app_bar_complete.dart';

class ErrorRouteScreen extends StatelessWidget {
  const ErrorRouteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComplete(
        title: 'Error',
        googleAvatarThumbnail: '',
      ),
      body: const Center(
        // TODO: make this look good
        child: Text('Error'),
      ),
    );
  }
}
