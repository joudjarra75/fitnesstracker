import 'dart:io';
import 'user_class.dart';
void welcoming(){
  print('\n'+"-"*50 );
  print("Welcome to fitness tracker app");
  print("-"*50 +'\n');
}

void userChoice(){
print('''${"-"*19}User Choice${"-"*20}
1-Login
2-Register

''');
stdout.write("Please Enter you choice to login\n");
int userChoiceVar = int.parse(stdin.readLineSync()!);
if(userChoiceVar == 1){
  User obj = User();
  obj.login();
}

}


