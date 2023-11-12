import 'package:flutter/material.dart';
import 'package:project_flutter/main.dart';
import './sign_in_creen.dart';
import 'package:project_flutter/constants.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreen createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  bool _isChecked = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
            width: 800,
            height: 650,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80),
                    topRight: Radius.circular(80))),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SignInScreen(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                      ),
                      label: Text(''),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 30, right: 30, top: 30),
                      child: Text(
                        "Hi!",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )),
                  Padding(
                      padding: EdgeInsets.only(left: 30, right: 30, top: 30),
                      child: Text(
                        "Register An Account To Learn More Plants",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.greenAccent),
                      )),
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30, top: 30),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            TextFormField(
                              controller: emailController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ("Vui lòng nhập email!");
                                }
                                if (!RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                                  return ("Vui lòng nhập Email hợp lệ!");
                                }
                                return null;
                              },
                              onSaved: (value) {
                                emailController.text = value!;
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Password",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            TextFormField(
                              controller: passwordController,
                              validator: (value) {
                                RegExp regex = RegExp(r'^.{6,}$');
                                if (value!.isEmpty) {
                                  return ("Vui lòng nhập mật khẩu!");
                                }
                                if (!regex.hasMatch(value)) {
                                  return ("Mật khẩu phải ít nhất 6 kí tự!");
                                }
                              },
                              onSaved: (value) {
                                passwordController.text = value!;
                              },
                              obscureText: true,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Confirm password",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            TextFormField(
                              controller: confirmPasswordController,
                              validator: (value) {
                                RegExp regex = RegExp(r'^.{6,}$');
                                if (value!.isEmpty) {
                                  return ("Vui lòng nhập lại mật khẩu!");
                                }
                                if (value != passwordController.text) {
                                  return ("Mật khẩu không trùng khớp!");
                                }
                              },
                              onSaved: (value) {
                                confirmPasswordController.text = value!;
                              },
                              obscureText: true,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    print("Đăng ký thành công");
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: kPrimaryColor),
                                child: SizedBox(
                                  width: 450,
                                  height: 50,
                                  child: Center(
                                      child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                                )),
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Do you have an account?"),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => SignInScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.greenAccent),
                                  ),
                                )
                              ],
                            )
                          ],
                        )),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
