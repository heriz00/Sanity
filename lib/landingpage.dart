import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanity/blocs/login/login_bloc.dart';
import 'package:sanity/screens/home/home.dart';
import 'package:sanity/screens/introduction/app_information.dart.dart';
import 'package:sanity/screens/login/email_verification.dart';
import 'package:sanity/screens/login/login_landing.dart';

class LandingPage extends StatefulWidget {
  static const String routeName = 'landing_page';
  const LandingPage({Key? key}) : super(key: key);
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const LandingPage(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  void checkInformationScreen() {}

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      if (state is LoginLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is LoginUnAuthenticated) {
        return const LoginLanding();
      }
      if (state is InformationNotSeen) {
        return const LoginInformation();
      }
      if (state is LoginEmailNotVerified) {
        return const EmailVerification();
      }
      if (state is LoginTokenError) {
        return const Scaffold(
          backgroundColor: Colors.red,
          body: Text("TOKEN EXPIRED"),
        );
      }
      if (state is LoginAuthenticated) {
        return const Home();
      } else {
        return const Center(child: Text("SOMETHING WENT WRONG"));
      }
    });
  }
}
