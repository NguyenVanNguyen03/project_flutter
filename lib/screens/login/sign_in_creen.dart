import 'package:flutter/material.dart';
import 'package:project_flutter/main.dart';

class SignInScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              // Container(
              //   height: 200,
              //   decoration: BoxDecoration(
              //     color: Colors.green,
              //   ),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Container(
              //         height: 20,
              //       ),
              //       Padding(
              //         padding: EdgeInsets.only(left: 30, right: 30, top: 30),
              //         child: Image.asset('assets/images/logo_login.png'),
              //       )
              //     ],
              //   ),
              // ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 130, 0, 0),
                width: 800,
                height: 700,
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
                                builder: (_) => MyApp(),
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
                          padding:
                              EdgeInsets.only(left: 30, right: 30, top: 30),
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          )),
                      Padding(
                          padding:
                              EdgeInsets.only(left: 30, right: 30, top: 30),
                          child: Text(
                            "Welcome back, Yoo Jin",
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
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
                                  "Forgot Password",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        print("Đăng nhập thành công");
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green),
                                    child: SizedBox(
                                      width: 450,
                                      height: 50,
                                      child: Center(
                                          child: Text(
                                        "Login",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    )),
                                // SizedBox(
                                //   height: 30,
                                // ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [Text("Or sign in with")],
                                // ),
                                // SizedBox(
                                //   height: 30,
                                // ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   children: [
                                //     Image.asset(
                                //       'assets/images/logo_fb.png',
                                //       width: 40,
                                //       height: 40,
                                //       fit: BoxFit.cover,
                                //     ),
                                //     SizedBox(
                                //       width: 30,
                                //     ),
                                //     Image.asset(
                                //       'assets/images/logo_talk.png',
                                //       width: 40,
                                //       height: 40,
                                //       fit: BoxFit.cover,
                                //     ),
                                //     SizedBox(
                                //       width: 30,
                                //     ),
                                //     Image.asset(
                                //       'assets/images/logo_line.png',
                                //       width: 40,
                                //       height: 40,
                                //       fit: BoxFit.cover,
                                //     ),
                                //   ],
                                // ),
                                SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Don't have an account?"),
                                    Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.greenAccent),
                                    )
                                  ],
                                )
                              ],
                            )),
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
