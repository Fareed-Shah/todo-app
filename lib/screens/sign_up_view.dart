import 'package:flutter/material.dart';
import 'package:job_post_app/custom_widgets/app_button.dart';
import 'package:job_post_app/custom_widgets/user_textfiled.dart';
import 'package:job_post_app/screens/sign_in_view.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

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
              "Let's sign you up",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "Welcome \n join the community!",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            const SizedBox(
              height: 47,
            ),
            const UserTextField(placeholder: "Enter Your Full Name"),
            const UserTextField(placeholder: "Enter Your Email Address"),
            const UserTextField(placeholder: "Enter Your Password"),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account? ",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const SignIn()));
                  },
                  child: const Text(
                    " Sign In ",
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
              label: "Sign Up",
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
