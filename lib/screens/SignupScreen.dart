import 'package:flutter/material.dart';
import 'package:login_signup_pages/Responsive/UiComponanets/InfoWidget.dart';
import 'package:login_signup_pages/Responsive/models/DeviceInfo.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Infowidget(
      builder: (context, deviceinfo) {
        return Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            title: Text('Register'),
            backgroundColor: Colors.amber[900],
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: deviceinfo.screenWidth * 0.07,
                  vertical: deviceinfo.screenHeight * 0.05,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/monkey.png',
                      height: deviceinfo.screenHeight * 0.25,
                    ),
                    SizedBox(height: deviceinfo.screenHeight * 0.02),

                    Text(
                      'Create your account',
                      style: TextStyle(
                        fontSize: deviceinfo.screenWidth * 0.065,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: deviceinfo.screenHeight * 0.04),

                    // Full Name
                    _buildTextField(
                      controller: _nameController,
                      hintText: 'Full Name',
                      deviceinfo: deviceinfo,
                      icon: Icons.person,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: deviceinfo.screenHeight * 0.02),

                    // Email
                    _buildTextField(
                      controller: _emailController,
                      hintText: 'Email',
                      deviceinfo: deviceinfo,
                      icon: Icons.email,
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
                    ),
                    SizedBox(height: deviceinfo.screenHeight * 0.02),

                    // Password
                    _buildTextField(
                      controller: _passwordController,
                      hintText: 'Password',
                      deviceinfo: deviceinfo,
                      icon: Icons.lock,
                      isPassword: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: deviceinfo.screenHeight * 0.04),

                    // Sign up button
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          print('Name: ${_nameController.text}');
                          print('Email: ${_emailController.text}');
                          print('Password: ${_passwordController.text}');
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(deviceinfo.screenWidth * 0.025),
                        decoration: BoxDecoration(
                          color: Colors.amber[900],
                          borderRadius: BorderRadius.circular(
                            deviceinfo.screenWidth * 0.030,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: deviceinfo.screenWidth * 0.040,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: deviceinfo.screenHeight * 0.020),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required Deviceinfo deviceinfo,
    required FormFieldValidator<String> validator,
    IconData? icon,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(deviceinfo.screenWidth * 0.03),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: deviceinfo.screenWidth * 0.03,
        ),
        child: TextFormField(
          controller: controller,
          obscureText: isPassword ? !isPasswordVisible : false,
          keyboardType: keyboardType,
          validator: validator,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            icon: icon != null ? Icon(icon) : null,
            suffixIcon:
                isPassword
                    ? IconButton(
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
                    )
                    : null,
          ),
        ),
      ),
    );
  }
}
