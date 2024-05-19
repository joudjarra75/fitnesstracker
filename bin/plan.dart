import 'dart:math';
import 'user_class.dart';

class Plan {
 User objPlan ;
 Plan(this.objPlan);
 

  void bmi(){
    double w = objPlan.weight;
    double h = objPlan.hight;
    double bmi = w/pow(h, 2);
    if (bmi <= 18){
    print("\nYour BMI : Underweight");
    
  }
  else if (bmi > 18.5 && bmi < 24.9){
    print("\nYour BMI : Normal");
    
  }
  else if (bmi > 25 && bmi < 39.9){
    print("\nYour BMI : Overweight");
    
  }
  else {
    print("\nYour BMI : Obese");
  }
  }
 void bmr(){
  if (objPlan.gender == "F" || objPlan.gender == "f"){
   
    
    double bmrFemale = 447.593 + (9.247 * objPlan.weight) + (3.098 * objPlan.hight) - (4.330 * objPlan.age);
  
    print(bmrFemale);

  }
   else{
    double bmrMale = 88.362 + (13.397 * objPlan.weight) + (4.799 * objPlan.hight) - (5.677 * objPlan.age);
    print(bmrMale);
   }
 }
 }
