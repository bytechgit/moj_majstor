import 'package:flutter/material.dart';
import 'package:moj_majstor/ProfilePreview.dart';

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
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 5, bottom: 10, left: 10, right: 10),
          child: InkWell(
            onTap: () => {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return ProfilePreview();
                },
              )
            },
            child: SizedBox(
              height: 70,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, top: 5),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(widget.slika),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text(
                          widget.ime,
                          style: const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Century'),
                        ),
                      ),
                      const FittedBox(
                        child: Text(
                          'zanimanje: Elektricar',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              //fontWeight: FontWeight.bold,
                              fontFamily: 'Century'),
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'ocena',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Century'),
                      ),
                      Text(
                        widget.ocena,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Century'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Divider(
          thickness: 2,
          color: Color.fromARGB(255, 240, 240, 240),
        )
      ],
    );
  }
}
