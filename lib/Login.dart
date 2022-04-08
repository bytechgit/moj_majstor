import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

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
                  onPressed: () => {},
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
            Row(
              children: [],
            )
          ],
        ));
  }
}
