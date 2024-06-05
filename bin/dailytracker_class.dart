import 'user_class.dart';
import 'dart:io';
class Tracking {

  User objTracker;
  Tracking(this.objTracker); //constructor

  File file1 = File("dailytracker.csv");
   double? w1,s1,w2,s2,c1 ;

   Map table  = {"days":[],"w1":[] , "s1":[] , "w2":[] , "s2":[],"c1":[],'username':[]};

  void inputTodaily(int day,String userNameCheck){

    print("Enter your weight :");
    w1 = double.parse(stdin.readLineSync()!);
    print("How many hours did you sleep?");
    s1 = double.parse(stdin.readLineSync()!);
    print("How many liters of water did you drink?");
    w2 = double.parse(stdin.readLineSync()!);
    print("How many steps did you walk?");
    s2 = double.parse(stdin.readLineSync()!);
    print("How many calories are you today?");
    c1 = double.parse(stdin.readLineSync()!);
    file1.writeAsStringSync("$day;$w1;$s1;$w2;$s2;$c1;$userNameCheck\n",mode: FileMode.append);

  }

  void tableFun(){
    final read = file1.readAsLinesSync();
    read.removeAt(0);
    // for (var i in read){
    //   var val = i.split(";");
      table['days'].add(';');
      table['w1'].add(';');
      table['s1'].add(';');
      table['w2'].add(';');
      table['s2'].add(';');
      table['c1'].add(';');
      table['username'].add(';');
    // }

  }

//    void dailyTracker(){
    
// print("_____________________________________________________\n|  days  | weight | sleep | water | steps | calories \n_____________________________________________________");
// for (int i = 1; i<=7 ;i++){
  
//   print("| day $i |  ${table['w1'][i]}  |  ${table['s1'][i]}  |  ${table['w2'][i]}  |  ${table['s2'][i]}  |  ${table['c1'][i]  }\n_____________________________________________________");
// }
// }

void checkDays(userNameCheck){
  

   print("number of day:");
   int day = int.parse(stdin.readLineSync()!);
   tableFun();
   
if(day == 1 || day == 2 || day == 3 || day == 4 || day == 5 || day == 6 || day == 7){
  if(table["days"].contains(day.toString())){ 
    print("This day already filled");
}
  else{
  inputTodaily(day,userNameCheck);
  print("_____________________________________________________\n|  days  | weight | sleep | water | steps | calories | userName \n_____________________________________________________");

  }

}
else{
  print("This number not valid, try again");
}
    final read = file1.readAsLinesSync();
    read.removeAt(0);

for (int i = 0 ; i < read.length; i++){
  
  print("| ${read[i]}  \n_____________________________________________________");
}
}

}