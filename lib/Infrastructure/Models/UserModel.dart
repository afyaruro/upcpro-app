import 'package:upcpro_app/Domain/Entities/UserEntity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.mail,
    required super.image,
    required super.firstName,
    required super.lastName,
    required super.identification,
    required super.typeIdentification,
    required super.gender,
    required super.typeUser,
    required super.program,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String? ?? "No existe",
      mail: json['mail'] as String? ?? "No existe",
      image: json['image'] as String? ?? "No existe",
      firstName: json['firstName'] as String? ?? "No existe",
      lastName: json['lastName'] as String? ?? "No existe",
      identification: json['identification'] as String? ?? "No existe",
      typeIdentification: json['typeIdentification'] as String? ?? "No existe",
      gender: json['gender'] as String? ?? "No existe",
      typeUser: json['typeUser'] as String? ?? "No existe",
      program: (json['program']?['id'] as String?) ?? "No existe",
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
}


// "id": "67f4537fce2c4621167cf717",
//     "mail": "ADMIN@ADMIN.COM",
//     "image": null,
//     "firstName": null,
//     "lastName": null,
//     "identification": null,
//     "typeIdentification": null,
//     "gender": null,
//     "typeUser": "admin",
//     "program": null