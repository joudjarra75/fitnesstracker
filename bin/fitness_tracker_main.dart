//import 'package:fitnesstracker/fitnesstracker.dart' as fitnesstracker;
import 'dailytracker_class.dart';
import 'functions.dart';
import 'dart:io';

import 'user_class.dart';
void main() {
  // welcoming();
  // userChoice();
  User u = User("j", "8", "F", 80, 178, 28);
  Tracking t = Tracking(u);
  
  t.checkDays();
}