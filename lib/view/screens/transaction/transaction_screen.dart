import 'package:flutter/material.dart';
import 'package:furniture_e_commerce/utils/colors.dart';
import 'package:furniture_e_commerce/view/screens/transaction/completed_screen.dart';
import 'package:furniture_e_commerce/view/screens/transaction/on_delivered_screen.dart';
import 'package:furniture_e_commerce/view/screens/transaction/on_process_screen.dart';
import 'package:furniture_e_commerce/widgets/bottom_navigation_bar/bottom_navbar.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionMainScreen extends StatefulWidget {
  const TransactionMainScreen({super.key});

  @override
  State<TransactionMainScreen> createState() => _TransactionMainScreenState();
}

class _TransactionMainScreenState extends State<TransactionMainScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: primaryColor,
          foregroundColor: whiteColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Transactions",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              color: whiteColor,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Container(
              color: whiteColor,
              child: TabBar(
                labelColor: primaryColor,
                unselectedLabelColor: blackColor,
                indicatorWeight: 4,
                indicatorColor: secondaryColor,
                tabs: [
                  Tab(
                    child: Text(
                      "On Process",
                      style: GoogleFonts.poppins(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "On Delivery",
                      style: GoogleFonts.poppins(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Completed",
                      style: GoogleFonts.poppins(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            OnProcessScreen(),
            OnDeliverScreen(),
            CompletedScreen(),
          ],
        ),
        bottomNavigationBar: const BottomNavigationBarComponent(),
      ),
    );
  }
}
