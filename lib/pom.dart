import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:moj_majstor/Authentication.dart';
import 'package:moj_majstor/Review.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Profil extends StatefulWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  //UserAuthentication ua = UserAuthentication();
  final double _rating = 3.5;
  double _callButtonSize = 65;
  String imePrezime = 'Ime Prezime';
  String zanimanje = 'Zanimanje';
  String slika = 'https://www.unmc.edu/cihc/_images/faculty/default.jpg';
  final String _number = '0655200509';
  String opis =
      'Nesto o majstoru jfdsuiv ndfjinvifm vioewd vjiervn dokmci virwmcid wnvurwnc iqemn vuie9 vjeui cmqei 9vnmeic xmcewr ivneu9 fci9e wmc iewrn vjifdmv iofe';
  @override
  void initState() {
    super.initState();
  }

  Future<void> _callNumber() async {
    var res = await launch("tel:0655200509"); //callNumber(_number);
    print(res);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserAuthentication>(builder: (context, ua, child) {
      return Scaffold(
        backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: Container(
                  color: const Color.fromRGBO(245, 245, 245, 1),
                  height: 400.0,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 0.0),
                  child: Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 60.0,
                          ),
                          Hero(
                            tag: 'proba',
                            child: CircleAvatar(
                              radius: 70.0,
                              backgroundImage: NetworkImage(ua
                                      .currentUser?.photoURL ??
                                  "https://st.depositphotos.com/2101611/3925/v/600/depositphotos_39258143-stock-illustration-businessman-avatar-profile-picture.jpg"),
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            imePrezime,
                            style: const TextStyle(
                              fontSize: 23.0,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                        ],
                      ),
                      Text(
                        zanimanje,
                        style: const TextStyle(
                            fontSize: 15.0, color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      RatingBarIndicator(
                        rating: _rating,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 30.0,
                        direction: Axis.horizontal,
                      ),
                      Container(
                        width: 140,
                        height: 50,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: TextButton(
                            onPressed: () {
                              ua.signout();
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                              child: const Text(
                                'Prati',
                                style: TextStyle(
                                  fontSize: 20.0,
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

              /* GestureDetector(
                  onTap: () => _callNumber(),
                  child: Container(
                    height: 60.0,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 80.0),
                    decoration: BoxDecoration(
                      color: Colors.green[300],
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Row(
                      children: <Widget>[
                        const SizedBox(
                          width: 20.0,
                        ),
                        const Icon(
                          Icons.phone,
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          _number,
                          style: const TextStyle(
                            fontSize: 22.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ), */

              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 15),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(
                              bottom: 1,
                            ),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 1.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            child: const Text(
                              'Opis',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text(
                              opis,
                              style: const TextStyle(
                                fontSize: 15.0,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Padding(
              //  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              // child: Card(
              //  elevation: 5,
              // ignore: prefer_const_literals_to_create_immutables
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 0),
                child: Container(
                  width: double.infinity,
                  //  alignment: Alignment.topLeft,
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          const Icon(
                            Icons.comment,
                            size: 30.0,
                            color: Colors.grey,
                          ),
                          // ignore: prefer_const_constructors
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                            child: const Text(
                              'Komentari',
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                              // textAlign: TextAlign.left,
                            ),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_right,
                            size: 35.0,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              /*   Row(children: [
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                          'https://www.unmc.edu/cihc/_images/faculty/default.jpg'),
                    ),
                  ),
                  Expanded(
                    // height: 50,
                    // width: MediaQuery.of(context).size.width * 0.70,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        //   expands: true,
                        //controller: username,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 3, color: Colors.blue),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          //labelText: 'Enter Name',
                          hintText: 'Dodaj komentar...',
                          suffixIcon: Icon(Icons.arrow_forward),
                          hintMaxLines: 5,

                          // prefixIcon: Icon(Icons.people),
                        ),
                      ),
                    ),
                  ),
                ]),*/
              //  ),
              //  ),

              /* Padding(
                  padding: const EdgeInsets.fromLTRB(20, 25, 25, 0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(
                      bottom: 1,
                    ),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 2.0,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    child: const Text(
                      'Komentari',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Row(children: [
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                          'https://www.unmc.edu/cihc/_images/faculty/default.jpg'),
                    ),
                  ),
                  Expanded(
                    // height: 50,
                    // width: MediaQuery.of(context).size.width * 0.70,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(5.0, 20.0, 10.0, 0.0),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        //   expands: true,
                        //controller: username,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 3, color: Colors.blue),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          //labelText: 'Enter Name',
                          hintText: 'Dodaj komentar...',
                          suffixIcon: Icon(Icons.arrow_forward),
                          hintMaxLines: 5,

                          // prefixIcon: Icon(Icons.people),
                        ),
                      ),
                    ),
                  ),
                ]),
                Review(
                    profileImage:
                        "https://www.unmc.edu/cihc/_images/faculty/default.jpg",
                    rate: 2.5,
                    fullName: 'Marija',
                    commentText:
                        "afdsg afdsg sjvirej dfvnrekn dkfjri dfhuefhu dfjhozjhb ehfueh rufh48 zou76ohjb"),
                Review(
                    profileImage:
                        "https://www.unmc.edu/cihc/_images/faculty/default.jpg",
                    rate: 3.5,
                    fullName: "Marija",
                    commentText:
                        "afdsg sjvirej dfvnrekn dkfjri dfhuefhu dfjhozjhb ehfueh rufh48 zou76ohjb"), */
            ],
          ),
        ),
        floatingActionButton: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.fastOutSlowIn,
          height: _callButtonSize,
          width: _callButtonSize,
          child: SizedBox(
            //height: 65.0,
            // width: 65.0,
            child: FittedBox(
              child: FloatingActionButton(
                backgroundColor: Colors.green[300],
                child: const Icon(Icons.phone),
                onPressed: () {
                  setState(() {
                    _callButtonSize = 500;
                  });

                  _callNumber().then((value) {
                    //  _callButtonSize = 65;
                  });
                },
              ),
            ),
          ),
        ),
        /* floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(
              Icons.phone,
              color: Colors.white,
            ),
            backgroundColor: Colors.green[300],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,*/
      );
    });
  }
}
