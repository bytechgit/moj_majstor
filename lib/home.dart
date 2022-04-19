import 'package:flutter/material.dart';
import 'package:moj_majstor/InsertLocation.dart';
import 'package:moj_majstor/InternetConnection.dart';
import 'package:moj_majstor/Login.dart';
import 'package:moj_majstor/SignUp.dart';
import 'package:moj_majstor/proba.dart';
import 'package:overlay_support/overlay_support.dart';
import 'Majsor.dart';
import 'SignUpUser.dart';
import 'homeHeaderDelegate.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final InternetConnection _connection = InternetConnection();
  int _selectedIndex = 0;
  Widget current = proba();
  List<Widget> screens = [proba(), Login(), SignUpUser(), InsertLocation()];
  final PageController pageController = PageController();
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      current = screens[index];
    });
  }

  var maj = [
    {
      'ime': 'Milan Raškovic',
      'slika': 'assets/img/radnik.jpg',
      'ocena': '10',
    },
    {'ime': 'Milan Raškovic', 'slika': 'assets/img/radnik.jpg', 'ocena': '10'},
    {
      'ime': 'Zeljko Stepanovic',
      'slika': 'assets/img/radnik.jpg',
      'ocena': '10',
    },
    {
      'ime': 'Lazar Velimirović',
      'slika': 'assets/img/radnik.jpg',
      'ocena': '10',
    },
    {
      'ime': 'Aleksandar Mijujkić',
      'slika': 'assets/img/radnik.jpg',
      'ocena': '10',
    },
    {'ime': 'Ivan Stepanovic', 'slika': 'assets/img/radnik.jpg', 'ocena': '10'},
    {
      'ime': 'Igor Juricic',
      'slika': 'assets/img/radnik.jpg',
      'ocena': '10',
    },
    {
      'ime': 'Александар Николић',
      'slika': 'assets/img/radnik.jpg',
      'ocena': '10',
    },
  ];
  double _height = 100;
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.call),
                label: 'Pocetna',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.camera),
                label: 'Pretraga',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.camera),
                label: 'Korisnik',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.camera),
                label: 'Profil',
              ),
            ],
          ),
          body: current,
        ),
      ),
    );
  }
}
