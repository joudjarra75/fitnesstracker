import 'dart:math';
import 'user_class.dart';

class Plan {
 User objPlan ;
 Plan(this.objPlan); // constructor
 
 
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

  double bmr(){ // function
    if (objPlan.gender == "F" || objPlan.gender == "f"){
    
      double bmrFemale = 447.593 + (9.247 * objPlan.weight) + (3.098 * objPlan.hight) - (4.330 * objPlan.age);
      return bmrFemale;
    }
    else{
      double bmrMale = 88.362 + (13.397 * objPlan.weight) + (4.799 * objPlan.hight) - (5.677 * objPlan.age);
      return bmrMale;
    }
  }

   String bmiReturnFun(){
    double w = objPlan.weight;
    double h = objPlan.hight/100;
    double bmi = w/pow(h, 2);
    
     if (bmi <= 18){
      return 'Underweight';
     }
     else if(bmi > 18.5 && bmi < 24.9){
      return 'Normal';
     }
     else if (bmi > 25 && bmi < 39.9){
      return 'Overweight';
     }
     else{
      return 'Obese';
     }

 }

void plan(){
  String value = bmiReturnFun();
  double cal = bmr();

  if (value == "Underweight"){
  print("""_____________________________________________________________________
By referring to your body mass index (BMI)
we advise you to gain weight to reach the ideal weight 
the appropriate calories for you = ${cal+500} calories per day.
_____________________________________________________________________""");
  }

else if (value == "Normal"){
  print("""_____________________________________________________________________
By referring to your body mass index (BMI)
we advise you to maintain your weight 
the appropriate calories for you = $cal calories per day.
_____________________________________________________________________""");

}

else if(value == "Overweight"){
  print("""_____________________________________________________________________
By referring to your body mass index (BMI)
we advise you to lose weight to reach the ideal weight 
the appropriate calories for you = ${cal-300} calories per day.
_____________________________________________________________________""");
}
else{
  print("""_____________________________________________________________________
By referring to your body mass index (BMI)
we advise you to lose weight to reach the ideal weight 
the appropriate calories for you = ${cal-500} calories per day.
_____________________________________________________________________""");
 }
}
}
 
  
