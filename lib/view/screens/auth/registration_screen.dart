// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:furniture_e_commerce/utils/colors.dart';
import 'package:furniture_e_commerce/view/viewmodel/auth/auth_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
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
                  child: Container(
                    color: whiteColor,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Registrasi Akun',
                          style: GoogleFonts.poppins(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          'Isi data diri anda pada form berikut untuk menemukan furniture fvorit anda.',
                          style: GoogleFonts.poppins(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 32),
                        Form(
                          key: _formkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Link Gambar',
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
                                controller: _imageController,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Nama',
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
                                controller: _nameController,
                              ),
                              const SizedBox(height: 16),
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
                              const SizedBox(height: 16),
                              Text(
                                'Password',
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
                                controller: _passwordController,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Konfirmasi Password',
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
                                controller: _confirmPasswordController,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 64),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: () async {
                              String message = await Provider.of<AuthViewModel>(
                                      context,
                                      listen: false)
                                  .register(
                                      _imageController.text,
                                      _nameController.text,
                                      _emailController.text,
                                      _passwordController.text,
                                      _confirmPasswordController.text);
                              if (message.contains('success')) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Registrasi Sukses !"),
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
                                'Daftar',
                                style: GoogleFonts.poppins(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
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
                                'Sudah punya akun?',
                                style: GoogleFonts.poppins(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  ' Masuk',
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
