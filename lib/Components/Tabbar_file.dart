
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sbgwallet/Components/Textfile.dart';

import '../Controller/Wallet_Controller.dart';
import '../Token_nextpage.dart';

class Tabbarfile extends StatefulWidget {
   WalletController walletController = Get.put(WalletController());
 
  Tabbarfile({super.key});

  @override
  State<Tabbarfile> createState() => _TabbarfileState();
}

class _TabbarfileState extends State<Tabbarfile> with TickerProviderStateMixin  {
    WalletController walletController = Get.put(WalletController());

  Future<Null> refreshList() async {
    await Future.delayed(Duration(seconds: 2));
  }
  @override

  Widget build(BuildContext context) {
    TabController _tabController = TabController(
      length: 2, vsync: this);
    final isLightMode = Theme.of(context).brightness == Brightness.light;
    var padding = MediaQuery.of(context).size.width;
    return Scaffold(
     
      body: Container(
          color: isLightMode
          ?Colors.white
          :Colors.black,
        child: Padding(
          padding: EdgeInsets.all(padding/20),
          child: Column(
              
            children: [
             
              TabBar(
                indicatorColor: Color(0xff17E9E1),
                controller: _tabController,
                labelColor: isLightMode
                ?Colors.black
                : Colors.white,
                tabs: <Widget>[
                 Tab(
                  text: "Assets",
                  
                  ),
                  Tab(
                    text: "NFT",)
                ]
                ),
              
               Expanded(
                 child: Container(
                  
                   child: TabBarView(
                    controller: _tabController,
                   children: [
                   RefreshIndicator(
                     onRefresh: refreshList,
                     backgroundColor: Color(0xff17E9E1),
                     color: isLightMode 
                     ?Color(0xffF5FAFA)
                     : Colors.white,
                     child: GetBuilder<WalletController >(builder: (controller){
                     return Obx(() =>
                      ListView.builder(
                                       scrollDirection: Axis.vertical,
                                      itemCount: walletController.wallets.length,
                                      itemBuilder: (_, i){
                                      var currentWallet = walletController.wallets[i]; 
                       return GestureDetector(
                         onTap: (){
                                      
                         Get.to(()=>Token_Next_Page(wallet:currentWallet));
                        },
                       
                       child:  Column(
                        children: [
                          SizedBox(
                            height: 2.h,
                          ),
                                       
                        Container(
                          decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10)
                          ),
                          child:  Row(children: [
                                Image.asset(currentWallet.Imag,
                             
                               scale: 10,
                               ),
                              
                               SizedBox(
                                width: 4.w,
                               ),
                               Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  
                                  Textfile(
                                  text: currentWallet.Title, 
                                textcolor: isLightMode 
                                ? Colors.black
                                : Colors.white, 
                                  textsize : 17.sp, textweight: FontWeight.bold),
                                  Textfile(
                                  text: "${currentWallet.Price}", 
                                  textcolor: isLightMode 
                                  ? Colors.black
                                  : Colors.white,
                                  textsize : 14.sp, textweight: FontWeight.normal),
                                ],
                              ),
                              ],) 
                              
                            
                          
                          
                        )
                          
                        ],
                                       ),
                       );
                                      }
                                      
                                      ),
                     );
                                    }),
                   ), 
            
                   GridView.count(
                   crossAxisCount: 3,
                   crossAxisSpacing: 5,
                   mainAxisSpacing: 5,
                   children: [
                    Container(
                    
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage("Assets/NFT1-min.jpg"))
                      ),
                    ),
                      Container(
                    
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage("Assets/NFT2-min.jpg"))
                      ),
                    ),
                      Container(
                    
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage("Assets/NFT1-min.jpg"))
                      ),
                    ),
                    Container(
                    
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage("Assets/NFT2-min.jpg"))
                      ),
                    ),
                      Container(
                    
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage("Assets/NFT2-min.jpg"))
                      ),
                    ),
                      Container(
                    
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage("Assets/NFT1-min.jpg"))
                      ),
                    ),
                       Container(
                    
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage("Assets/NFT1-min.jpg"))
                      ),
                    ),
                      Container(
                    
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage("Assets/NFT2-min.jpg"))
                      ),
                    ),
                      Container(
                    
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage("Assets/NFT1-min.jpg"))
                      ),
                    ),

                   ],
                   ),
                  //   Text("",
                  //  style: TextStyle(
                  //   color: Colors.black
                  //  )),
                       
                         ]
                         ),
                 ),
               )
            ],
          ),
        ),
      ) 
     ,
    );
  }
}