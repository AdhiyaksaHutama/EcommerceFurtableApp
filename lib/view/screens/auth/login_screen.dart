// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:furniture_e_commerce/utils/colors.dart';
import 'package:furniture_e_commerce/utils/constant/state.dart';
import 'package:furniture_e_commerce/utils/preferences/preferences.dart';
import 'package:furniture_e_commerce/view/screens/auth/registration_screen.dart';
import 'package:furniture_e_commerce/view/screens/home/home_screen.dart';
import 'package:furniture_e_commerce/view/viewmodel/auth/auth_view_model.dart';
import 'package:furniture_e_commerce/widgets/loading_screen/circular_progress.dart';
import 'package:furniture_e_commerce/widgets/loading_screen/opacity_progress.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late PreferencesUtils preferencesUtils;

  @override
  void initState() {
    super.initState();
    
    checkLoginStatus();
  }

  

  void checkLoginStatus() async {
    preferencesUtils = PreferencesUtils();
    await preferencesUtils.init();
    bool? isLogin = preferencesUtils.getPreferencesBool('isLogin');
    if (isLogin == true) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            {
              final tweenFade = Tween(begin: 0.0, end: 1.0);
              return FadeTransition(
                  opacity: animation.drive(tweenFade), child: child);
            }
          },
          pageBuilder: (context, animations, secondaryAnimations) =>
              const HomeScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: whiteColor,
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Image(
                        height: 200,
                        fit: BoxFit.fitHeight,
                        image: AssetImage('assets/images/furniture_store.png'),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Selamat Datang Kembali !',
                        style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Kami merindukanmu ! Silahkan login dan mulailah berbelanja kembali.',
                        style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Form(
                        key: _formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: GoogleFonts.poppins(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                            TextFormField(
                              style: GoogleFonts.poppins(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                              controller: _emailController,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              'Password',
                              style: GoogleFonts.poppins(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                            TextFormField(
                              obscureText: true,
                              style: GoogleFonts.poppins(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                              controller: _passwordController,
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () async {
                          Provider.of<AuthViewModel>(context, listen: false)
                              .setState(MyState.loading);
                          String message = await Provider.of<AuthViewModel>(
                                  context,
                                  listen: false)
                              .login(_emailController.text,
                                  _passwordController.text);
                          if (message.isNotEmpty) {
                            await saveToken(message);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Login Sukses !"),
                              ),
                            );
                            Navigator.of(context).pushReplacement(
                              PageRouteBuilder(
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  {
                                    final tweenFade =
                                        Tween(begin: 0.0, end: 1.0);
                                    return FadeTransition(
                                        opacity: animation.drive(tweenFade),
                                        child: child);
                                  }
                                },
                                pageBuilder: (context, animations,
                                        secondaryAnimations) =>
                                    const HomeScreen(),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(message),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            'Masuk',
                            style: GoogleFonts.poppins(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Row(
                          children: [
                            Text(
                              'Belum mempunyai akun?',
                              style: GoogleFonts.poppins(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegistrationScreen()),
                                );
                              },
                              child: Text(
                                ' Daftar',
                                style: GoogleFonts.poppins(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Consumer<AuthViewModel>(
                  builder: (context, value, child) =>
                      value.state == MyState.loading
                          ? const OpacityProgressComponent()
                          : const SizedBox.shrink(),
                ),
                Consumer<AuthViewModel>(
                  builder: (context, value, child) =>
                      value.state == MyState.loading
                          ? const CircularProgressComponent()
                          : const SizedBox.shrink(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  saveToken(String token) {
    preferencesUtils.savePreferencesString('token', token);
    preferencesUtils.savePreferencesBool('isLogin', true);
  }
}
