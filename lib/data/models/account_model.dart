import 'package:flutter/material.dart';

class LoginModel {
  int ?status;
  UserModel ?account;
  LoginModel({
    this.status,
    this.account
});
  LoginModel.formJson(Map <String,dynamic>json){
    status=json['status'];
    account=json['account'] !=null ? UserModel.formJson(json['account']):null;

  }
}

class UserModel{
  int ?id;
  String ?name;
  String ?email;
  String ?password;
  String ?phone;
  String ?update_at;
  String ?create_at;
  UserModel.formJson(Map <String,dynamic>json){
    id=json['id'];
    name=json['name'];
    email=json['email'];
    phone=json['phone'];
    password=json['password'];
    update_at=json['update_at'];
    create_at=json['create_at'];
  }
}

class RegisterModel {
  String ?name;
  String ?email;
  String ?password;
  String ?phone;

  RegisterModel.formJson(Map <String, dynamic>json){
    name = json['name'];
    email = json['email'];
    password = json['password'];
    password = json['password'];
  }
}