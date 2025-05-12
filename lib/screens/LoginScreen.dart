import 'package:flutter/material.dart';
import 'package:login_signup_pages/Responsive/UiComponanets/InfoWidget.dart';
import 'package:login_signup_pages/screens/SignupScreen.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Infowidget(
      builder: (context, deviceinfo) {
        return Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            title: Text('Sign In'),
            backgroundColor: Colors.amber[900],
          ),
          body: SafeArea(
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/monkey.png',
                      height: deviceinfo.screenHeight * 0.25,
                    ),
                    SizedBox(height: deviceinfo.screenHeight * 0.02),

                    Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: deviceinfo.screenWidth * 0.080,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      'Welcome back! Nice to see you again',
                      style: TextStyle(
                        fontSize: deviceinfo.screenWidth * 0.036,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: deviceinfo.screenHeight * 0.05),

                    // Email TextFormField
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: deviceinfo.screenWidth * 0.05,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            deviceinfo.screenWidth * 0.030,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: deviceinfo.screenWidth * 0.01,
                          ),
                          child: TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              final emailRegex = RegExp(
                                r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                              );
                              if (!emailRegex.hasMatch(value)) {
                                return 'Enter a valid email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email',
                              prefixIcon: Icon(Icons.email),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: deviceinfo.screenHeight * 0.015),

                    // Password TextFormField
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: deviceinfo.screenWidth * 0.05,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            deviceinfo.screenWidth * 0.030,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: deviceinfo.screenWidth * 0.01,
                          ),
                          child: TextFormField(
                            controller: _passwordController,
                            obscureText: !isPasswordVisible,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: deviceinfo.screenHeight * 0.015),

                    // Sign in button
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: deviceinfo.screenWidth * 0.05,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            // عملية تسجيل الدخول هنا
                            print('Email: ${_emailController.text}');
                            print('Password: ${_passwordController.text}');
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(
                            deviceinfo.screenWidth * 0.025,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.amber[900],
                            borderRadius: BorderRadius.circular(
                              deviceinfo.screenWidth * 0.030,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: deviceinfo.screenWidth * 0.036,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: deviceinfo.screenHeight * 0.020),

                    // Text: Sign up
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Not yet a member? ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignupScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Sign up Now',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}


