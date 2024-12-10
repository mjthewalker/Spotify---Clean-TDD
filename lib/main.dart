import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/core/Splash_screens/splash_page.dart';
import 'package:spotify/core/design_utils/app_themes.dart';
import 'package:spotify/features/into_page/presentation/bloc/theme_cubit.dart';
import 'package:spotify/firebase_options.dart';
import 'package:spotify/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit,ThemeMode>(

        builder: (context,mode ) => MaterialApp(
                theme: appThemeData[AppTheme.Light],
                darkTheme: appThemeData[AppTheme.Dark] ,
                themeMode: mode,
                debugShowCheckedModeBanner: false,
                home : const SplashPage()
        ),
      ),
    );
  }
}

