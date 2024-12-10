import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/features/authorization/domain/usecases/login.dart';
import 'package:spotify/features/authorization/presentation/pages/signup.dart';

import '../../../../injection_container.dart';
import '../../../home_page/presentation/pages/home_page.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signupText(context),
      appBar: AppBar(
        title:SvgPicture.asset(
          'assets/logos/spotify_logo.svg',
          height: 40,
          width: 40,
        ) ,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
            vertical: 50,
            horizontal: 30
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _registerText(),
            const SizedBox(height: 50,),
            _emailField(context),
            const SizedBox(height: 20,),
            _passwordField(context),
            const SizedBox(height: 20,),
            TextButton(
                onPressed: () async {
                  var result = await sl<CreateUserUsecase>().call(LoginParams(email: _email.text.toString(), password: _password.text.toString()));
                  result.fold(
                          (l){
                        var snackbar = SnackBar(content: Text('l'),behavior: SnackBarBehavior.floating,);
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      },
                          (r){
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (BuildContext context) => const HomePage()),
                                (route) => false
                        );
                      }
                  );
                },
                child: Text('Sign In')
            )

          ],
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      'Sign In',
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25
      ),
      textAlign: TextAlign.center,
    );
  }


  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _email,
      decoration: const InputDecoration(
          hintText: 'Enter Email'
      ).applyDefaults(
          Theme.of(context).inputDecorationTheme
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _password,
      decoration: const InputDecoration(
          hintText: 'Password'
      ).applyDefaults(
          Theme.of(context).inputDecorationTheme
      ),
    );
  }

  Widget _signupText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 30
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Not A Member? ',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14
            ),
          ),
          TextButton(
              onPressed: (){
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SignupPage()
                    )
                );
              },
              child: const Text(
                  'Register Now'
              )
          )
        ],
      ),
    );
  }
}