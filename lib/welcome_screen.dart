import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/login_screen.dart';
import 'package:flash_chat/registration_screen.dart';
import 'package:flutter/material.dart';
import 'material_button_custom_widget.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = "WelcomeScreen";

  const WelcomeScreen({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    animation =
        ColorTween(begin: Colors.purple, end: Colors.white).animate(controller);
    controller.forward();

    controller.addListener(() {
      setState(() {});
      print(controller.value);
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
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 60,
                    child: Image.asset(
                      'images/logo.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.blueGrey,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        'Flash Chat',
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            MaterialButtonWidget(
              color: Colors.blue,
              customText: "Login",
              function: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            MaterialButtonWidget(
              color: Colors.blueAccent,
              customText: "Register",
              function: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
