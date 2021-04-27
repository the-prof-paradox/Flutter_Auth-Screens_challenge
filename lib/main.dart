import 'dart:ui';

import 'package:flutter/material.dart';

final signupPurpleGradient = LinearGradient(colors: [
  Color.fromRGBO(145, 131, 222, 1),
  Color.fromRGBO(160, 148, 227, 1),
]);
final signupDarkPurple = Color.fromRGBO(82, 67, 154, 1);

final loginPurpleGradient = LinearGradient(colors: [
  Color.fromRGBO(229, 178, 202, 1),
  Color.fromRGBO(205, 130, 222, 1),
]);
final loginDarkPurple = Color.fromRGBO(120, 37, 139, 1);

TextEditingController sUserNameEditingController = TextEditingController();
TextEditingController sPasswordEditingController = TextEditingController();
TextEditingController lUserNameEditingController = TextEditingController();
TextEditingController lPasswordEditingController = TextEditingController();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Screen Challenge',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SignUpScreen(),
      ),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(gradient: signupPurpleGradient),
      child: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/person_on_rocket.png"),
            Text(
              'Hi there!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Let\'s Get Started',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.white),
            ),
            SizedBox(height: 30),
            MyTextField(
              screenType: 'signUp',
              customHintText: "Username",
              obscureText: false,
              iconAssetString: 'assets/icons/user.png',
            ),
            SizedBox(height: 15),
            MyTextField(
              screenType: 'signUp',
              customHintText: "Password",
              obscureText: true,
              iconAssetString: 'assets/icons/key.png',
            ),
            SizedBox(height: 15),
            InkWell(
              onTap: () {
                if (sUserNameEditingController.text == '' ||
                    sPasswordEditingController.text == '') {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Ok'))
                            ],
                            title: Text(
                              'Alert!',
                              textAlign: TextAlign.center,
                            ),
                            content: Text(
                              'Username or Password missing!',
                              textAlign: TextAlign.center,
                            ),
                          ));
                } else if (sPasswordEditingController.text.length < 8) {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Ok'))
                            ],
                            title: Text(
                              'Alert!',
                              textAlign: TextAlign.center,
                            ),
                            content: Text(
                              'Password must be atleast 8 characters long!',
                              textAlign: TextAlign.center,
                            ),
                          ));
                } else {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Ok'))
                            ],
                            title: Text(
                              'Success!',
                              textAlign: TextAlign.center,
                            ),
                            content: Text(
                              'Account Created!',
                              textAlign: TextAlign.center,
                            ),
                          ));
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: signupDarkPurple,
                ),
                child: Center(
                  child: Text(
                    'Create an Account',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Or(),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Scaffold(
                              body: LoginScreen(),
                            )));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white30,
                ),
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(gradient: loginPurpleGradient),
      child: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/person_&_dog.png"),
            Text(
              'Welcome Back!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Please, Log In.',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.white),
            ),
            SizedBox(height: 30),
            MyTextField(
              screenType: 'login',
              customHintText: "Username",
              obscureText: false,
              iconAssetString: 'assets/icons/user.png',
            ),
            SizedBox(height: 15),
            MyTextField(
              screenType: 'login',
              customHintText: "Password",
              obscureText: true,
              iconAssetString: 'assets/icons/key.png',
            ),
            SizedBox(height: 15),
            InkWell(
              onTap: () {
                if (lUserNameEditingController.text == '' ||
                    lPasswordEditingController.text == '') {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Ok'))
                            ],
                            title: Text(
                              'Alert!',
                              textAlign: TextAlign.center,
                            ),
                            content: Text(
                              'Username or Password missing!',
                              textAlign: TextAlign.center,
                            ),
                          ));
                } else if (lPasswordEditingController.text.length < 8) {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Ok'))
                            ],
                            title: Text(
                              'Alert!',
                              textAlign: TextAlign.center,
                            ),
                            content: Text(
                              'Password must be atleast 8 characters long!',
                              textAlign: TextAlign.center,
                            ),
                          ));
                } else {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Ok'))
                            ],
                            title: Text(
                              'Success!',
                              textAlign: TextAlign.center,
                            ),
                            content: Text(
                              'Logged in successfully!',
                              textAlign: TextAlign.center,
                            ),
                          ));
                }
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: signupDarkPurple,
                ),
                child: Center(
                  child: Text(
                    'Continue >',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Or(),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Scaffold(
                              body: SignUpScreen(),
                            )));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white30,
                ),
                child: Center(
                  child: Text(
                    'Create an Account',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.customHintText,
    required this.iconAssetString,
    required this.screenType,
    required this.obscureText,
  }) : super(key: key);

  final String customHintText;
  final String iconAssetString;
  final String screenType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: TextField(
              cursorWidth: 0.0,
              obscureText: this.obscureText,
              controller: this.screenType == 'signUp'
                  ? this.customHintText == 'Username'
                      ? sUserNameEditingController
                      : sPasswordEditingController
                  : this.customHintText == 'Username'
                      ? lUserNameEditingController
                      : lPasswordEditingController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: this.customHintText,
                prefixIcon: ImageIcon(
                  AssetImage(this.iconAssetString),
                  color: Colors.black,
                ),
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Or extends StatelessWidget {
  const Or({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        // color: signupDarkPurple,
      ),
      child: Center(
        child: RichText(
          text: TextSpan(
            text: '--------------------- ',
            style: TextStyle(
              color: Colors.white24,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'Or',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: ' ---------------------',
                style: TextStyle(
                  color: Colors.white24,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
