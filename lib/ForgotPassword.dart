import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //  color: Colors.red,
        body: SafeArea(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Text(
                  'Zaboravili ste lozinku?',
                  style: TextStyle(
                      fontSize: 30, color: Color.fromRGBO(255, 152, 0, 1)),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: Text(
                  'Unesite email adresu povezanu sa vasim nalogom',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 55,
                width: MediaQuery.of(context).size.width * 0.85,
                child: const TextField(

                    //controller: username,

                    decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: "Email",
                  prefixIcon: Icon(Icons.people),
                )),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 50,
                child: TextButton(
                    onPressed: () => {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  'Na vasu email adresu je poslat link za izmenu lozinke')))
                        },
                    child: const Text(
                      'Resetuj lozinku',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "century",
                          fontSize: 25),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(255, 152, 0, 1)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        )))),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
