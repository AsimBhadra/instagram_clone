import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:provider/provider.dart';

import 'birthdayHelpers.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({Key key}) : super(key: key);

  @override
  _BirthdayScreenState createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  ConstantColors constantColors = ConstantColors();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: constantColors.blackBackgroundColor,
        body: Column(
          children: [
            Provider.of<BirthdayHelpers>(context, listen: false).mainText(context),
            Provider.of<BirthdayHelpers>(context, listen: false).subtitleText(context),
            Provider.of<BirthdayHelpers>(context, listen: false).birthdayLogo(context),
            Provider.of<BirthdayHelpers>(context, listen: false).dateShower(context),
            Provider.of<BirthdayHelpers>(context, listen: false).nextButton(context),
          ],
        ),
      ),
    );
  }
}
