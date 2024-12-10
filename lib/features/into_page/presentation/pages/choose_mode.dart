import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/features/authorization/presentation/pages/signin.dart';
import 'package:spotify/features/authorization/presentation/pages/signup.dart';
import 'package:spotify/features/into_page/presentation/bloc/theme_cubit.dart';

import '../../../../core/design_utils/app_themes.dart';

class ChooseMode extends StatelessWidget{
  const ChooseMode({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/choose_mode_bg.png')
                ),
              ),
            ),
            Container(
              color: Colors.black.withOpacity(0.17),
            ),
            Column(
              children: [
                const SizedBox(height: 30,),
                Align(
                    alignment : Alignment.topCenter,
                    child :  SvgPicture.asset('assets/logos/spotify_logo.svg')
                ),
                const SizedBox(height: 600,),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 130),
                  child: Row(
                    children: [
                      TextButton(onPressed: (){
                        context.read<ThemeCubit>().updateTheme(ThemeMode.light);
                      },
                          child: Text("Light") ),
                      TextButton(onPressed: (){
                        context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                      },
                          child: Text("Dark") ),
                    ],
                  ),
                ),
                ElevatedButton(onPressed: (){
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) =>  SignupPage()),
                          (route) => false
                  );
                },
                  child: Text("Sign Up"),

                ),
                ElevatedButton(onPressed: (){
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) => SigninPage()),
                          (route) => false
                  );
                },
                  child: Text("Sign In"),

                )

              ],
            ),
          ],
        ),
    );

  }

}