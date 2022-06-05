import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcomeScreen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      lowerBound: 0.1,
    );

    animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    // animation = ColorTween(begin: Colors.grey, end: Colors.blueAccent)
    //     .animate(controller);
    controller.forward();

    controller.addListener(() {
      setState(() {});
      print('${controller.value}\t${animation.value}');
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent.withOpacity(animation.value),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Text(
                'Flash Chat',
                style: TextStyle(
                  fontSize: animation.value * 50,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
            ),
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  child: Image.asset('images/logo.png'),
                  height: animation.value * 250,
                ),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              text: 'Log In',
              onClick: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              text: 'Register',
              onClick: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
