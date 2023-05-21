import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertok/view/widgets/glitch.dart';

import '../../widgets/text-input.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _setPasswordController = new TextEditingController();
  TextEditingController _passwordConfirmController =
      new TextEditingController();
  TextEditingController _userNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 150),
            alignment: Alignment.center,
            //const - Constant - Value - String , Int  - Fix Rahega  - Use Karna
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GlithEffect(
                    child: const Text(
                  "Welcome To Flutter Tok",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
                )),
                SizedBox(
                  height: 30,
                ),
                Stack(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 65,
                    ),
                    Positioned(
                        bottom: 0,
                        right: 8,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(45),
                          ),
                            child: Icon(
                          Icons.edit,
                          size: 20,
                              color: Colors.black,
                        )))
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextInputField(
                    controller: _emailController,
                    myLabelText: "Email",
                    myIcon: Icons.email,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextInputField(
                    controller: _userNameController,
                    myLabelText: "Username",
                    myIcon: Icons.person,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextInputField(
                    controller: _setPasswordController,
                    myLabelText: "Set Password",
                    myIcon: Icons.lock,
                    toHide: true,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: TextInputField(
                    controller: _passwordConfirmController,
                    myLabelText: "Confirm Password",
                    myIcon: Icons.lock,
                    toHide: true,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        child: Text("Sign-up")))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
