class UserEntity {
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

  UserEntity({
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


