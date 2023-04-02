import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sbgwallet/Components/Textfile.dart';
import 'Components/Richtextfile.dart';
import 'Components/RoundedButton.dart';
import 'Dialog/Dialog_Terms_of_use.dart';
import 'Switch_button.dart';
import 'WalletPage_assets.dart';
import 'YourSecretPhrase.dart';

class Import_CreatePassword extends StatefulWidget {
  const Import_CreatePassword({super.key});

  @override
  State<Import_CreatePassword> createState() => _Import_CreatePasswordState();
}

class _Import_CreatePasswordState extends State<Import_CreatePassword> {
  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).size.width;
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
     
      body: Padding(
         padding: EdgeInsets.only(top:padding/12,left:padding/20,right:padding/20,bottom:padding/20),
        child: Container(
          
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                 
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("Assets/Logo_white.png",
                          scale: 9,
                          ),
                          Switch_button(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                 Textfile(
                 text: "Create Password", 
                 textcolor: isLightMode 
                 ? Colors.black
                 :Colors.white, 
                 textsize: 26.sp, textweight: FontWeight.bold),
                 SizedBox(
                  height: 5.h,
                 ),
              Padding(
                padding:  EdgeInsets.only(left:padding/50,right: padding/30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Textfile(
                 text: "New Password (8 characters min)",
                 textcolor: isLightMode 
                 ? Colors.black
                 :Colors.white,  
                 textsize: 14.sp, textweight: FontWeight.normal),
                 SizedBox(
                  height: 0.5.h,
                 ),
                  SizedBox(
                   height: 5.h,
                   width: 70.w,
                 
                    child: TextFormField(
                     
                               decoration: InputDecoration(
                                
                          contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                 
                                fillColor: Color(0xff17E9E1),
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                 borderSide: BorderSide(
                                   color: Color(0xff17E9E1),
                                 ),
                                 borderRadius: BorderRadius.circular(10)
                                ),
                                enabledBorder: OutlineInputBorder(
                                 borderRadius: BorderRadius.all(Radius.circular(10)),
                                 borderSide: BorderSide(
                                   color: Color(0xff17E9E1),
                                 )
                                )
                               ),
                             ),
                  ),
                  ],
                 ),
              ),
              SizedBox(
                  height: 5.h,
                 ),
              Padding(
                padding:  EdgeInsets.only(left:padding/50,right: padding/30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Textfile(
                 text: "Confirm Password",
                textcolor: isLightMode
                ?Colors.black
                :Colors.white, 
                 textsize: 14.sp, textweight: FontWeight.normal),
                 SizedBox(
                  height: 0.5.h,
                 ),
                  SizedBox(
                   height: 5.h,
                   width: 70.w,
                 
                    child: TextFormField(
                     
                          decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),

                          fillColor:Color(0xff17E9E1),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                          color: Color(0xff17E9E1),
                                 ),
                          borderRadius: BorderRadius.circular(10)
                                ),
                          enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                                   color:Color(0xff17E9E1),
                                 )
                                )
                               ),
                             ),
                  ),
                 
                  ],
                 ),

              ),
               SizedBox(
                    height: 5.h,
                  ),
                  Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                    Dialog_term_of_use(),
                    // Richtextfile(
                    // text1: "I have read and agree to the", 
                    // text2: "Terms of use", 
                    // click: (){}, 
                    // text1color: Colors.black, text2color: Colors.blue, 
                    // text1size: 14.sp, text1weight: FontWeight.normal, 
                    // text2size: 14.sp, text2weight: FontWeight.normal, 
                    // text1space: 1, text2space: 1),
                  SizedBox(
                   height: 2.h,
                  ),
                   SizedBox(
                     height: 5.h,
                     width: 30.w,
                     child: RoundedButton(
                     Pressed: (){
                       Get.to(()=>WalletPage_asset());
                     }, Textcolor: Colors.black, 
                      buttoncolor: Color(0xff17E9E1),
                      buttontext: 'Create', weightfont: FontWeight.normal, 
                      fontsize: 15.sp,
                  
                     ),
                   ),
                   ],
                  ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}