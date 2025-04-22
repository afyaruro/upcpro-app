import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:upcpro_app/Application/Stores/Generic/genericStore.dart';
import 'package:upcpro_app/Domain/Entities/Faculty/FacultyEntity.dart';
import 'package:upcpro_app/Domain/Entities/Program/ProgramEntity.dart';
import 'package:upcpro_app/Presentation/Screens/SignUp/functions/SignUp4Function.dart';
import 'package:upcpro_app/Presentation/Screens/SignUp/widgets/CustomBtnSignUp.dart';
import 'package:upcpro_app/Presentation/Screens/SignUp/widgets/DropdownBtnFaculty.dart';
import 'package:upcpro_app/Presentation/Screens/SignUp/widgets/DropdownBtnProgram.dart';
import 'package:upcpro_app/Presentation/Utils/styles.dart';

// ignore: must_be_immutable
class SignUp4 extends StatefulWidget {
  final String correo;
  final String nombres;
  final String apellidos;
  final String tipoIdentificacion;
  final String identificacion;
  final String genero;

  SignUp4({
    super.key,
    required this.correo,
    required this.nombres,
    required this.apellidos,
    required this.tipoIdentificacion,
    required this.identificacion,
    required this.genero,
  });

  @override
  State<SignUp4> createState() => _SignUp4State();
}

class _SignUp4State extends State<SignUp4> {
  final storeGeneric = GetIt.instance<StoreGeneric>();

  List<FacultyEntity> faculties = [
    FacultyEntity(
      id: "",
      name: "Selecciona una facultad",
      dateUpdate: DateTime.now(),
    ),
  ];

  FacultyEntity selectedFaculty = FacultyEntity(
    id: "",
    name: "Selecciona una facultad",
    dateUpdate: DateTime.now(),
  );

  List<ProgramEntity> programs = [];

  ProgramEntity? selectedProgram;

  @override
  void initState() {
    super.initState();
    faculties.addAll(storeGeneric.faculties);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset('assets/upcpro.png', height: 80, width: 80),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: RichText(
                        text: TextSpan(
                          style: textStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            colortext: colorText(),
                          ),
                          children: [
                            TextSpan(text: "Por favor selecciona la "),
                            TextSpan(
                              text: "Facultad",
                              style: textStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                colortext: Colors.lime,
                              ),
                            ),
                            TextSpan(text: " y "),
                            TextSpan(
                              text: "Programa",
                              style: textStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                colortext: Colors.lime,
                              ),
                            ),
                            TextSpan(text: " al que perteneces"),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      child: DropdownBtnFaculty(
                        icon: Icons.apartment_outlined,
                        context: context,
                        hintText: "Facultad",
                        items: faculties,
                        selectedItem: selectedFaculty,
                        onChanged: (value) {
                          setState(() {
                            selectedFaculty = value!;

                            programs = [
                              ProgramEntity(
                                id: "",
                                name: "Selecciona un programa",
                                dateUpdate: DateTime.now(),
                                idFaculty: "",
                              ),
                            ];

                            for (var program in storeGeneric.programs) {
                              if (program.idFaculty == selectedFaculty.id) {
                                programs.add(program);
                              }
                            }

                            if (programs.isNotEmpty) {
                              selectedProgram = programs.first;
                            }
                            setState(() {});
                          });
                        },
                      ),
                    ),

                    programs.isNotEmpty
                        ? Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 5,
                          ),
                          child: DropdownBtnProgram(
                            icon: Icons.school_outlined,
                            context: context,
                            hintText: "Programa",
                            items: programs,
                            selectedItem: selectedProgram!,
                            onChanged: (value) {
                              setState(() {
                                selectedProgram = value!;
                              });
                            },
                          ),
                        )
                        : Container(),

                    const SizedBox(height: 20),

                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
            CustomBtnSignUp(
              function: () {
                SignUp4Function.validarProgram(
                  nombres: widget.nombres,
                  apellidos: widget.apellidos,
                  tipoDocumento: widget.tipoIdentificacion,
                  numeroDocumento: widget.identificacion,
                  correo: widget.correo,
                  genero: widget.genero,
                  context: context,
                  faculty: selectedFaculty,
                  program: selectedProgram,
                );
              },
              name: "Siguiente",
            ),
          ],
        ),
      ),
    );
  }
}
