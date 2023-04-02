import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class hello extends StatelessWidget {
  const hello({super.key});

  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).size.width;
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text("Hello"),
            Container(
              height: 250,
              width: 250,
             color: Theme.of(context).brightness == Brightness.light
             ? Color(0xff17E9E1)
             : Color(0xffFFB800)
            ),
            Image.asset(
                 isLightMode
                 //  Theme.of(context).brightness == Brightness.light
      ? 'Assets/Logo_white.png'
      : 'Assets/logo.png',
  fit: BoxFit.cover,
),
           Padding(
                 padding:  EdgeInsets.only(right:padding/3.5),
                 child: SizedBox(
                  height: 4.h,
                  width: 50.w,
               
                   child: TextFormField(
                    
                              decoration: InputDecoration(
                               
                          contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                              hintText: "hello",
                               fillColor: isLightMode
                               ? Color(0xff17E9E1)
                               : Color(0xffFFB800),
                             // Color(0xff17E9E1),
                               filled: true,
                               focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: isLightMode
                               ? Color(0xff17E9E1)
                               : Color(0xffFFB800),
                                ),
                                borderRadius: BorderRadius.circular(10)
                               ),
                               enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  color: isLightMode
                               ? Color(0xff17E9E1)
                               : Color(0xffFFB800),
                                )
                               )
                              ),
                            ),
                 ),
               ),
          ],
        ),
      ),
    );
  }
}
