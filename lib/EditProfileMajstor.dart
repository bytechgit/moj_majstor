// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditProfileMajstor extends StatefulWidget {
  const EditProfileMajstor({Key? key}) : super(key: key);

  @override
  State<EditProfileMajstor> createState() => _EditProfileMajstorState();
}

class _EditProfileMajstorState extends State<EditProfileMajstor> {
  late File imageFile;
  String profilePhoto = 'https://www.unmc.edu/cihc/_images/faculty/default.jpg';
  String nameSurname = "Ime i prezime";
  String occupation = "Zanimanje";
  String about = "Opis";
  String phoneNumber = "Broj telefona";
  String address = "Adresa";

  final namecontroller = TextEditingController();
  final occupationcontroller = TextEditingController();
  final aboutcontroller = TextEditingController();
  final phoneNumbercontroller = TextEditingController();

  get formkey => null;
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 100, 120, 254),
        title: const Text(
          'Izmeni Profil',
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 50.0,
                ),
                GestureDetector(
                  onTap: () {
                    _getFromGallery();
                  },
                  child: CircleAvatar(
                    radius: 70.0,
                    backgroundImage: NetworkImage(profilePhoto),
                    child: Stack(children: const [
                      Positioned(
                        bottom: 5,
                        right: 10,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.photo_camera,
                              color: Color.fromARGB(255, 100, 120, 254),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
                const SizedBox(
                  height: 7.0,
                ),
                InkWell(
                  onTap: () => _getFromGallery(),
                  child: const Text(
                    "Promenite sliku na profilu",
                    style: TextStyle(color: Color.fromARGB(255, 100, 120, 254)),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: TextFormField(
                          controller: namecontroller,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: nameSurname,
                            labelStyle: const TextStyle(color: Colors.black54),
                            prefixIcon: const Icon(Icons.person),
                          ),
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                  errorText: "Unesite ime i prezime"),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: TextFormField(
                          controller: occupationcontroller,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: occupation,
                            labelStyle: const TextStyle(color: Colors.black54),
                            prefixIcon: const Icon(Icons.engineering),
                          ),
                          validator: MultiValidator(
                            [
                              RequiredValidator(errorText: "Unesite zanimanje"),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: TextFormField(
                          controller: phoneNumbercontroller,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: phoneNumber,
                            labelStyle: const TextStyle(color: Colors.black54),
                            prefixIcon: const Icon(Icons.phone),
                          ),
                          validator: MultiValidator(
                            [
                              RequiredValidator(
                                  errorText: "Unesite broj telefona"),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: TextFormField(
                          controller: aboutcontroller,
                          maxLines: 3,
                          minLines: 1,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: about,
                            labelStyle: const TextStyle(color: Colors.black54),
                            prefixIcon: const Icon(Icons.description),
                          ),
                          validator: MultiValidator(
                            [
                              RequiredValidator(errorText: "Unesite opis"),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Container(
                          height: 65,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                width: 1.0,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.white),
                            onPressed: () {},
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.pin_drop,
                                  color: Colors.black45,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    address,
                                    style: const TextStyle(
                                      color: Colors.black45,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Sačuvaj izmene',
                      style: TextStyle(fontSize: 17),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 100, 120, 254),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
}
