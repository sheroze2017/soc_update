import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Components/NormalOutlinebutton.dart';
import '../Components/Richtextfile.dart';
import '../Components/Textfile.dart';
import '../Components/RoundedButton.dart';

class Dialog_Import_token extends StatefulWidget {
  const Dialog_Import_token({super.key});

  @override
  State<Dialog_Import_token> createState() => _Dialog_Import_tokenState();
}

class _Dialog_Import_tokenState extends State<Dialog_Import_token> {
  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    var padding = MediaQuery.of(context).size.width;
    return RichText(
        text: TextSpan(
            text: "Refresh List",
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.normal,
                fontSize: 14.sp),
            children: <InlineSpan>[
          WidgetSpan(
              child: SizedBox(
            width: 0.5.h,
          )),
          TextSpan(
              text: "Or",
              style: TextStyle(
                  color: isLightMode ? Colors.black : Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 12.sp)),
          WidgetSpan(
              child: SizedBox(
            width: 0.5.h,
          )),
          TextSpan(
              recognizer: new TapGestureRecognizer()
                ..onTap = () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            backgroundColor:
                                isLightMode ? Color(0xffF5FAFA) : Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color: Color(0xff17E9E1),
                                // isLightMode
                                // ? Color(0xff17E9E1)
                                // : Color(0xffFFB800)
                              ),
                            ),
                            actions: [
                              Container(
                                height: 34.h,
                                width: 80.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Textfile(
                                        text: "Import Token",
                                        textcolor: isLightMode
                                            ? Colors.black
                                            : Colors.white,
                                        textsize: 18.sp,
                                        textweight: FontWeight.bold),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: padding / 20,
                                          right: padding / 20),
                                      child: Richtextfile(
                                          text1:
                                              "Token detection is not available on this network yet. Please import token manually and make sure you trust it. Learn about scams and security risks.",
                                          text2: "Here",
                                          click: () {},
                                          text1color: isLightMode
                                              ? Colors.black
                                              : Colors.white,
                                          text2color: Colors.blue,
                                          text1size: 12.sp,
                                          text1weight: FontWeight.normal,
                                          text2size: 12.sp,
                                          text2weight: FontWeight.normal,
                                          text1space: 1,
                                          text2space: 1),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: padding / 20,
                                          right: padding / 20,
                                          top: padding / 20),
                                      child: SizedBox(
                                        height: 5.h,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                              hintText: "Token",
                                              hintStyle: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: isLightMode
                                                      ? Colors.black
                                                      : Colors.white),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xff17E9E1)
                                                      //  isLightMode
                                                      // ? Color(0xff17E9E1)
                                                      // : Color(0xffFFB800)
                                                      ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: Color(0xff17E9E1),
                                                      //   isLightMode
                                                      // ? Color(0xff17E9E1)
                                                      // : Color(0xffFFB800),
                                                      width: 2))),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                      width: 66.w,
                                      child: NormalOutlineButton(
                                        buttontext:
                                            "VFDGGGFGFAvudd022ds82sasdsd",
                                        pressed: () {},
                                        textcolor: isLightMode
                                            ? Colors.black
                                            : Colors.white,
                                        buttonwidth: 1,
                                        buttoncolor: Color(0xff17E9E1),
                                        //  isLightMode
                                        //           ? Color(0xff17E9E1)
                                        //           : Color(0xffFFB800)
                                      ),
                                    ),
                                    // Padding(
                                    //   padding:  EdgeInsets.only(left:padding/20,right:padding/20),
                                    //   child: SizedBox(
                                    //     height: 5.h,
                                    //     child: TextFormField(
                                    //       decoration: InputDecoration(
                                    //         hintText: "Token",
                                    //         hintStyle: TextStyle(
                                    //           fontSize: 14.sp
                                    //         ),
                                    //         enabledBorder: OutlineInputBorder(
                                    //           borderSide: BorderSide(
                                    //            color: Color(0xff17E9E1),
                                    //           ),
                                    //           borderRadius: BorderRadius.circular(10)
                                    //         ),
                                    //         focusedBorder: OutlineInputBorder(
                                    //           borderRadius: BorderRadius.circular(10),
                                    //           borderSide: BorderSide(
                                    //             color: Color(0xff17E9E1),
                                    //             width: 2
                                    //           )
                                    //         )
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 4.5.h,
                                          width: 25.w,
                                          child: NormalOutlineButton(
                                            buttontext: 'Cancel',
                                            pressed: () {
                                              Navigator.pop(context);
                                            },
                                            textcolor: Color(0xff17E9E1),
                                            // isLightMode
                                            //     ? Color(0xff17E9E1)
                                            //     : Color(0xffFFB800),
                                            textsize: 14.sp,
                                            textweight: FontWeight.normal,
                                            buttoncolor: Color(0xff17E9E1),
                                            // isLightMode
                                            //     ? Color(0xff17E9E1)
                                            //     : Color(0xffFFB800),
                                            buttonwidth: 1,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2.h,
                                        ),
                                        SizedBox(
                                          height: 4.5.h,
                                          width: 25.w,
                                          child: RoundedButton(
                                              buttontext: "Import",
                                              buttoncolor: Color(0xff17E9E1),
                                              //  isLightMode
                                              //         ? Color(0xff17E9E1)
                                              //         : Color(0xffFFB800),
                                              Textcolor: Colors.black,
                                              weightfont: FontWeight.normal,
                                              Pressed: () {},
                                              fontsize: 14.sp),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ));
                },
              text: "Import token",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp))
        ]));
  }
}
