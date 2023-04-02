import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sbgwallet/Components/Richtextfile.dart';
import 'package:sbgwallet/Components/Textfile.dart';
import 'Dialog/Dialog_Send.dart';
import 'Model/Wallet_Model.dart';
import 'Switch_button.dart';

class Token_Next_Page extends StatelessWidget {
      Token_Next_Page({ Key? key,
   required this.wallet,
   }) : super(key: key);
  final WalletModel wallet;
  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).size.height;
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding:  EdgeInsets.only(top:padding/12,left:padding/20,right:padding/20,bottom:padding/20),
          child: Column(
            children: [
             
              Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("Assets/Logo_white.png",
                          scale: 9,
                          ),
                          Switch_button(),
                        ],
                      ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 50.h,
                width: 80.w,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xff17E9E1),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   SizedBox(
                    height: 3.h,
                   ),   
                   Image.asset(wallet.Imag,
                   scale: 8,
                   ),
                   SizedBox(
                    height: 1.h,
                   ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Textfile(text: '${wallet.Price}', 
                    textcolor: isLightMode 
                    ? Colors.black
                    : Colors.white, 
                   textsize: 16.sp, textweight: FontWeight.bold),
                   SizedBox(
                    width: 1.w,
                   ),
                    
                    Textfile(text: wallet.Title, 
                    textcolor: isLightMode 
                    ? Colors.black
                    : Colors.white, 
                    textsize: 16.sp, 
                   textweight: FontWeight.bold),
                    ],
                   ),
                   Textfile(
                  text: "012FGvfgg4444121212121", 
                   textcolor: isLightMode 
                    ? Colors.black
                    : Colors.white,
                   textsize: 15.sp, textweight: FontWeight.normal),
                   SizedBox(
                    height: 5.h,
                   ),
                   Dialog_Send(),
                  //  Padding(
                  //    padding: EdgeInsets.only(right:padding/45),
                  //    child: IconButton(
                  //    onPressed: (){
                      
                  //    }, 
                  //    icon: Icon(Icons.arrow_circle_right,
                  //    size: 50,
                  //    color: Color(0xff17E9E1),
                  //    )
                  //    ),
                  //  ),
                  //  SizedBox(
                  //   height: 0.5.h,
                  //  ),
                  //  Textfile(
                  //   text: "Send", textcolor: Colors.black, 
                  //   textsize: 16.sp, textweight: FontWeight.normal),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                     Icon(Icons.build,
                     color: isLightMode 
                    ? Colors.black
                    : Colors.white,
                     size: 14,
                     ),
                     SizedBox(
                      width: 1.h,
                     ),
                     Textfile(
                    text: "Portfolio Site", 
                   textcolor: isLightMode 
                    ? Colors.black
                    : Colors.white,
                    textsize: 14.sp, textweight: FontWeight.normal),

                    
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Textfile(
                    text: "You Have no Transactions", 
                   textcolor: isLightMode 
                    ? Colors.black
                    : Colors.white, 
                    textsize: 16.sp, textweight: FontWeight.normal),
                   SizedBox(
                    height: 8.h,
                   ),
                    Textfile(
                    text: "Don't see your token?", 
                    textcolor: isLightMode 
                    ? Colors.black
                    : Colors.white, 
                    textsize: 14.sp, textweight: FontWeight.normal)
                    
                   
                   

                ],
               ),
              ),
              SizedBox(
                height: 1.h,
              ),
             Richtextfile(
            text1: "Need Help? Contect", 
            text2: "SBG Wallet Support", click: (){}, 
            text1color: isLightMode 
                    ? Colors.black
                    : Colors.white,
            text2color: Colors.blue, 
            text1size: 13.sp, text1weight: FontWeight.normal, 
            text2size: 13.sp, text2weight: FontWeight.normal, 
            text1space: 1, text2space: 1  )
            ],
          ),
        ),
      ),
    );
  }
}