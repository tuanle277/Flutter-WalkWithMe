import 'package:flutter/material.dart';
import 'package:walk/helper/text_field_with_box_shadow.dart';
import 'package:collection/collection.dart';
import 'package:walk/model/user.dart';
import 'helper/my_bezier_curve.dart';
import 'dart:async';

class SignInScreen extends StatefulWidget {
  final List<UserInfo> _listOfUsers;

  SignInScreen(this._listOfUsers);
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Function eq = const ListEquality().equals;

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: mediaQuery.height,
        width: mediaQuery.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: mediaQuery.height * 0.3,
              child: Flexible(
                flex: 2,
                child: Transform.rotate(
                  angle: 0,
                  child: CustomPaint(
                    child: MyBezierCurve(),
                    painter: CurvePath(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: mediaQuery.width * 0.09,
              ),
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: mediaQuery.width * 0.08,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: mediaQuery.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: mediaQuery.width * 0.09,
              ),
              child: const Text(
                'Please log in to continue',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: mediaQuery.height * 0.1,
            ),
            TextFieldWithBoxShadow(
              errorText: "Enter a valid input",
              labelText: "Username/Student email",
              controller: _usernameController,
              width: mediaQuery.width,
            ),
            SizedBox(
              height: mediaQuery.height * 0.04,
            ),
            TextFieldWithBoxShadow(
              errorText: "Enter a valid input",
              labelText: "Password",
              controller: _passwordController,
              width: mediaQuery.width,
              obscuredText: true,
            ),
            SizedBox(
              height: mediaQuery.height * 0.06,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: mediaQuery.width * 0.09,
              ),
              alignment: Alignment.centerRight,
              child: Container(
                height: mediaQuery.height * 0.12,
                width: mediaQuery.width * 0.42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    mediaQuery.width * 0.1,
                  ),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xffCEB888),
                      Color(0xffC28E0E),
                    ],
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (_usernameController.text.isNotEmpty &&
                        _passwordController.text.isNotEmpty) {
                      for (int i = 0; i < widget._listOfUsers.length; ++i) {
                        if (eq([
                          _usernameController.text,
                          _passwordController.text
                        ], [
                          widget._listOfUsers[i].username,
                          widget._listOfUsers[i].password
                        ])) {
                          Navigator.pushNamed(context, "mainpage");
                        }
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent),
                  child: Center(
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: mediaQuery.width * 0.045,
                        fontWeight: FontWeight.w600,
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
