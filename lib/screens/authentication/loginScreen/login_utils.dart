import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class LoginUtils with ChangeNotifier{

  bool isObscure = true;

  changeVisibility(BuildContext context){
    Provider.of<LoginUtils>(context, listen: false).isObscure = !Provider.of<LoginUtils>(context, listen: false).isObscure;
    notifyListeners();
  }

}