import 'package:desktop/custom_widgets/board_screen.dart';
import 'package:desktop/onboarding/choose_account.dart';
import 'package:desktop/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  final controller = PageController();
  bool isLastPage = false;
  int currentIndex =0;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(ProjectColors.background),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.only(bottom: 80),
            child: PageView(
              controller: controller,
              onPageChanged: (index){
                setState(() {
                  isLastPage = index ==2;
                  currentIndex = index;
                });
              },
              children: const [
                BoardScreen(
                    title: "Hungry for delicious food? 😊",
                    desc:
                        "With Mobile Eats, you can explore a variety of local restaurants, order your favorite dishes, and have them delivered right to your doorstep.",
                    image: "assets/boarding/onboarding1.png"),
                BoardScreen(
                    title: "Welcome to Mobile Eat 😊",
                    desc:
                        "With Mobile Eats, you can explore a variety of local restaurants, order your favorite dishes, and have them delivered right to your doorstep.",
                    image: "assets/boarding/onboarding2.png"),
                BoardScreen(
                    title: "Hassle-free payment 😊",
                    desc:
                        "Rest assured, your payments are secure and hassle-free with our trusted payment system.Sign up now and start exploring!",
                    image: "assets/boarding/onboarding3.png"),

              ],
            ),
          ),
        ),
      bottomSheet: Container(
        color: const Color(ProjectColors.background),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 160,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               currentIndex ==0? TextButton(
                   onPressed: (){controller.jumpToPage(2);},
                   child: const Text("SKIP", style: TextStyle(color: Colors.white),)
               ):  TextButton(
                   onPressed: (){
                     controller.previousPage(
                         duration: const Duration(milliseconds: 500),
                         curve: Curves.easeInOut
                     );
                   },
                   child: const Icon(Icons.chevron_left, color: Colors.white,)
               ),
                Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,

                      effect: const WormEffect(
                        spacing: 16,
                        dotColor: Colors.white,
                        activeDotColor: Color(ProjectColors.brown),

                      ),
                      onDotClicked: (index)=>controller.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn
                      ),
                    )
                ),
                currentIndex==2?const SizedBox(width: 10,):TextButton(
                    onPressed: (){
                      controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut
                      );
                    },
                    child: const Icon(Icons.chevron_right, color: Colors.white,)
                )
              ],
            ),

            Column(
              children: [
            currentIndex ==0? TextButton(
                    onPressed: (){},
                    style: TextButton.styleFrom(
                        foregroundColor: const Color(ProjectColors.textColorGreen), shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                        backgroundColor: const Color(ProjectColors.brown),
                        minimumSize: const Size.fromHeight(50.0)
                    ),
                    child:  const  Text(
                      "Let get Started",
                      style: TextStyle(
                          fontSize: 16
                      ),)
                ):currentIndex ==1? TextButton(
                onPressed: (){},
                style: TextButton.styleFrom(
                    foregroundColor: const Color(ProjectColors.textColorGreen), shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                    backgroundColor: const Color(ProjectColors.brown),
                    minimumSize: const Size.fromHeight(50.0)
                ),
                child:  const  Text(
                  "Start exploring",
                  style: TextStyle(
                      fontSize: 16
                  ),)
            ): TextButton(
                onPressed: (){
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => const ChooseAccount()));
                },
                style: TextButton.styleFrom(
                    foregroundColor: const Color(ProjectColors.textColorGreen), shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                    backgroundColor: const Color(ProjectColors.brown),
                    minimumSize: const Size.fromHeight(50.0)
                ),
                child:  const  Text(
                  "Sign up",
                  style: TextStyle(
                      fontSize: 16
                  ),)
            ),
                const SizedBox(height: 7,),
                currentIndex == 2?SizedBox():TextButton(
                  onPressed: (){
                    controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut
                    );
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: const Color(ProjectColors.brown), shape:RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                    side: const BorderSide(
                      color: Color(ProjectColors.brown),
                    ),
                  ),
                      backgroundColor:  Colors.transparent,
                      minimumSize: const Size.fromHeight(50.0)
                  ),
                  child:  const  Text(
                    "Next",
                    style: TextStyle(
                        fontSize: 16
                    ),),
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}
