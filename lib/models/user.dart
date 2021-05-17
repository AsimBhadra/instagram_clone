import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserData with ChangeNotifier{
  UserCredential userCredential;
  String username;
  String fullName;
}