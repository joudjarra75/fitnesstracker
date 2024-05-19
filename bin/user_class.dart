class User{

  String _userName;
  String _password;
  String  _gender;
  double _weight;
  double _height;
  int _age;

  set user (String u) => _userName = u;
  String get user => _userName;

  set pass (String p) => _password = p;
  String get pass => _password;

  set gender (String g) => _gender = g;
  String get gender => _gender;

  set weight (double w) => _weight = w;
  double get weight => _weight;

  set hight (double h) => _height = h;
  double get hight => _height;

  set age (int a) => _age = a;
  int get age => _age;

  User(this._userName,this._password,this._gender,this._weight,this._height,this._age);
  
}