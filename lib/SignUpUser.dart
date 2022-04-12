import 'package:flutter/material.dart';

class SignUpUser extends StatefulWidget {
  const SignUpUser({Key? key}) : super(key: key);

  @override
  State<SignUpUser> createState() => _SignUpUserState();
}

class _SignUpUserState extends State<SignUpUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.orange,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.orange,
                  child: Icon(
                    Icons.supervised_user_circle,
                    color: Colors.white,
                    size: 100,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: SizedBox(
                        height: 55,
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: const TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: "Ime i prezieme",
                            prefixIcon: Icon(Icons.people),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: SizedBox(
                        height: 55,
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: const TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: "Grad",
                            prefixIcon: Icon(Icons.people),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: SizedBox(
                        height: 55,
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: const TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: "Ulica i broj",
                            prefixIcon: Icon(Icons.people),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: SizedBox(
                        height: 55,
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: const TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: "Email",
                            prefixIcon: Icon(Icons.people),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: SizedBox(
                        height: 55,
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: const TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: "Sifra",
                            prefixIcon: Icon(Icons.people),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: 50,
                        child: TextButton(
                            onPressed: () => {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Na vasu email adresu je poslat link za izmenu lozinke')))
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
                                )))),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
