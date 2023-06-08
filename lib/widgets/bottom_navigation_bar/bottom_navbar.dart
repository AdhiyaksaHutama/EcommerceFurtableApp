import 'package:flutter/material.dart';
import 'package:furniture_e_commerce/utils/colors.dart';
import 'package:furniture_e_commerce/view/screens/home/home_screen.dart';
import 'package:furniture_e_commerce/view/screens/profile/profile_screen.dart';
import 'package:furniture_e_commerce/view/screens/transaction/transaction_screen.dart';
import 'package:furniture_e_commerce/view/viewmodel/bottom_navigation_bar/bottom_navbar_viewmodel.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarComponent extends StatefulWidget {
  const BottomNavigationBarComponent({super.key});

  @override
  State<BottomNavigationBarComponent> createState() =>
      _BottomNavigationBarComponentState();
}

class _BottomNavigationBarComponentState
    extends State<BottomNavigationBarComponent> {
  @override
  initState() {
    super.initState();
  }

  void changeScreen(int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animations, secondaryAnimations) =>
                const HomeScreen(),
            transitionsBuilder:
                (context, animations, secondaryAnimations, childs) {
              final tween = Tween(begin: 0.0, end: 1.0);
              return FadeTransition(
                opacity: animations.drive(tween),
                child: childs,
              );
            },
          ),
        );
        break;
      case 1:
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animations, secondaryAnimations) =>
                const TransactionMainScreen(),
          ),
        );
        break;
      case 2:
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animations, secondaryAnimations) =>
                const ProfileScreen(),
          ),
        );
        break;
      default:
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animations, secondaryAnimations) =>
                const HomeScreen(),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 3), // Offset changes the shadow position
            ),
          ],
        ),
        child: ClipRRect(child: Consumer<BottomNavigationBarComponentViewModel>(
            builder: (context, model, child) {
          return BottomNavigationBar(
            currentIndex: model.currentIndex,
            backgroundColor: whiteColor,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              model.changeIndex(index);
              changeScreen(index);
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_outlined),
                label: 'Transaction',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            selectedItemColor: primaryColor,
          );
        })));
  }
}
