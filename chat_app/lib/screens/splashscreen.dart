import 'package:figma_ex_app/screens/registerscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double top = MediaQuery.of(context).viewInsets.top;
    double ffem = fem * 0.97;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(12 * fem, 9 * fem, 12 * fem, 68 * fem),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xf2ebfef5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 50, bottom: 150, left: 10),
              alignment: Alignment.topLeft,
              // margin: EdgeInsets.fromLTRB(0 * fem, 50, 306 * fem, 182 * fem),
              child: Text(
                "Chat App",
                style: GoogleFonts.getFont(
                  'Poppins',
                  fontSize: 20 * ffem,
                  fontWeight: FontWeight.w700,
                  height: 1.5 * ffem / fem,
                  color: const Color(0xff000000),
                ),
              ),
            ),
            Container(
              // undrawmynotificationsreehmk1Td (1:67)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 4 * fem, 61 * fem),
              width: 277 * fem,
              height: 247 * fem,
              child: Image.asset(
                'assets/page-1/images/undrawmynotificationsreehmk-1.png',
                width: 277 * fem,
                height: 247 * fem,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 4 * fem, 120 * fem),
              child: Text(
                "Play With Words!!",
                style: GoogleFonts.getFont(
                  'Poppins',
                  fontSize: 18 * ffem,
                  fontWeight: FontWeight.w600,
                  height: 1.5 * ffem / fem,
                  color: Color(0xff000000),
                ),
              ),
            ),
            Expanded(
              child: Container(
                  margin:
                      EdgeInsets.fromLTRB(35 * fem, 0 * fem, 26 * fem, 0 * fem),
                  width: double.infinity,
                  height: 60 * fem,
                  decoration: BoxDecoration(
                    color: const Color(0xff3fa99c),
                    borderRadius: BorderRadius.circular(50 * fem),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 29, 137, 125),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: Center(
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.getFont(
                          'Poppins',
                          fontSize: 18 * ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.5 * ffem / fem,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RegScreen(),
                      ));
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
