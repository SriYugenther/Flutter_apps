import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Container(
            // logincNV (12:109)
            padding:
                EdgeInsets.fromLTRB(12 * fem, 66 * fem, 12 * fem, 53 * fem),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xf2ebfef5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // ewsapppN5 (12:119)
                  margin: EdgeInsets.fromLTRB(
                      0 * fem, 0 * fem, 306 * fem, 130 * fem),
                  child: Text(
                    'Ews App ',
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontSize: 14 * ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.5 * ffem / fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                Container(
                  // welcomeonboardt73 (12:113)
                  margin:
                      EdgeInsets.fromLTRB(1 * fem, 0 * fem, 0 * fem, 17 * fem),
                  child: Text(
                    'Welcome on Board',
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontSize: 18 * ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.5 * ffem / fem,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                Container(
                  // letsstartsharingwordsBrq (12:114)
                  margin:
                      EdgeInsets.fromLTRB(19 * fem, 0 * fem, 0 * fem, 99 * fem),
                  child: RichText(
                    text: TextSpan(
                      style: GoogleFonts.getFont(
                        'Poppins',
                        fontSize: 18 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.5 * ffem / fem,
                        color: Color(0xff000000),
                      ),
                      children: [
                        TextSpan(
                          text: 'Lets Start Sharing words!.',
                          style: GoogleFonts.getFont(
                            'Poppins',
                            fontSize: 18 * ffem,
                            fontWeight: FontWeight.w300,
                            height: 1.5 * ffem / fem,
                            color: Color(0xff000000),
                          ),
                        ),
                        const TextSpan(
                          text: '.',
                        ),
                      ],
                    ),
                  ),
                ),
                Form(
                  child: Column(
                    children: [
                      Container(
                        // inputemailzxh (12:116)
                        margin: EdgeInsets.fromLTRB(
                            35 * fem, 0 * fem, 26 * fem, 17 * fem),
                        padding: EdgeInsets.fromLTRB(
                            25 * fem, 0 * fem, 25 * fem, 0 * fem),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(100 * fem),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter Your Name',
                            hintStyle: GoogleFonts.getFont(
                              'Poppins',
                              fontSize: 13 * ffem,
                              fontWeight: FontWeight.w300,
                              height: 1.5 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        // inputemailN2m (12:90)
                        margin: EdgeInsets.fromLTRB(
                            35 * fem, 0 * fem, 26 * fem, 17 * fem),
                        padding: EdgeInsets.fromLTRB(
                            25 * fem, 0 * fem, 25 * fem, 0 * fem),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(100 * fem),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter Your Email Id',
                            hintStyle: GoogleFonts.getFont(
                              'Poppins',
                              fontSize: 13 * ffem,
                              fontWeight: FontWeight.w300,
                              height: 1.5 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        // inputemailcxh (12:93)
                        margin: EdgeInsets.fromLTRB(
                            35 * fem, 0 * fem, 26 * fem, 83 * fem),
                        padding: EdgeInsets.fromLTRB(
                            25 * fem, 0 * fem, 25 * fem, 0 * fem),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xffffffff),
                          borderRadius: BorderRadius.circular(100 * fem),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter Password',
                            hintStyle: GoogleFonts.getFont(
                              'Poppins',
                              fontSize: 13 * ffem,
                              fontWeight: FontWeight.w300,
                              height: 1.5 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // registerbuttonUeu (12:110)
                  margin: EdgeInsets.fromLTRB(
                      35 * fem, 0 * fem, 26 * fem, 17 * fem),
                  width: double.infinity,
                  height: 60 * fem,
                  decoration: BoxDecoration(
                    color: Color(0xff3fa99c),
                    borderRadius: BorderRadius.circular(50 * fem),
                  ),
                  child: Center(
                    child: Text(
                      'Register',
                      style: GoogleFonts.getFont(
                        'Poppins',
                        fontSize: 18 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.5 * ffem / fem,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
                Container(
                  // donthaveanaccountregisterhGm (12:115)
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 13 * fem, 0 * fem),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.getFont(
                          'Poppins',
                          fontSize: 13 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.5 * ffem / fem,
                          color: Color(0xff000000),
                        ),
                        children: [
                          const TextSpan(
                            text: 'Already have an account ?',
                          ),
                          TextSpan(
                            text: ' Sign In',
                            style: GoogleFonts.getFont(
                              'Poppins',
                              fontSize: 13 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.5 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ],
                      ),
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
