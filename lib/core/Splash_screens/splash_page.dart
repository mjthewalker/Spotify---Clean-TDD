import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/features/into_page/presentation/pages/intro_page.dart';

class SplashPage extends StatefulWidget{
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState(){
    super.initState();
    redirect(context);
}
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: SvgPicture.asset('assets/logos/spotify_logo.svg')
      ),
    );
  }
}
Future<void> redirect(BuildContext context) async{
  await Future.delayed(const Duration(seconds: 2));
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> const IntroPage()));
}