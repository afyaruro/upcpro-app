import 'package:upcpro_app/Domain/Entities/User/UserEntity.dart';

class UserModel {

  final String id;
  final String mail;
  final String image;
  final String firstName;
  final String lastName;
  final String identification;
  final String typeIdentification;
  final String gender;
  final String typeUser;
  final String program;

  UserModel({
    required this.id,
    required this.mail,
    required this.image,
    required this.firstName,
    required this.lastName,
    required this.identification,
    required this.typeIdentification,
    required this.gender,
    required this.typeUser,
    required this.program,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String? ?? "",
      mail: json['mail'] as String? ?? "",
      image: json['image'] as String? ?? "",
      firstName: json['firstName'] as String? ?? "",
      lastName: json['lastName'] as String? ?? "",
      identification: json['identification'] as String? ?? "",
      typeIdentification: json['typeIdentification'] as String? ?? "",
      gender: json['gender'] as String? ?? "",
      typeUser: json['typeUser'] as String? ?? "",
      program: (json['program']?['id'] as String?) ?? "",
    );
  }

   factory UserModel.fromJsonHive(Map<dynamic, dynamic> json) {
    return UserModel(
      id: json['id'] as String? ?? "",
      mail: json['mail'] as String? ?? "",
      image: json['image'] as String? ?? "",
      firstName: json['firstName'] as String? ?? "",
      lastName: json['lastName'] as String? ?? "",
      identification: json['identification'] as String? ?? "",
      typeIdentification: json['typeIdentification'] as String? ?? "",
      gender: json['gender'] as String? ?? "",
      typeUser: json['typeUser'] as String? ?? "",
      program: (json['program'] as String?) ?? "",
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      mail: mail,
      image: image,
      firstName: firstName,
      lastName: lastName,
      identification: identification,
      typeIdentification: typeIdentification,
      gender: gender,
      typeUser: typeUser,
      program: program,
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      "id": id,
      "mail": mail,
      "image": image,
      "firstName": firstName,
      "lastName": lastName,
      "identification": identification,
      "typeIdentification": typeIdentification,
      "gender": gender,
      "typeUser": typeUser,
      "program": program,
    };
  }

  Map<dynamic, dynamic> toJsonDio(String password) {
    return {
      "mail": mail,
      "image": image,
      "firstName": firstName,
      "lastName": lastName,
      "identification": identification,
      "typeIdentification": typeIdentification,
      "gender": gender,
      "idProgram": program,
      "password": password,
    };
  }
}
