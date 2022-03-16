import 'dart:async';
//import 'dart:html';
import 'dart:math';
import 'dart:core';
import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quizlearnapp_concept/design/designs.dart';
import 'package:flutter_quizlearnapp_concept/models/models.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_quizlearnapp_concept/services/services.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_quizlearnapp_concept/pages/gameplay/gamelist.dart';

import '../services/services.dart';
part 'menu.dart';
part 'selectgame.dart';
part 'gameplay.dart';
part 'resultgame.dart';
part 'resulttournament.dart';
part 'tournamentgameplay.dart';
part 'pretest.dart';
part 'highscore.dart';
part 'loginregister.dart';
part 'login.dart';
part 'register.dart';
part 'profile.dart';
part 'welcomepage.dart';
part 'materikomputer.dart';

/* class GameplayPage extends StatefulWidget {
  GameplayPage({Key? key, required this.questions}) : super(key: key);

  final List<Question> questions;

  @override
  _GameplayPageState createState() => _GameplayPageState();
}

class _GameplayPageState extends State<GameplayPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
} */
