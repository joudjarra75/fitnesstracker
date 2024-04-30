import 'dart:io';
import 'users_db.dart';

class User{
  // late String userName ;
  // late String password  ; 
  void login(){
    stdout.write("Please enter username: ");
    String userName = stdin.readLineSync()!;
    stdout.write("Please enter password: ");
    String password = stdin.readLineSync()!;


    if (userDB["usernames"].contains(userName)){
      int index = userDB["usernames"].indexOf(userName);
      if (userDB["passwords"][index] == password){
        print("your password is correct");
      }
      else{
        print("your password incorrect, please try again");

      }
    }
    else{
      print("your username not found, please registter then come to login");
    }
  }

}