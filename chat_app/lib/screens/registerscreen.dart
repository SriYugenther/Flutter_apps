import 'package:figma_ex_app/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

final firebaseauth = FirebaseAuth.instance;

class RegScreen extends StatefulWidget {
  const RegScreen({super.key});

  @override
  State<RegScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  var formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  void submit() async {
    try {
      if (formkey.currentState!.validate()) {
        formkey.currentState!.save();

        final users = await firebaseauth.signInWithEmailAndPassword(
            email: email, password: password);
      }
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.message ?? "Authentication error")));
    }
  }

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
            // registration3qj (12:9)
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
                  // ewsappL49 (12:96)
                  margin: EdgeInsets.fromLTRB(
                      0 * fem, 0 * fem, 300 * fem, 177 * fem),
                  child: Text(
                    'Chat App ',
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
                  // welcomeonboard2Sm (12:49)
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
                  // letsstartsharingwords91b (12:51)
                  margin: EdgeInsets.fromLTRB(
                      19 * fem, 0 * fem, 0 * fem, 120 * fem),
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
                        TextSpan(
                          text: '.',
                        ),
                      ],
                    ),
                  ),
                ),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
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
                        child: TextFormField(
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
                          validator: (value) {
                            if (value == null ||
                                !value.trim().contains('@') ||
                                !value.trim().contains('.com')) {
                              return "Enter valid Email Address";
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            email = newValue!;
                          },
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
                        child: TextFormField(
                          obscureText: true,
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
                          validator: (value) {
                            if (value == null || value.trim().length < 8) {
                              return "Enter valid password";
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            password = newValue!;
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                    // registerbuttontfK (12:56)
                    margin: EdgeInsets.fromLTRB(
                        35 * fem, 0 * fem, 26 * fem, 17 * fem),
                    width: double.infinity,
                    height: 60 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xff3fa99c),
                      borderRadius: BorderRadius.circular(50 * fem),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 29, 137, 125),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40))),
                      child: Center(
                        child: Text(
                          'Log In',
                          style: GoogleFonts.getFont(
                            'Poppins',
                            fontSize: 18 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.5 * ffem / fem,
                            color: const Color(0xffffffff),
                          ),
                        ),
                      ),
                      onPressed: submit,
                    )),
                // Container(
                //   // alreadyhaveanaccountsigninkhX (12:108)
                //   margin:
                //       EdgeInsets.fromLTRB(0 * fem, 0 * fem, 7 * fem, 0 * fem),
                //   child: TextButton(
                //     onPressed: () {},
                //     style: TextButton.styleFrom(
                //       padding: EdgeInsets.zero,
                //     ),
                //     child: RichText(
                //       text: TextSpan(
                //         style: GoogleFonts.getFont(
                //           'Poppins',
                //           fontSize: 13 * ffem,
                //           fontWeight: FontWeight.w400,
                //           height: 1.5 * ffem / fem,
                //           color: Color(0xff000000),
                //         ),
                //         children: [
                //           TextSpan(text: 'Don’t have an account ?'
                //               //'Already have an account ?',
                //               ),
                //           TextSpan(
                //             text: ' Register',
                //             //' Sign In',
                //             style: GoogleFonts.getFont(
                //               'Poppins',
                //               fontSize: 13 * ffem,
                //               fontWeight: FontWeight.w700,
                //               height: 1.5 * ffem / fem,
                //               color: Color(0xff000000),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
