import 'package:flutter/material.dart';

import '../../constant_text_styles.dart';
import '../../size_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
      ),
    );
  }
}
