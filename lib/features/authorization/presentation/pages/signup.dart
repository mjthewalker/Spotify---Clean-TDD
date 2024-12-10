import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/features/authorization/presentation/pages/signin.dart';


import '../../../../injection_container.dart';
import '../../../home_page/presentation/pages/home_page.dart';
import '../../domain/usecases/signup.dart';
class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _siginText(context),
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
            _fullNameField(context),
            const SizedBox(height: 20,),
            _emailField(context),
            const SizedBox(height: 20,),
            _passwordField(context),
            const SizedBox(height: 20,),
            TextButton(
                onPressed: () async {
                  var result = await sl<SignupUserUsecase>().call(
                      LoginParams(email: _email.text.toString(), password: _password.text.toString(), name: _fullName.text.toString(), username: 'x')
                  );
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
                child: Text('Create Account'),
            )

          ],
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      'Register',
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _fullNameField(BuildContext context) {
    return TextField(
      controller: _fullName,
      decoration: const InputDecoration(
          hintText: 'Full Name'
      ).applyDefaults(
          Theme.of(context).inputDecorationTheme
      ),
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

  Widget _siginText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 30
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Do you have an account? ',
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
                        builder: (BuildContext context) => SigninPage()
                    )
                );
              },
              child: const Text(
                  'Sign In'
              )
          )
        ],
      ),
    );
  }
}