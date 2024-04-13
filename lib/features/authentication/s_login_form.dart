import 'package:flutter/material.dart';
import 'package:flutter_tiktok_clone/constants/gaps.dart';
import 'package:flutter_tiktok_clone/constants/sizes.dart';
import 'package:flutter_tiktok_clone/features/authentication/widgets/w_form_button.dart';
import 'package:flutter_tiktok_clone/features/onboarding/s_interests.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {};

  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const InterestsScreen(),
          ),
          (route) => false, // remove all previous routes
        );
      }
    }
  }

  void _onScaffoldTap() {
    // dismiss keyboard
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Log in"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Gaps.v28,
                  TextFormField(
                    cursorColor: Colors.black,
                    autocorrect: false,
                    decoration: InputDecoration(
                      hintText: "Email",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Please enter your email";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      if (value != null) {
                        formData["email"] = value;
                      }
                    },
                  ),
                  Gaps.v16,
                  TextFormField(
                    cursorColor: Colors.black,
                    autocorrect: false,
                    decoration: InputDecoration(
                      hintText: "Password",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return "Please enter your password";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      if (value != null) {
                        formData["password"] = value;
                      }
                    },
                  ),
                  Gaps.v28,
                  GestureDetector(
                    onTap: _onSubmitTap,
                    child: const FormButton(disabled: false, text: "Log in"),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
