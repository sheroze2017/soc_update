import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sbgwallet/Components/Richtextfile.dart';
import 'package:sbgwallet/Start.dart';
import 'Components/Textfile.dart';
import 'Controller/themeController.dart';
import 'New_wallet.dart';
import 'Components/RoundedButton.dart';
import 'Switch_button.dart';
import 'package:http/http.dart' as http;

class Terms_screen extends StatefulWidget {
  const Terms_screen({super.key});

  @override
  State<Terms_screen> createState() => _Terms_screenState();
}

bool _icon = false;

IconData _Lighticon = Icons.wb_sunny;
IconData _Darkicon = Icons.nights_stay;

class _Terms_screenState extends State<Terms_screen> {

  @override
  Widget build(BuildContext context) {
       

    var padding = MediaQuery.of(context).size.width;
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            top: padding / 14,
            left: padding / 20,
            right: padding / 20,
            bottom: padding / 20),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "Assets/Logo_white.png",
                        scale: 9,
                      ),
                      Switch_button(),
                    ],
                  ),
                ),
                Center(
                  child: Image.asset(
                    "Assets/signal-min.png",
                    scale: 5,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Center(
                  child: Textfile(
                      text: "Help us to Improve",
                      textcolor: isLightMode ? Colors.black : Colors.white,
                      textsize: 22.sp,
                      textweight: FontWeight.bold),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Center(
                  child: Textfile(
                      text: "SBG Wallet",
                      textcolor: Color(0xff17E9E1),
                      textsize: 22.sp,
                      textweight: FontWeight.bold),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Center(
                  child: SizedBox(
                    height: 10.h,
                    width: 85.w,
                    child: Textfile(
                        text:
                            "SGB Wallet would like to gather usage data to better understand how our users interact with the extension.This data will be used to continually improve the usability and user experience of our product and the Ethereum ecosystem.",
                        textcolor: isLightMode ? Colors.black : Colors.white,
                        textsize: 14.sp,
                        textweight: FontWeight.normal),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: padding / 40),
                  child: Textfile(
                      text: "SBG Wallet will..",
                      textcolor: isLightMode ? Colors.black : Colors.white,
                      textsize: 16.sp,
                      textweight: FontWeight.bold),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: padding / 40),
                  child: Row(
                    children: [
                      Image.asset(
                        "Assets/accept-min.png",
                        scale: 25,
                      ),
                      SizedBox(
                        width: 2.5.w,
                      ),
                      Textfile(
                          text: "Always allow you to opt-out via setting",
                          textcolor: isLightMode ? Colors.black : Colors.white,
                          textsize: 15.sp,
                          textweight: FontWeight.normal)
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: padding / 40),
                  child: Row(
                    children: [
                      Image.asset(
                        "Assets/accept-min.png",
                        scale: 25,
                      ),
                      SizedBox(
                        width: 2.5.w,
                      ),
                      Textfile(
                          text: "Send anonymized click & page view events",
                          textcolor: isLightMode ? Colors.black : Colors.white,
                          textsize: 15.sp,
                          textweight: FontWeight.normal)
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),

                Padding(
                  padding: EdgeInsets.only(left: padding / 40),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Image.asset(
                          "Assets/cross-min.png",
                          scale: 25,
                        ),
                        SizedBox(
                          width: 2.5.w,
                        ),
                        SizedBox(
                          height: 5.h,
                          width: 79.w,
                          child: Textfile(
                              text:
                                  "Never collect keys, addresses, transactions, balances, hashes, or any personal information.",
                              textcolor: isLightMode ? Colors.black : Colors.white,
                              textsize: 15.sp,
                              textweight: FontWeight.normal),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: padding / 40),
                  child: Row(
                    children: [
                      Image.asset(
                        "Assets/cross-min.png",
                        scale: 25,
                      ),
                      SizedBox(
                        width: 2.5.w,
                      ),
                      Textfile(
                          text: "Never collect your full IP address ",
                          textcolor: isLightMode ? Colors.black : Colors.white,
                          textsize: 15.sp,
                          textweight: FontWeight.normal),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: padding / 40),
                  child: Row(
                    children: [
                      Image.asset(
                        "Assets/cross-min.png",
                        scale: 25,
                      ),
                      SizedBox(
                        width: 2.5.w,
                      ),
                      Textfile(
                          text: "Never sell data for profet.Ever!",
                          textcolor: isLightMode ? Colors.black : Colors.white,
                          textsize: 15.sp,
                          textweight: FontWeight.normal),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),

                Center(
                  child: SizedBox(
                      height: 4.5.h,
                      width: 30.w,
                      child: RoundedButton(
                        Pressed: () {
                          Get.to(() => Start());
                        },
                        Textcolor: isLightMode ? Colors.black : Colors.black,
                        buttoncolor: Color(0xff17E9E1),
                        buttontext: 'No thanks',
                        weightfont: FontWeight.normal,
                        fontsize: 15.sp,
                      )),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Center(
                  child: SizedBox(
                      height: 4.5.h,
                      width: 30.w,
                      child: RoundedButton(
                        Pressed: () {
                          Get.to(() => New_wallet());
                        },
                        Textcolor: isLightMode ? Colors.black : Colors.black,
                        buttoncolor: Color(0xff17E9E1),
                        buttontext: 'I agree',
                        weightfont: FontWeight.normal,
                        fontsize: 15.sp,
                      )),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: padding / 40, right: padding / 17),
                  child: SizedBox(
                    height: 10.h,
                    width: 85.w,
                    child: Richtextfile(
                        text1:
                            "This data is aggregated and is therefore anonymous for the purpose of General data protection Regulation ( EU)2016/679. For the information in relation to our privacy practices, see our",
                        text2: "Privacy Policy here.",
                        click: () {},
                        text1color: isLightMode ? Colors.black : Colors.white,
                        text2color: Color(0xff17E9E1),
                        text1size: 13.sp,
                        text1weight: FontWeight.normal,
                        text2size: 13.sp,
                        text2weight: FontWeight.normal,
                        text1space: 0.5,
                        text2space: 0.5),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
