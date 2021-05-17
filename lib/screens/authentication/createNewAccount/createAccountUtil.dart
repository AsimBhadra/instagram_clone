import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CreateAccountUtil with ChangeNotifier{

  String selectedMethod = 'Phone';

  bool phoneLoading = false;
  bool emailLoading = false;

  changeMethodPhone(BuildContext context){
    Provider.of<CreateAccountUtil>(context, listen: false).selectedMethod = 'Phone';
    notifyListeners();
  }
  changeMethodEmail(BuildContext context){
    Provider.of<CreateAccountUtil>(context, listen: false).selectedMethod = 'Email';
    notifyListeners();
  }


}