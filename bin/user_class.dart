import 'dart:io';
import 'functions.dart';

class User{

  late String _userName;
  late String _password;
  late String  _gender;
  late double _weight;
  late double _height;
  late int _age;

  set user (String u) => _userName = u;
  String get user => _userName;
  User(this._userName,this._password,this._gender,this._weight,this._height,this._age);
  
}