import 'package:flutter/material.dart';

import '../../ui.dart';

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
