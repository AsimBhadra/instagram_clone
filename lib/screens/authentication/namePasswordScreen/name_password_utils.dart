import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NamePasswordUtils with ChangeNotifier{
  bool isObscure = true;

  changeVisibility(BuildContext context){
    Provider.of<NamePasswordUtils>(context, listen: false).isObscure = !Provider.of<NamePasswordUtils>(context, listen: false).isObscure;
    notifyListeners();
  }

}