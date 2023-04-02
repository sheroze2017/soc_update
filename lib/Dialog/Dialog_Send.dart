import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Components/Textfile.dart';

class Dialog_Send extends StatelessWidget {
  const Dialog_Send({super.key});

  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).size.width;
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Column(
      children: [
        IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Color(0xff17E9E1)
                                //  isLightMode
                                //  ? Color(0xff17E9E1)
                                //  : Color(0xffFFB800)
                                )),
                        backgroundColor:
                            isLightMode ? Color(0xffF5FAFA) : Colors.black,
                        actions: [
                          Container(
                            height: 22.h,
                            width: 95.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: padding / 40),
                                      child: Textfile(
                                          text: "Send to",
                                          textcolor: isLightMode
                                              ? Colors.black
                                              : Colors.white,
                                          textsize: 15.sp,
                                          textweight: FontWeight.bold),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(Icons.cancel,
                                            color: Color(0xff17E9E1)
                                            // isLightMode
                                            // ? Color(0xff17E9E1)
                                            // : Color(0xffFFB800)
                                            )),
                                  ],
                                ),
                                Divider(thickness: 2, color: Color(0xff17E9E1)
                                    //  isLightMode
                                    //   ? Color(0xff17E9E1)
                                    //   : Color(0xffFFB800)
                                    ),
                                SizedBox(height: 0.9.h),
                                SizedBox(
                                  height: 4.h,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 10),
                                        hintText: "Receive Address",
                                        hintStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13.sp),
                                        fillColor: Color(0xff17E9E1),
                                        //  isLightMode
                                        //  ? Color(0xff17E9E1)
                                        //  : Color(0xffFFB800),
                                        filled: true,
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xff17E9E1)
                                                //   isLightMode
                                                //  ? Color(0xff17E9E1)
                                                //  : Color(0xffFFB800)
                                                ),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide: BorderSide(
                                                color: Color(0xff17E9E1)
                                                // isLightMode
                                                // ? Color(0xff17E9E1)
                                                // : Color(0xffFFB800)
                                                ))),
                                  ),
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                SizedBox(
                                  height: 4.h,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 10),
                                        suffixIcon: IconButton(
                                          icon: Icon(Icons.send,
                                              size: 15,
                                              color: isLightMode
                                                  ? Color(0xffF5FAFA)
                                                  : Colors.white),
                                          onPressed: () {},
                                        ),
                                        hintText: "Amount",
                                        hintStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13.sp),
                                        fillColor: Color(0xff17E9E1),
                                        //   isLightMode
                                        //  ? Color(0xff17E9E1)
                                        //  : Color(0xffFFB800),
                                        filled: true,
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xff17E9E1)),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide: BorderSide(
                                                color: Color(0xff17E9E1)))),
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(right: padding / 2.6),
                                  child: Textfile(
                                      text: "Transfer between my account",
                                      textcolor: isLightMode
                                          ? Colors.black
                                          : Colors.white,
                                      textsize: 13.sp,
                                      textweight: FontWeight.normal),
                                )
                              ],
                            ),
                          ),
                        ],
                      ));
            },
            icon: Icon(Icons.arrow_circle_right,
                size: 35, color: Color(0xff17E9E1))),
        Textfile(
            text: "Send",
            textcolor: isLightMode ? Colors.black : Colors.white,
            textsize: 15.sp,
            textweight: FontWeight.normal),
      ],
    );
  }
}
