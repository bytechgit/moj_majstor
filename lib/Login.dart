import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:moj_majstor/ForgotPassword.dart';
import 'package:moj_majstor/SignUp.dart';
import 'Authentication.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  UserAuthentication ua = UserAuthentication();
  UserAuthentication ua1 = UserAuthentication();
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              ClipPath(
                clipper: WaveClipperOne(),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(255, 152, 0, 1),
                        Color.fromRGBO(255, 152, 0, 0.5),
                      ],
                    ),
                  ),
                  height: 250,
                  // color: const Color.fromRGBO(255, 152, 0, 1),
                  child: Stack(
                    children: [
                      const Center(
                        child: Icon(
                          Icons.home,
                          color: Colors.white,
                          size: 80,
                        ),
                      ),
                      IconButton(
                          onPressed: () => {Navigator.pop(context)},
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 35,
                          ))
                    ],
                  ),
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
                  labelText: "Username",
                  prefixIcon: Icon(Icons.people),
                )),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 55,
                width: MediaQuery.of(context).size.width * 0.85,
                child: const TextField(
                  //controller: username,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: "Password",
                    prefixIcon: Icon(Icons.people),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 50,
                child: TextButton(
                    onPressed: () => {
                          ua.Login(
                              email: 'pr123@gmail.com', password: '1233456'),
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('greska')))
                        },
                    child: const Text(
                      'Login',
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
              /* ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: CachedNetworkImage(
                  width: 50.0,
                  imageUrl: Provider.of<UserAuthentication>(context).getImage(),
                  placeholder: (context, url) => new CircularProgressIndicator(),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                ),
              ),

              */
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                child: RichText(
                  text: TextSpan(
                    //style: defaultStyle,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'FORGOT PASSWORD ?',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const ForgotPassword();
                              }),
                            );
                          },
                        style: const TextStyle(
                            color: Colors.blue, fontFamily: 'Century'),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 20, 0),
                    child: InkWell(
                      child: const Image(
                        width: 50,
                        image: AssetImage('assets/img/google.png'),
                      ),
                      onTap: () async {
                        String? p = await ua.signInwithGoogle();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(p ?? 'Uspesno ste prijavljeni!')));
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                    child: InkWell(
                      child: const Image(
                        width: 50,
                        image: AssetImage('assets/img/facebook.png'),
                      ),
                      onTap: () {
                        ua.signInwithFacebook();
                      },
                    ),
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: RichText(
                  text: TextSpan(
                    //style: defaultStyle,
                    children: <TextSpan>[
                      const TextSpan(
                        text: 'New User?  ',
                        style: TextStyle(color: Colors.blue),
                      ),
                      TextSpan(
                        text: 'Sign Up',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const SignIn();
                              }),
                            );
                          },
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
