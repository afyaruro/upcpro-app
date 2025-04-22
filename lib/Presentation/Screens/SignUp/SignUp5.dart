import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:upcpro_app/Presentation/Screens/SignUp/widgets/CustomBtnSignUp.dart';
import 'package:upcpro_app/Presentation/Screens/SignUp/widgets/SelectedImageSignUp.dart';
import 'package:upcpro_app/Presentation/Utils/styles.dart';

// ignore: must_be_immutable
class SignUp5 extends StatefulWidget {
  final String correo;
  final String nombres;
  final String apellidos;
  final String tipoIdentificacion;
  final String identificacion;
  final String genero;
  final String programId;

  SignUp5({
    super.key,
    required this.correo,
    required this.nombres,
    required this.apellidos,
    required this.tipoIdentificacion,
    required this.identificacion,
    required this.genero,
    required this.programId,
  });

  @override
  State<SignUp5> createState() => _SignUp5State();
}

class _SignUp5State extends State<SignUp5> {
  final TextEditingController codeController = TextEditingController();
  var selectedImage;
  var image1;
  var image2;
  var image3;
  var image4;
  var image5;

  ImagePicker picker = ImagePicker();

  _camGaleria(bool op) async {
    XFile? image;
    image =
        op
            ? await picker.pickImage(
              source: ImageSource.camera,
              imageQuality: 50,
            )
            : await picker.pickImage(
              source: ImageSource.gallery,
              imageQuality: 50,
            );

    if (image != null) {
      File file = File(image.path);
      Uint8List bytes = await file.readAsBytes();
      String base64Image = base64Encode(bytes);

      setState(() {
        selectedImage = base64Image;
      });
    }
  }

  void _opcioncamara(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Imagen de Galeria'),
                onTap: () {
                  _camGaleria(false);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Capturar Imagen'),
                onTap: () {
                  _camGaleria(true);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    imageDefault();
  }

  imageDefault() async {
    final ByteData imageData = await rootBundle.load(
      'assets/perfil_default.jpg',
    );

    final ByteData imageData1 = await rootBundle.load(
      'assets/perfil_default2.jpg',
    );

    final ByteData imageData2 = await rootBundle.load(
      'assets/perfil_default3.jpg',
    );

    final ByteData imageData3 = await rootBundle.load(
      'assets/perfil_default4.jpg',
    );

    final ByteData imageData4 = await rootBundle.load(
      'assets/perfil_default5.jpg',
    );

    image1 = base64Encode(imageData.buffer.asUint8List());
    image2 = base64Encode(imageData1.buffer.asUint8List());
    image3 = base64Encode(imageData2.buffer.asUint8List());
    image4 = base64Encode(imageData3.buffer.asUint8List());
    image5 = base64Encode(imageData4.buffer.asUint8List());

    selectedImage = image1;

    setState(() {});
  }

  @override
  void dispose() {
    codeController.dispose();
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
                      child: Text(
                        "Si gustas, puedes subir una imagen de perfil.",
                        style: textStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          colortext: colorText(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),

                    Center(
                      child: Container(
                        width: 120,
                        height: 120,
                        padding:
                            selectedImage == null
                                ? const EdgeInsets.only(top: 10)
                                : const EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(29, 71, 111, 245),
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(75),
                          color: const Color.fromARGB(0, 255, 255, 255),
                        ),
                        child: ClipOval(
                          child:
                              selectedImage == null
                                  ? Image.asset("assets/perfil_default.jpg")
                                  : Image.memory(base64Decode(selectedImage)),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    Center(
                      child: Text(
                        "Selecciona una imagen de perfil",
                        style: textStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          colortext: colorText(),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Center(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            if (image1 != selectedImage)
                              SelectImageSignUp(
                                image: image1,
                                imageAsset: "assets/perfil_default.jpg",
                                function: () {
                                  setState(() {
                                    selectedImage = image1;
                                  });
                                },
                              ),
                            if (image2 != selectedImage)
                              SelectImageSignUp(
                                image: image2,
                                imageAsset: "assets/perfil_default2.jpg",
                                function: () {
                                  setState(() {
                                    selectedImage = image2;
                                  });
                                },
                              ),
                            if (image3 != selectedImage)
                              SelectImageSignUp(
                                image: image3,
                                imageAsset: "assets/perfil_default3.jpg",
                                function: () {
                                  setState(() {
                                    selectedImage = image3;
                                  });
                                },
                              ),
                            if (image4 != selectedImage)
                              SelectImageSignUp(
                                image: image4,
                                imageAsset: "assets/perfil_default4.jpg",
                                function: () {
                                  setState(() {
                                    selectedImage = image4;
                                  });
                                },
                              ),
                            if (image5 != selectedImage)
                              SelectImageSignUp(
                                image: image5,
                                imageAsset: "assets/perfil_default5.jpg",
                                function: () {
                                  setState(() {
                                    selectedImage = image5;
                                  });
                                },
                              ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    Center(
                      child: Text(
                        "o puedes",
                        style: textStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          colortext: colorText(),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),

                        onPressed: () {
                          _opcioncamara(context);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Subir Imagen",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 80),
                  ],
                ),
              ),
            ),
            CustomBtnSignUp(
              function: () {
                Navigator.pushNamed(
                  context,
                  '/signup6',
                  arguments: {
                    'correo': widget.correo,
                    'nombres': widget.nombres,
                    'apellidos': widget.apellidos,
                    'tipoIdentificacion': widget.tipoIdentificacion,
                    'identificacion': widget.identificacion,
                    'genero': widget.genero,
                    'programId': widget.programId,
                    'image': selectedImage,
                  },
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
