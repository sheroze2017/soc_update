import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../Components/RoundedButton.dart';
import '../Components/Textfile.dart';
import '../Secure_wallet_video.dart';
import '../Switch_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> userInputList = List.filled(12, '');
  List<TextEditingController> controllers = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 12; i++) {
      controllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    for (int i = 0; i < 12; i++) {
      controllers[i].dispose();
    }
    super.dispose();
  }

  void showTryAgainDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Try again'),
        content: Text('Please enter the correct values.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<dynamic> arguments = Get.arguments;
    final String phrase = arguments[0];
    final String address = arguments[1];
    final String private_key = arguments[2];
    final List<String> suggestList = phrase.split(' ');

    void onSubmitPressed(BuildContext context) {
      bool isMatched = true;
      for (int i = 0; i < suggestList.length; i++) {
        if (userInputList[i].isEmpty || userInputList[i] != suggestList[i]) {
          isMatched = false;
          break;
        }
      }
      if (isMatched) {
        print(phrase);
        print(address);
        print(private_key);
        Get.to(() => Secure_walletvideo(),
            arguments: [phrase, address, private_key]);
      } else {
        showTryAgainDialog(context);
      }
    }

    var padding = MediaQuery.of(context).size.width;
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              SizedBox(
                height: 3.h,
              ),
              Textfile(
                text: 'Import a wallet with Secret',
                textcolor: isLightMode ? Colors.black : Colors.white,
                textsize: 20.sp,
                textweight: FontWeight.bold,
              ),
              Textfile(
                text: 'Recovery Phrase?',
                textcolor: isLightMode ? Colors.black : Colors.white,
                textsize: 20.sp,
                textweight: FontWeight.bold,
              ),
              SizedBox(
                height: 2.h,
              ),
              Textfile(
                text:
                    'Only the first account on this wallet will auto load. After completing this add additional accounts, click the drop down menu, then select create account.',
                textcolor: isLightMode ? Colors.black : Colors.white,
                textsize: 14.sp,
                textweight: FontWeight.normal,
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                children: [
                  Textfile(
                    text: 'Set Recovery Phrase',
                    textcolor: isLightMode ? Colors.black : Colors.white,
                    textsize: 16.sp,
                    textweight: FontWeight.normal,
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),

              SizedBox(height: 16.0),

              Center(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: suggestList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 10);
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(55, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 30,
                            child: Text('${index + 1}'),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 0, right: 75),
                              child: Autocomplete<String>(
                                optionsBuilder:
                                    (TextEditingValue textEditingValue) {
                                  return suggestList
                                      .where((item) => item
                                          .toLowerCase()
                                          .contains(textEditingValue.text
                                              .toLowerCase()))
                                      .toList();
                                },
                                onSelected: (value) {
                                  userInputList[index] = value.toLowerCase();
                                },
                                fieldViewBuilder: (BuildContext context,
                                    TextEditingController textEditingController,
                                    FocusNode focusNode,
                                    VoidCallback onFieldSubmitted) {
                                  controllers[index] = textEditingController;
                                  return TextField(
                                    controller: textEditingController,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 60),
                                      hintText: suggestList[index],
                                      border: OutlineInputBorder(),
                                      isDense: true,
                                    ),
                                    onChanged: (value) {
                                      userInputList[index] =
                                          value.toLowerCase();
                                    },
                                    onSubmitted: (value) {
                                      userInputList[index] =
                                          value.toLowerCase();
                                    },
                                    focusNode: focusNode,
                                    keyboardType: TextInputType.text,
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 16.0),
              // ElevatedButton(
              //   onPressed: () => onSubmitPressed(context),
              //   child: Text('Submit'),
              // ),
              SizedBox(
                height: 5.h,
                width: 27.w,
                child: RoundedButton(
                  buttontext: "Next",
                  buttoncolor: Color(0xff17E9E1),
                  Textcolor: Colors.black,
                  weightfont: FontWeight.normal,
                  Pressed: () => onSubmitPressed(context),
                  fontsize: 15.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
