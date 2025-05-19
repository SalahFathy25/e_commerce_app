import 'package:e_commerce_app/utils/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../features/auth/screens/login/login_screen.dart';
import '../../navigation_menu.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Constants.supabase.auth.onAuthStateChange,
      builder: (context, snapshot) {
        final session = snapshot.hasData ? snapshot.data!.session : null;
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (session != null) {
          return const NavigationMenu();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
