import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:provider/provider.dart';

class FirebaseOperations with ChangeNotifier {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future createUserCollection(BuildContext context) async {
    UserCredential userCredential =
        Provider.of<UserData>(context, listen: false).userCredential;
    print(userCredential);
    print('Creating User data collection');
    CollectionReference users =
    FirebaseFirestore.instance.collection('users');
    return users.doc(userCredential.user.email).set({
      'email': userCredential.user.email,
      'uid': userCredential.user.uid,
      'username' : Provider.of<UserData>(context, listen: false).username,
      'name' : Provider.of<UserData>(context, listen: false).fullName,
    });
  }
}
