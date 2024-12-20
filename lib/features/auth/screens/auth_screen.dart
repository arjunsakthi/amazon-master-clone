import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/services/auth_service.dart';
import 'package:amazon_clone/utility/widgets/custom_button.dart';
import 'package:amazon_clone/utility/widgets/custom_textField.dart';
import 'package:flutter/material.dart';

enum Auth {
  signup,
  signin,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = "/auth-screen";
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signin;
  final AuthService authService = AuthService();

  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController =
      TextEditingController(text: '@gmail.com');
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void signupUser() {
    authService.signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      context: context,
      name: _nameController.text,
    );
  }

  void signInUser() {
    authService.signInUser(
      email: _emailController.text,
      password: _passwordController.text,
      context: context,
    );
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            GestureDetector(
              onTap: () => setState(() {
                _auth = Auth.signup;
              }),
              child: ListTile(
                tileColor: _auth == Auth.signup
                    ? Colors.white
                    : GlobalVariables.greyBackgroundCOlor,
                title: const Text("Create Account"),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
            ),
            if (_auth == Auth.signup)
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(8),
                child: Form(
                  key: _signUpFormKey,
                  child: Column(
                    children: [
                      CustomTextfield(
                        controller: _nameController,
                        hintText: "Name",
                      ),
                      const SizedBox(height: 10),
                      CustomTextfield(
                        controller: _emailController,
                        hintText: "email",
                      ),
                      const SizedBox(height: 10),
                      CustomTextfield(
                        controller: _passwordController,
                        hintText: "password",
                      ),
                      const SizedBox(height: 10),
                      CustomButton(
                          ontap: () {
                            if (_signUpFormKey.currentState!.validate()) {
                              signupUser();
                            }
                          },
                          text: 'Sign-up'),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            GestureDetector(
              onTap: () => setState(() {
                _auth = Auth.signin;
              }),
              child: ListTile(
                title: const Text("Sign-in"),
                tileColor: _auth == Auth.signin
                    ? Colors.white
                    : GlobalVariables.greyBackgroundCOlor,
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
            ),
            if (_auth == Auth.signin)
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(8),
                child: Form(
                  key: _signInFormKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      CustomTextfield(
                        controller: _emailController,
                        hintText: "email",
                      ),
                      const SizedBox(height: 10),
                      CustomTextfield(
                        controller: _passwordController,
                        hintText: "password",
                      ),
                      const SizedBox(height: 10),
                      CustomButton(
                          ontap: () {
                            if (_signInFormKey.currentState!.validate()) {
                              signInUser();
                            }
                          },
                          text: 'Sign-in'),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
          ],
        ),
      )),
    );
  }
}
