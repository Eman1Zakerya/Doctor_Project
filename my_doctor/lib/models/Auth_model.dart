


class UserData{
   int? id;
   String? name;
   String? password;
   String? email;
   String? country;
   String? city;
   String? street;
   String? zipCode;
   String? gender;
   String? maritalState;
   String? brithdate;
   String? phone;
   String? image;
   int? age;
   String? token;


  UserData({this.id,this.name,this.email,
    this.image,this.phone,this.age,this.brithdate,
    this.token,this.city,this.country,this.gender,
    this.maritalState,this.password,this.street,this.zipCode
  });

  UserData.fromJson(Map<String,dynamic>json)
  {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    token = json['token'];
    age = json['age'];
    brithdate = json['brithdate'];
    city = json['city'];
    country = json['country'];
    gender = json['gender'];
    maritalState = json['maritalState'];
    password = json['password'];
    street = json['street'];
    zipCode = json['zipCode'];

  }


}


class LoginModel{
  bool? status;
  String? message;
  UserData? data;

  LoginModel.fromJson(Map<String,dynamic>json)
  {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data'] ):null;


  }

}


