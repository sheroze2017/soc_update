import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Components/NormalOutlinebutton.dart';
import '../Components/Textfile.dart';
import '../Components/RoundedButton.dart';

class DialogDeposit extends StatelessWidget {
  const DialogDeposit({super.key});

  @override
  Widget build(BuildContext context) {
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    var padding = MediaQuery.of(context).size.width;
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
                                // ?Color(0xff17E9E1)
                                // : Color(0xffFFB800)
                                )),
                        backgroundColor:
                            isLightMode ? Color(0xffF5FAFA) : Colors.black,
                        actions: [
                          Container(
                            height: 20.h,
                            width: 95.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: isLightMode
                                  ? Color(0xffF5FAFA)
                                  : Colors.black,
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
                                          text: "Deposit ETH",
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
                                        icon: Icon(
                                          Icons.cancel,
                                          color: Color(0xff17E9E1),
                                          // isLightMode
                                          // ?Color(0xff17E9E1)
                                          // : Color(0xffFFB800)
                                        )),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: padding / 40, right: padding / 15),
                                  child: Textfile(
                                      text:
                                          "To interact with decentralized using SBG wallet. You’ll need ETH in your wallet. ",
                                      textcolor: isLightMode
                                          ? Colors.black
                                          : Colors.white,
                                      textsize: 11.sp,
                                      textweight: FontWeight.normal),
                                ),
                                Divider(thickness: 2, color: Color(0xff17E9E1)
                                    //  isLightMode
                                    //   ?Color(0xff17E9E1)
                                    //   : Color(0xffFFB800)
                                    ),
                                Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Row(
                                    children: [
                                      Textfile(
                                          text: "coinbase",
                                          textcolor: Colors.blue,
                                          textsize: 14.sp,
                                          textweight: FontWeight.normal),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Textfile(
                                              text: "Deposit ETH with coinbase",
                                              textcolor: isLightMode
                                                  ? Colors.black
                                                  : Colors.white,
                                              textsize: 12.sp,
                                              textweight: FontWeight.bold),
                                          SizedBox(
                                            height: 4.h,
                                            width: 45.w,
                                            child: Textfile(
                                                text:
                                                    "To interact with decentralized applications using SBG Wallet ",
                                                textcolor: isLightMode
                                                    ? Colors.black
                                                    : Colors.white,
                                                textsize: 11.sp,
                                                textweight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ));
            },
            icon: Icon(
              Icons.arrow_circle_down,
              color: Colors.grey,
              size: 35,
            )),
        Textfile(
            text: "Buy",
            textcolor: isLightMode ? Colors.black : Colors.white,
            textsize: 15.sp,
            textweight: FontWeight.normal),
      ],
    );
  }
}
