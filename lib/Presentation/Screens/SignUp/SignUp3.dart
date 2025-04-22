import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:upcpro_app/Application/Stores/Generic/genericStore.dart';
import 'package:upcpro_app/Domain/Entities/Faculty/FacultyEntity.dart';
import 'package:upcpro_app/Presentation/ComponentBase/WidgetBase.dart';
import 'package:upcpro_app/Presentation/Screens/SignUp/functions/SignUp3Function.dart';
import 'package:upcpro_app/Presentation/Screens/SignUp/widgets/BuildTextFieldSignUp.dart';
import 'package:upcpro_app/Presentation/Screens/SignUp/widgets/CustomBtnSignUp.dart';
import 'package:upcpro_app/Presentation/Screens/SignUp/widgets/DropdownBtn.dart';
import 'package:upcpro_app/Presentation/Utils/styles.dart';

// ignore: must_be_immutable
class SignUp3 extends StatefulWidget {
  final String correo;
  SignUp3({super.key, required this.correo});

  @override
  State<SignUp3> createState() => _SignUp3State();
}

class _SignUp3State extends State<SignUp3> {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();
  final TextEditingController identificacionController =
      TextEditingController();

  String selectedIdentificacion = "Tipo de identificación";
  String selectedGender = "Género";

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

  @override
  void initState() {
    super.initState();
    faculties.addAll(storeGeneric.faculties);
  }

  @override
  void dispose() {
    nombreController.dispose();
    apellidoController.dispose();
    identificacionController.dispose();
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
      body: WidgetBase(
        child: SafeArea(
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
                        child: Text(
                          "Necesitamos que proporciones unos datos adicionales",
                          style: textStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            colortext: colorText(),
                          ),
                        ),
                      ),
        
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        child: BuildTextFieldSignUp(
                          hintText: "Nombres",
                          icon: Icons.person_outlined,
                          controller: nombreController,
                        ),
                      ),
        
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        child: BuildTextFieldSignUp(
                          hintText: "Apellidos",
                          icon: Icons.person_outline,
                          controller: apellidoController,
                        ),
                      ),
        
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        child: DropdownBtn(
                          icon: Icons.badge_outlined,
                          context: context,
                          hintText: "Tipo de identificación",
                          items: [
                            "Tipo de identificación",
                            "Cédula de ciudadanía",
                            "Tarjeta de Identidad",
                            "Pasaporte",
                          ],
                          selectedItem: selectedIdentificacion,
                          onChanged: (value) {
                            setState(() {
                              selectedIdentificacion = value!;
                            });
                          },
                        ),
                      ),
        
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        child: BuildTextFieldSignUp(
                          hintText: "Número de identificación",
                          icon: Icons.badge_outlined,
                          controller: identificacionController,
                        ),
                      ),
        
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        child: DropdownBtn(
                          icon: Icons.transgender,
                          context: context,
                          hintText: "Género",
                          items: ["Género", "Masculino", "Femenino", "Otro"],
                          selectedItem: selectedGender,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value!;
                            });
                          },
                        ),
                      ),
        
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
              CustomBtnSignUp(
                function: () {
                  SignUp3Function.validarInfo(
                    nombres: nombreController.text.trim(),
                    apellidos: apellidoController.text.trim(),
                    tipoDocumento: selectedIdentificacion,
                    numeroDocumento: identificacionController.text.trim(),
                    correo: widget.correo,
                    genero: selectedGender,
                    context: context,
                  );
                },
                name: "Siguiente",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
