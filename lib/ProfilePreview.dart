import 'package:flutter/material.dart';

class ProfilePreview extends StatefulWidget {
  const ProfilePreview({Key? key}) : super(key: key);

  @override
  State<ProfilePreview> createState() => _ProfilePreviewState();
}

class _ProfilePreviewState extends State<ProfilePreview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350.0,
      color: Colors.white,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 10),
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 203, 202, 202),
              radius: 55,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/img/radnik.jpg'),
              ),
            ),
          ),
          const Text(
            'Sasa Stojliljkovic',
            style: TextStyle(
                color: Colors.orange,
                fontSize: 25,
                fontWeight: FontWeight.w500),
          ),
          Text(
            'Elektricar',
            style: TextStyle(
                color: Color.fromRGBO(128, 128, 128, 1),
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Poslovi',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(128, 128, 128, 1),
                        ),
                      ),
                      Text(
                        '10',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Pracenja',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(128, 128, 128, 1),
                        ),
                      ),
                      Text(
                        '10',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Ocena',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(128, 128, 128, 1),
                        ),
                      ),
                      Text(
                        '10',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () => {},
            child: SizedBox(
              child: Center(
                child: Text(
                  'Vidi profil',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              width: MediaQuery.of(context).size.width * 0.6,
              height: 30,
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromRGBO(255, 152, 0, 1)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
