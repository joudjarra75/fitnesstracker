import 'dart:math';
import 'user_class.dart';

class Plan {
 User objPlan ;
 Plan(this.objPlan);
 
  void bmi(){
    double w = objPlan.weight;
    double h = objPlan.hight/100;
    double bmi = w/pow(h, 2);
    double cal = bmr();

    if (bmi <= 18){
    print("="*50 +'\n');
    print("""
Your BMI : Underweight
To Maintain weight = $cal Calories/day
To gain weight = ${cal+500} Calories/day
To loss weight = ${cal-500} Calories/day
""");
print("="*50 +'\n');
    
  }

  else if (bmi > 18.5 && bmi < 24.9){
    print("="*50 +'\n');
    print("""
Your BMI : Normal
To Maintain weight = $cal Calories/day
To gain weight = ${cal+500} Calories/day
To loss weight = ${cal-500} Calories/day
""");
print("="*50 +'\n'); 
  }
  else if (bmi > 25 && bmi < 39.9){
    print("="*50 +'\n'); 
    print("""
Your BMI : Overweight
To Maintain weight = $cal Calories/day
To gain weight = ${cal+500} Calories/day
To loss weight = ${cal-500} Calories/day
""");
  print("="*50 +'\n'); 
  }
  else {
    print("="*50 +'\n'); 
  print("""
  Your BMI : Obese
  To Maintain weight = $cal Calories/day
  To gain weight = ${cal+500} Calories/day
  To loss weight = ${cal-500} Calories/day
  """);
  print("="*50 +'\n'); 
  }
  }
  double bmr(){
    if (objPlan.gender == "F" || objPlan.gender == "f"){
    
      double bmrFemale = 447.593 + (9.247 * objPlan.weight) + (3.098 * objPlan.hight) - (4.330 * objPlan.age);
      return bmrFemale;
    }
    else{
      double bmrMale = 88.362 + (13.397 * objPlan.weight) + (4.799 * objPlan.hight) - (5.677 * objPlan.age);
      return bmrMale;
    }
  }
  }
