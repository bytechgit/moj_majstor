import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:moj_majstor/models/ReviewModel.dart';

class Review extends StatelessWidget {
  //late double mark;

  late ReviewModel _model;

  Review({
    Key? key,
    required ReviewModel model,
  }) : super(key: key) {
    _model = model;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: <Widget>[
              //Row(
              // children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(
                  bottom: 3,
                ),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1.0,
                      color: Color.fromRGBO(200, 200, 200, 1),
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(3.0, 10, 5.0, 0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25.0,
                        backgroundImage: NetworkImage(_model.profileImage),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0),
                            child: Text(
                              _model.fullName,
                              style: const TextStyle(
                                fontSize: 15.0,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(3.0, 0, 10.0, 0),
                            child: RatingBarIndicator(
                              rating: _model.rate,
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 30.0,
                              direction: Axis.horizontal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    _model.commentText ??
                        " ", //treba dodati sta se desava ako nema tekst komentara
                    style: const TextStyle(
                      fontSize: 15.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ],
          ),
          // ],
        ),
        // ),
      ),
    );
  }
}
