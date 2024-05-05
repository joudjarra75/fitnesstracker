import 'dart:io';
import 'functions.dart';
Map userDB = {'username' : [] , 'password' : [] , 'gender' : [] , 'weight' : [] , 'height' : [] , 'age' : []};

class User{
  File file = File("DB.csv");
  late String _userName;
  late String _password;
  late String  _gender;
  late double _weight;
  late double _height;
  late int _age;
  // set user (String u) => _userName = u;

  // User(this._userName,this._password,this._gender,this._weight,this._height,this._age);


  void register(){
    stdout.write("${"-" * 20}We are happy to have you join our healthy community${"-" * 20}\n");
    stdout.write("please fill your info below\n");
    stdout.write("Enter your username: ");
    _userName = stdin.readLineSync()!;
    stdout.write("Enter your password: ");
    _password = stdin.readLineSync()!;
    stdout.write("Enter your gender F/M: ");
    _gender = stdin.readLineSync()!;
    stdout.write("Enter your weight (kg): ");
    _weight = double.parse(stdin.readLineSync()!);
    stdout.write("Enter your height: ");
    _height = double.parse(stdin.readLineSync()!);
    stdout.write("Enter your age: ");
    _age = int.parse(stdin.readLineSync()!);
  
    if ((_gender == "F" || _gender == "M") && _weight > 30.0 && _height > 100.0 && _age > 12){
      file.writeAsStringSync("$_userName;$_password;$_gender;$_weight;$_height;$_age\n",mode: FileMode.append);
      }
    
    else{
      print("Your info not match with constraints");
     
      stdout.write(" Do you want back again to fill info ? Y/N ");
      String char = stdin.readLineSync()!;
      if (char == "Y" || char == "y"){
        register();
      }

      else if(char == "N" || char == "n"){
        exit(0);
      }

      else{
        welcoming();
        userChoice();
      
      }
    }

      print("your info added successfully");
      print("do you want back to login ? Y/N");
      String char = stdin.readLineSync()!;
      if (char == "Y" || char == "y"){
        print("Welcome back to login page");
        login();
      }

      else if(char == "N" || char == "n"){
      exit(0);
      }
      else{
        welcoming();
        userChoice(); 
      }
  
    }
   

void ordaring(){
     final i = file.readAsLinesSync();
      i.removeAt(0);
      for (var line in i)
    {
      final value = line.split(';');
      userDB['username'].add(value[0]);
      userDB['password'].add(value[1]);
      userDB['gender'].add(value[2]);
      userDB['weight'].add(value[3]);
      userDB['height'].add(value[4]);
      userDB['age'].add(value[5]);
    }

}

void checkUsers(){
  ordaring();
   if (userDB["username"].contains(_userName)){
      int index = userDB["username"].indexOf(_userName);
      if (userDB["password"][index] == _password){
        print("your password is correct");
      }
      else{
        stdout.write("your password incorrect, please try again\n");
        _password = stdin.readLineSync()!;
        checkUsers();
      }
  }

    else{
      print("This username not found, please register then come to login");
      stdout.write("Do you want back to register? Y/N ");
      String char = stdin.readLineSync()!;

      if (char == "Y" || char =="y"){
        register();
      }

      else if(char == "N" || char == "n"){
        exit(0);
      }

      else{
        welcoming();
        userChoice();
      }
    }
}

void login(){
    stdout.write("Please enter username: ");
    _userName = stdin.readLineSync()!;
    stdout.write("Please enter password: ");
    _password = stdin.readLineSync()!;
    checkUsers();
  }

}