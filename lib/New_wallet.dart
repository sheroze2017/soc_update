import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sbgwallet/Components/Textfile.dart';
import 'package:sbgwallet/Components/RoundedButton.dart';
import 'package:sbgwallet/Recovery_Phrase.dart';

import 'CreatePassword.dart';
import 'Import_CreatePassword.dart';
import 'Switch_button.dart';

class New_wallet extends StatelessWidget {
  const New_wallet({super.key});

  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).size.width;
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            top: padding / 12,
            left: padding / 20,
            right: padding / 20,
            bottom: padding / 20),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "Assets/Logo_white.png",
                    scale: 9,
                  ),
                  Switch_button(),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Textfile(
                text: "New to SBG Wallet?",
                textcolor: isLightMode ? Colors.black : Colors.white,
                textsize: 22.sp,
                textweight: FontWeight.bold,
              ),
              SizedBox(
                height: 3.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: padding / 20,
                    right: padding / 20,
                    bottom: padding / 20),
                child: Container(
                  height: 35.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xff17E9E1),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: padding / 20,
                        right: padding / 20,
                        bottom: padding / 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        Icon(
                          Icons.download,
                          size: 50,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Textfile(
                            text: "No, I already have a ",
                            textcolor: Colors.black,
                            textsize: 17.sp,
                            textweight: FontWeight.bold),
                        Textfile(
                            text: "Secret Recovery Phrase",
                            textcolor: Colors.black,
                            textsize: 17.sp,
                            textweight: FontWeight.bold),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Textfile(
                            text: "Import your existing wallet",
                            textcolor: Colors.black,
                            textsize: 16.sp,
                            textweight: FontWeight.normal),
                        Textfile(
                            text: "using secret recovery phrase",
                            textcolor: Colors.black,
                            textsize: 16.sp,
                            textweight: FontWeight.normal),
                        SizedBox(
                          height: 2.h,
                        ),
                        SizedBox(
                          height: 5.5.h,
                          width: 50.w,
                          child: RoundedButton(
                            buttontext: "Import wallet",
                            buttoncolor: Colors.white,
                            Textcolor: Colors.black,
                            weightfont: FontWeight.normal,
                            Pressed: () {
                              Get.to(() => Recovery_Phrase());
                            },
                            fontsize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: padding / 20,
                    right: padding / 20,
                    bottom: padding / 20),
                child: Container(
                  height: 32.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xff17E9E1),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: padding / 40,
                        right: padding / 40,
                        bottom: padding / 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        Icon(
                          Icons.add,
                          size: 50,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Textfile(
                            text: "Yes, Let’s get set up!",
                            textcolor: Colors.black,
                            textsize: 17.sp,
                            textweight: FontWeight.bold),
                        Textfile(
                            text: "This will create a new wallet and",
                            textcolor: Colors.black,
                            textsize: 16.sp,
                            textweight: FontWeight.normal),
                        Textfile(
                            text: "Secret Recovery Phrase",
                            textcolor: Colors.black,
                            textsize: 16.sp,
                            textweight: FontWeight.normal),
                        SizedBox(
                          height: 3.h,
                        ),
                        SizedBox(
                            height: 5.5.h,
                            width: 50.w,
                            child: RoundedButton(
                              buttontext: "Create wallet",
                              buttoncolor: Colors.white,
                              Textcolor: Colors.black,
                              weightfont: FontWeight.normal,
                              Pressed: () {
                                Get.to(() => CreatePassword());
                              },
                              fontsize: 15.sp,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
