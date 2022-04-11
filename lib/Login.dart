import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:cached_network_image/cached_network_image.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        children: [
          ClipPath(
            clipper: WaveClipperOne(),
            child: Container(
              height: 200,
              color: Colors.blue[800],
              child: const Center(
                  child: Icon(
                Icons.home,
                color: Colors.white,
                size: 60,
              )),
            ),
          ),
          SizedBox(
            height: 55,
            width: MediaQuery.of(context).size.width * 0.75,
            child: const TextField(

                //controller: username,
                decoration: InputDecoration(
              labelText: "Username",
              prefixIcon: Icon(Icons.people),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
            )),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 55,
            width: MediaQuery.of(context).size.width * 0.75,
            child: const TextField(
                //controller: username,
                decoration: InputDecoration(
              labelText: "Password",
              prefixIcon: Icon(Icons.people),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
            )),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            height: 50,
            child: TextButton(
                onPressed: () => {
                      ua.Login(email: 'pr123@gmail.com', password: '1233456'),
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('greska')))
                    },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    )))),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: CachedNetworkImage(
              width: 50.0,
              imageUrl: Provider.of<UserAuthentication>(context).getImage(),
              placeholder: (context, url) => new CircularProgressIndicator(),
              errorWidget: (context, url, error) => new Icon(Icons.error),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: IconButton(
                  icon: const Image(
                    width: 30,
                    image: AssetImage('assets/img/google.png'),
                  ),
                  onPressed: () async {
                    String? p = await ua.signInwithGoogle();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(p ?? 'Uspesno ste prijavljeni!')));
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: IconButton(
                  icon: const Image(
                    width: 30,
                    image: AssetImage('assets/img/facebook.png'),
                  ),
                  onPressed: () {
                    ua.signout();
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
