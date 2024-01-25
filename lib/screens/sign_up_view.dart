import 'package:flutter/material.dart';
import 'package:job_post_app/custom_widgets/app_button.dart';
import 'package:job_post_app/custom_widgets/user_textfiled.dart';
import 'package:job_post_app/screens/sign_in_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController userNameController = TextEditingController();
  String userName = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    userName = sp.getString("user") ?? "fa";

    setState(() {});
  }

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
            // const UserTextField(placeholder: "Enter Your Full Name"),
            // const UserTextField(placeholder: "Enter Your Email Address"),
            // const UserTextField(placeholder: "Enter Your Password"),
            Text(
              userName,
              style: const TextStyle(color: Colors.white),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, right: 27),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff5D5D67)),
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xff1E1C24)),
              child: TextFormField(
                controller: userNameController,
                style: const TextStyle(color: Colors.grey, fontSize: 15),
                decoration: const InputDecoration(
                    hintText: "Enter User Name",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                    border: InputBorder.none),
              ),
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
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString("user", userNameController.text);
                userName = sp.getString('user') ?? "";
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }
}
