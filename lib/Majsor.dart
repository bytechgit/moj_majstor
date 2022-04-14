import 'package:flutter/material.dart';

class Majstor extends StatefulWidget {
  final String ime;
  final String slika;
  final String ocena;
  const Majstor(
      {Key? key, required this.ime, required this.ocena, required this.slika})
      : super(key: key);

  @override
  State<Majstor> createState() => _MajstorState();
}

class _MajstorState extends State<Majstor> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Container(
          margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
          //color: Colors.red,
          // shape: RoundedRectangleBorder(
          //  borderRadius: BorderRadius.circular(20.0),
          //),
          //  shadowColor: Colors.black,
          // elevation: 10,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(255, 161, 43, 1),
                Color.fromRGBO(255, 96, 26, 0.9),
              ],
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 14, 10, 10),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(widget.slika),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 5.0),
                      child: FittedBox(
                        child: Text(
                          widget.ime,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Century'),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5.0, left: 8),
                      child: FittedBox(
                        child: Text(
                          'zanimanje: Elektricar',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              //fontWeight: FontWeight.bold,
                              fontFamily: 'Century'),
                        ),
                      ),
                    ),
                    //Text("data")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 5, right: 10),
                      child: Text(
                        'ocena',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Century'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0, right: 10),
                      child: Text(
                        widget.ocena,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Century'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
