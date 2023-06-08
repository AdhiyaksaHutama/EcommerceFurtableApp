import 'package:flutter/material.dart';
import 'package:furniture_e_commerce/utils/colors.dart';
import 'package:furniture_e_commerce/utils/preferences/preferences.dart';
import 'package:furniture_e_commerce/view/screens/auth/login_screen.dart';
import 'package:furniture_e_commerce/view/viewmodel/auth/auth_view_model.dart';
import 'package:furniture_e_commerce/widgets/bottom_navigation_bar/bottom_navbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<AuthViewModel>(context, listen: false).getUser();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      bottomNavigationBar: const BottomNavigationBarComponent(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor,
        foregroundColor: whiteColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: whiteColor,
          ),
        ),
      ),
      body: Container(
        height: height,
        width: width,
        color: Colors.white,
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: SingleChildScrollView(
          child: Consumer<AuthViewModel>(
            builder: (context, value, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  Center(
                    child: CircleAvatar(
                      radius: 72,
                      backgroundImage: NetworkImage(value.userModel.image ??
                          "https://serikatnews.com/wp-content/uploads/2019/08/Mia-Khalifa-Jilbab.jpg"),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
                    child: Text(
                      "User Info",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: const Color(0xffF7F9FB),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 12,
                        bottom: 12,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Username",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              value.userModel.name ?? "Username",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: const Color(0xffF7F9FB),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 12,
                        bottom: 12,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              value.userModel.email ?? "User Email",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    "Settings",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    onTap: () {
                      PreferencesUtils preferencesUtils = PreferencesUtils();
                      preferencesUtils.init();
                      preferencesUtils.removePreferences('token');
                      preferencesUtils.removePreferences('isLogin');
                      Navigator.of(context).pushReplacement(
                        PageRouteBuilder(
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            {
                              final tweenFade = Tween(begin: 0.0, end: 1.0);
                              return FadeTransition(
                                  opacity: animation.drive(tweenFade),
                                  child: child);
                            }
                          },
                          pageBuilder:
                              (context, animations, secondaryAnimations) =>
                                  const LoginScreen(),
                        ),
                      );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: const Color(0xffF7F9FB),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.logout),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text(
                                "Logout",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
