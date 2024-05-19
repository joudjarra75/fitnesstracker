import 'dart:io';
import 'user_class.dart';

File file = File("DB.csv");
Map userDB = {'username' : [] , 'password' : [] , 'gender' : [] , 'weight' : [] , 'height' : [] , 'age' : []};

void welcoming(){
  print('\n'+"-"*50 );
  print("Welcome to fitness tracker app");
  print("-"*50 +'\n');
}


void register(){
  // File file = File("DB.csv");
    stdout.write("${"-" * 20}We are happy to have you join our healthy community${"-" * 20}\n");
    stdout.write("please fill your info below\n");
    stdout.write("Enter your username: ");
    String userName = stdin.readLineSync()!;
    stdout.write("Enter your password: ");
    String password = stdin.readLineSync()!;
    stdout.write("Enter your gender F/M: ");
    String gender = stdin.readLineSync()!;
    stdout.write("Enter your weight (kg): ");
    double weight = double.parse(stdin.readLineSync()!);
    stdout.write("Enter your height: ");
    double height = double.parse(stdin.readLineSync()!);
    stdout.write("Enter your age: ");
    int age = int.parse(stdin.readLineSync()!);

    if ((gender == "F" || gender == "M") && weight > 30.0 && height > 100.0 && age > 12){
      User obj = User(userName, password, gender, weight, height, age );
      // print("reg test ${obj.user}");
      file.writeAsStringSync("$userName;$password;$gender;$weight;$height;$age\n",mode: FileMode.append);
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




String?userNameCheck ;
String?passwordCheck;

void login(){
  final i = file.readAsLinesSync();
  // print(i);
  stdout.write("Please enter username: ");
  userNameCheck = stdin.readLineSync()!;
  stdout.write("Please enter password: ");
  passwordCheck = stdin.readLineSync()!; 
  print(userDB);
    checkUsers();
  }

  
void checkUsers(){
  ordaring();
  // print(userDB);
   bool check = userDB["username"].contains(userNameCheck);
   if (check){
      int index = userDB["username"].indexOf(userNameCheck);
      if (userDB["password"][index] == passwordCheck){
        print("your password is correct");
      }
      else{
        stdout.write("your password incorrect, please try again\n");
        passwordCheck = stdin.readLineSync()!;
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

void userChoice(){
print('''${"-"*19}User Choice${"-"*20}
1-Login
2-Register

''');
stdout.write("Please Enter you choice to login\n");
int userChoiceVar = int.parse(stdin.readLineSync()!);

// print("hhhhh${obj.userName}");
if(userChoiceVar == 1){
  login();
}
else if(userChoiceVar == 2){
  register();
}

}