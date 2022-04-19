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
    return SizedBox(
      height: 130,
      child: Container(
        margin: const EdgeInsets.only(bottom: 0, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Spacer(),
                InkWell(
                  onTap: () => {
                    showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return ProfilePreview();
                        })
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 14, 10, 10),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(widget.slika),
                    ),
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
                                color: Colors.black,
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
                                color: Colors.black,
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
                              color: Colors.black,
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
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Century'),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Divider(
              height: 10,
              thickness: 5,
            )
          ],
        ),
      ),
    );
  }
}
