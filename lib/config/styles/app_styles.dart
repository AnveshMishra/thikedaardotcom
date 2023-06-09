import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../size/size_config.dart';

const mBlack = Color(0xff191519);

final mOswaldBold = GoogleFonts.merriweather();
final mOswaldSemiBold = GoogleFonts.oswald(fontWeight: FontWeight.w600);
final mOswaldMedium = GoogleFonts.oswald(fontWeight: FontWeight.w500);
final mOswaldRegular = GoogleFonts.oswald(fontWeight: FontWeight.w200);

final horizontalPaddingVakue = (SizeConfig.blackSizeHorizontal ?? 1) * 10;
final horizontalPadding =
    EdgeInsets.symmetric(horizontal: horizontalPaddingVakue);
