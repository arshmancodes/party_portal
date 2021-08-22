class AuthModel {

  String? uid;
  String? email;
  String? name;
  int? age;
  int? phoneNumber;


  AuthModel({this.uid, this.email, this.name, this.age, this.phoneNumber});

  AuthModel.fromJson(Map<String, dynamic> json){
      uid = json['uid'];
      email = json['email'];
      name = json['name'];
      age = json['age'];
      phoneNumber = json['phoneNumber'];
  }

  // Map<String, dynamic> toJson() => {'id':id, 'name':name };
}