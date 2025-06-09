import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/widgets/appbar/basic_appbar.dart';
import 'package:spotify_clone/common/widgets/button/basic_btn.dart';
import 'package:spotify_clone/common/widgets/textfield/basic_textfield.dart';
import 'package:spotify_clone/core/assets/app_vectors.dart';
import 'package:spotify_clone/domain/usecases/auth/signup.dart';
import 'package:spotify_clone/presentation/auth/pages/signin.dart';
import 'package:spotify_clone/presentation/root/pages/root.dart';

import '../../../data/models/auth/create_user_req.dart';
import '../../../service_locator.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _siginText(context),
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
            BasicTextfield(controller: _fullName, hintText: 'Full Name'),
            const SizedBox(height: 20),
            BasicTextfield(
              controller: _email,
              hintText: 'Enter Email',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            BasicTextfield(
              controller: _password,
              hintText: 'Password',
              keyboardType: TextInputType.visiblePassword,
              isPassword: true,
            ),
            const SizedBox(height: 20),
            BasicButton(
              onPressed: () async {
                var result = await sl<SignupUsecase>().call(
                  params: CreateUserReq(
                    fullName: _fullName.text.toString(),
                    email: _email.text.toString(),
                    password: _password.text.toString(),
                  ),
                );
                result.fold(
                  (l) {
                    var snackbar = SnackBar(
                      content: Text(l),
                      behavior: SnackBarBehavior.floating,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  },
                  (r) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const RootPage(),
                      ),
                      (route) => false,
                    );
                  },
                );
              },
              title: 'Create Account',
            ),
          ],
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      'Register',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      textAlign: TextAlign.center,
    );
  }

  Widget _siginText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Do you have an account? ',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => SigninPage(),
                ),
              );
            },
            child: const Text('Sign In'),
          ),
        ],
      ),
    );
  }
}
