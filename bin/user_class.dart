import 'dart:io';

class User{
  // late String userName ;
  // late String password  ; 
  File file = File("DB.csv");
  late String _userName;
  late String _password;
  late String  _gender;
  late double _weight;
  late double _height;
  late int _age;

  // set user (String u) => _userName = u;
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

      print("your info added successfully");
      print("enter 'B' to back then continue to login");
      String char = stdin.readLineSync()!;
      if (char == "B"){
        print("Welcome back to login page");
        login();
      }

    }
   
  //check else 

void login(){
   final i = file.readAsLinesSync();
      i.removeAt(0);
      Map userDB = {'username' : [] , 'password' : [] , 'gender' : [] , 'weight' : [] , 'height' : [] , 'age' : []};
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
    
    stdout.write("Please enter username: ");
    _userName = stdin.readLineSync()!;
    stdout.write("Please enter password: ");
    _password = stdin.readLineSync()!;
   
   
    if (userDB["username"].contains(_userName)){
      int index = userDB["username"].indexOf(_userName);
      if (userDB["password"][index] == _password){
        print("your password is correct");
      }
      else{
        print("your password incorrect, please try again");

      }
    }
    else{
      print("your username not found, please register then come to login");
    }
  }

}