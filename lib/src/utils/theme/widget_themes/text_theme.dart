import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';

class TTextTheme {
  // CC66CC lavender color
  static TextTheme lightTextTheme = TextTheme(
    titleSmall: GoogleFonts.poppins(color: Colors.black87, fontSize: 24),
    displayLarge: GoogleFonts.montserrat(fontSize:28.0,fontWeight:FontWeight.bold,color:Colors.black87),
    displayMedium: GoogleFonts.montserrat(fontSize:24.0,fontWeight:FontWeight.w700,color:Colors.black87),
    displaySmall: GoogleFonts.poppins(fontSize:24.0,fontWeight:FontWeight.w700,color:Colors.black87),
    headlineMedium: GoogleFonts.poppins(fontSize:16.0,fontWeight:FontWeight.w600,color:Colors.black87),
    titleLarge: GoogleFonts.poppins(fontSize:14.0,fontWeight:FontWeight.w600,color:Colors.black87),
    bodyLarge: GoogleFonts.poppins(fontSize:14.0,fontWeight:FontWeight.normal,color:Colors.black87),
    bodyMedium: GoogleFonts.poppins(fontSize:14.0,fontWeight:FontWeight.normal,color:Colors.black87),

  );
  static TextTheme darkTextTheme = TextTheme(
    titleSmall: GoogleFonts.poppins(color: tWhiteColor, fontSize: 24),
    displayLarge: GoogleFonts.montserrat(fontSize:28.0,fontWeight:FontWeight.bold,color:tWhiteColor),
    displayMedium: GoogleFonts.montserrat(fontSize:24.0,fontWeight:FontWeight.w700,color:tWhiteColor),
    displaySmall: GoogleFonts.poppins(fontSize:24.0,fontWeight:FontWeight.w700,color:tWhiteColor),
    headlineMedium: GoogleFonts.poppins(fontSize:16.0,fontWeight:FontWeight.w600,color:tWhiteColor),
    titleLarge: GoogleFonts.poppins(fontSize:14.0,fontWeight:FontWeight.w600,color:tWhiteColor),
    bodyLarge: GoogleFonts.poppins(fontSize:14.0,fontWeight:FontWeight.normal,color:tWhiteColor),
    bodyMedium: GoogleFonts.poppins(fontSize:14.0,fontWeight:FontWeight.normal,color:tWhiteColor),

  );
}