import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:moj_majstor/Authentication.dart';

class SignUpUser extends StatefulWidget {
  const SignUpUser({Key? key}) : super(key: key);

  @override
  State<SignUpUser> createState() => _SignUpUserState();
}

class _SignUpUserState extends State<SignUpUser> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool show_password = true;
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final citycontroller = TextEditingController();
  final streetaddresscontroller = TextEditingController();
  UserAuthentication ua = UserAuthentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color.fromRGBO(20, 33, 61, 1),
            pinned: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Registracija'),
              background: Container(
                color: Colors.orange,
                child: const Icon(
                  Icons.supervised_user_circle,
                  color: Colors.white,
                  size: 100,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.orange,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Form(
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
                            labelText: "Ime i prezieme",
                            prefixIcon: Icon(Icons.people),
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
                          controller: citycontroller,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: "Grad",
                            prefixIcon: Icon(Icons.people),
                          ),
                          validator: MultiValidator(
                            [
                              RequiredValidator(errorText: "Unesite grad"),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: TextFormField(
                          controller: streetaddresscontroller,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: "Ulica i broj",
                            prefixIcon: Icon(Icons.people),
                          ),
                          // validator: MultiValidator(
                          // [
                          //RequiredValidator(errorText: "Unesite ulicu i broj"),
                          // ],
                          //   ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailcontroller,
                          decoration: const InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: "Email",
                            prefixIcon: Icon(Icons.people),
                          ),
                          validator: MultiValidator(
                            [
                              RequiredValidator(errorText: "Unsite email"),
                              EmailValidator(
                                  errorText: "Unesite validan email"),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: TextFormField(
                          controller: passwordcontroller,
                          obscureText: show_password,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () => {
                                      setState(
                                        () => {
                                          show_password = !show_password,
                                        },
                                      )
                                    },
                                icon: Icon(Icons.remove_red_eye)),
                            fillColor: Colors.white,
                            filled: true,
                            labelText: "Password",
                            prefixIcon: Icon(Icons.people),
                          ),
                          validator: MultiValidator(
                            [
                              //RequiredValidator(errorText: ""),
                              MinLengthValidator(8,
                                  errorText:
                                      "Lozinka mora imati najmanje 8 karaktera"),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: 50,
                          child: TextButton(
                            onPressed: () async {
                              if (formkey.currentState?.validate() == true) {
                                String result = await ua.signUp(
                                    email: emailcontroller.text,
                                    password: passwordcontroller.text,
                                    fullName: namecontroller.text,
                                    city: citycontroller.text,
                                    streetAddress:
                                        streetaddresscontroller.text);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(result)));
                              }
                            },
                            child: const Text(
                              'Kreirej nalog',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "century",
                                  fontSize: 25),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(255, 152, 0, 1)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
