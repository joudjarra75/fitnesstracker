
import 'dart:io';

void main(List<String> args) {
   File file1 = File("dailytracker.csv");

   double? w1,s1,w2,s2,c1 ;
   int? day;
   Map table  = {"days":[],"w1":[] , "s1":[] , "w2":[] , "s2":[],"c1":[]};

  void inputTodaily(){

    print("number of day:");
   day = int.parse(stdin.readLineSync()!);
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
 
    
     file1.writeAsStringSync("$day;$w1;$s1;$w2;$s2;$c1\n",mode: FileMode.append);

  }

  void tableFun(){
    final read = file1.readAsLinesSync();
    read.removeAt(0);
    for (var i in read){
      var val = i.split(";");
      table['days'].add(val[0]);
      table['w1'].add(val[1]);
      table['s1'].add(val[2]);
      table['w2'].add(val[3]);
      table['s2'].add(val[4]);
      table['c1'].add(val[5]);
    }

  }
   void dailyTracker(){
    tableFun();
print("_____________________________________________________\n|  days  | weight | sleep | water | steps | calories \n_____________________________________________________");
for (int i = 1; i<=7 ;i++){
  
  print("| day $i |${table['w1'][i]}|${table['s1'][i]}|${table['w2'][i]}|${table['s2'][i]}|${table['c1'][i]}\n_____________________________________________________");
}
}
inputTodaily();
dailyTracker();
}
