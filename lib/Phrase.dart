// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
//
// import 'Components/Textfile.dart';
// import 'Controller/Secret_Recovery_Phrase_controller.dart';
// import 'Token_nextpage.dart';
//
// class Phrase extends StatefulWidget {
//   const Phrase({super.key});
//
//   @override
//   State<Phrase> createState() => _PhraseState();
// }
//
// class _PhraseState extends State<Phrase>with TickerProviderStateMixin {
//    Secret_Recovery_Phrase_Controller SRPController = Get.put(Secret_Recovery_Phrase_Controller());
//
//   // Future<Null> refreshList() async {
//   //   await Future.delayed(Duration(milliseconds: 0));
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     var padding = MediaQuery.of(context).size.width;
//     return  Container(
//
//             width: 85.w,
//
//               child: GetBuilder<Secret_Recovery_Phrase_Controller>(builder: (controller){
//                 return Obx( () =>
//                    ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                   // physics: NeverScrollableScrollPhysics(),
//                   itemCount: SRPController.secret_recovery_phrase.length,
//                   itemBuilder: (_, i){
//                   var currentSRP = SRPController.secret_recovery_phrase[i];
//                    return Padding(
//                      padding:  EdgeInsets.only(top:padding/50,left:padding/50,right:padding/50,bottom:padding/50),
//                      child: SelectableText(
//                      currentSRP.SRPhrase
//
//                      ),
//                    );
//                                   }
//
//                                   ),
//                 );
//               }
//
//               ),
//
//             decoration: BoxDecoration(
//               color: Color(0xff17E9E1),
//               borderRadius: BorderRadius.circular(10)
//             ),
//
//     );
//   }
//   }