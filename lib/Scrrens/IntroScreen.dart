import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:t3_xo/ReSource.dart';
import 'package:t3_xo/Scrrens/HomePage.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myBackground,
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Center(
                  child: Hero(
                    tag: 'T3',
                    child: Text(
                      'TIC TAC TOE',
                      style: myFontWhite.copyWith(fontSize: 65),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Center(
                  child: AvatarGlow(
                    endRadius: 140,
                    duration: Duration(seconds: 2),
                    glowColor: Colors.white,
                    repeat: true,
                    repeatPauseDuration: Duration(seconds: 1),
                    startDelay: Duration(seconds: 1),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(style: BorderStyle.none),
                          shape: BoxShape.circle),
                      child: Hero(
                        tag: 'logo',
                        child: CircleAvatar(
                          radius: 80,
                          backgroundImage: AssetImage("lib/images/t3xo.png"),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  '@Error_Crasher',
                  style: myFontWhite.copyWith(fontSize: 35),
                ),
              ),
            ),
            Hero(
              tag: 'Play',
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 40, horizontal: 25),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: neutral),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      HapticFeedback.heavyImpact();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text(
                      'PLAY GAME',
                      style: myFontWhite.copyWith(
                        fontSize: 65,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
