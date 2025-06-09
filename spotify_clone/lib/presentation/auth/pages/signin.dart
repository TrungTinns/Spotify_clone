import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/widgets/appbar/basic_appbar.dart';
import 'package:spotify_clone/common/widgets/button/basic_btn.dart';
import 'package:spotify_clone/common/widgets/textfield/basic_textfield.dart';
import 'package:spotify_clone/core/assets/app_vectors.dart';
import 'package:spotify_clone/core/theme/app_colors.dart';
import 'package:spotify_clone/presentation/auth/pages/signup.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signupText(context),
      appBar: BasicAppbar(
        title: SvgPicture.asset(AppVectors.logo, height: 40, width: 40),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _registerText(),
            const SizedBox(height: 50),
            BasicTextfield(controller: _email, hintText: "Enter Email"),
            const SizedBox(height: 20),
            BasicTextfield(
              controller: _password,
              hintText: "Password",
              keyboardType: TextInputType.visiblePassword,
              isPassword: true,
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Forgot Password?", style: TextStyle(fontSize: 14)),
            ),

            const SizedBox(height: 20),
            BasicButton(
              onPressed: () async {
                //  var result = await sl<SigninUseCase>().call(
                //   params: SigninUserReq(
                //     email: _email.text.toString(),
                //     password: _password.text.toString()
                //   )
                // );
                // result.fold(
                //   (l){
                //     var snackbar = SnackBar(content: Text(l),behavior: SnackBarBehavior.floating,);
                //     ScaffoldMessenger.of(context).showSnackBar(snackbar);
                //   },
                //   (r){
                //     Navigator.pushAndRemoveUntil(
                //       context,
                //       MaterialPageRoute(builder: (BuildContext context) => const HomePage()),
                //       (route) => false
                //     );
                //   }
                // );
              },
              title: 'Sign In',
            ),
          ],
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      'Sign In',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      textAlign: TextAlign.center,
    );
  }

  Widget _emailField(BuildContext context) {
    return Container(
      height: 80,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: _email,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter Email',
        ).applyDefaults(Theme.of(context).inputDecorationTheme),
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return Container(
      height: 80,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: _password,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Password',
        ).applyDefaults(Theme.of(context).inputDecorationTheme),
      ),
    );
  }

  Widget _signupText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Not A Member? ',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => SignupPage(),
                ),
              );
            },
            child: const Text('Register Now'),
          ),
        ],
      ),
    );
  }
}
