import 'package:flutter/material.dart';
import 'package:job_post_app/custom_widgets/app_button.dart';
import 'package:job_post_app/custom_widgets/user_textfiled.dart';
import 'package:job_post_app/screens/sign_up_view.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Padding(
        padding: const EdgeInsets.only(top: 67, left: 27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Let's sign you in",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "Welcome back \n you've been missed!",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            const SizedBox(
              height: 47,
            ),
            // const UserTextField(placeholder: "Enter Your Email Address"),
            // const UserTextField(placeholder: "Enter Your Password"),
            UserTextField(
                placeholder: "Enter register email",
                textEditingController: emailEditingController),
            UserTextField(
                placeholder: "Enter your password",
                textEditingController: passwordEditingController),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Dont have an account? ",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const SignUp()));
                  },
                  child: const Text(
                    " Sign Up ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 11,
            ),
            AppButton(
              label: "Sign In",
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
