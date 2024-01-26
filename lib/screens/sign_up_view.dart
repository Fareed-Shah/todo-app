import 'package:flutter/material.dart';
import 'package:job_post_app/custom_widgets/app_button.dart';
import 'package:job_post_app/custom_widgets/user_textfiled.dart';
import 'package:job_post_app/screens/home_view.dart';
import 'package:job_post_app/screens/sign_in_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   userCreation();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Padding(
        padding: const EdgeInsets.only(top: 67, left: 27),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
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
            UserTextField(
              placeholder: "Enter Your full name",
              textEditingController: nameEditingController,
            ),
            UserTextField(
              placeholder: "Enter your email",
              textEditingController: emailEditingController,
            ),
            UserTextField(
              placeholder: "Enter your password",
              textEditingController: passwordEditingController,
            ),
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
              onPressed: () async {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => const HomeView()));
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString("name", nameEditingController.text);
                sp.setString("email", emailEditingController.text);
                sp.setString("password", passwordEditingController.text);
                sp.setBool('isLogin', true);

                // userName = sp.getString('user') ?? "";
                // setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }
}
