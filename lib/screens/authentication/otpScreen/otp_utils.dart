import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class OTPUtils with ChangeNotifier{

  bool isValid = false;

  makeValid(BuildContext context){
    Provider.of<OTPUtils>(context, listen: false).isValid = true;
    notifyListeners();
  }
  makeInvalid(BuildContext context){
    Provider.of<OTPUtils>(context, listen: false).isValid = false;
    notifyListeners();
  }


}