import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/features/into_page/presentation/pages/choose_mode.dart';

class IntroPage extends StatelessWidget{
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/intro_bg.png')
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
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> const ChooseMode()));
              },
                child: Text("Get Started"),

              )

            ],
          ),



        ],
      ),
    );
  }
}