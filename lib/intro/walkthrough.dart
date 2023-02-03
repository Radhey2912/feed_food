//Author : Prachi Nathjogi
//Author : Digambar Chaudhari
//Date : 19-01-23

import 'package:feed_food/intro/welcome_page.dart';
import 'package:feed_food/utils/routes.dart';
import 'package:feed_food/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class Walkthrough extends StatefulWidget {
  const Walkthrough({super.key});

  @override
  State<Walkthrough> createState() => _WalkthroughState();
}

class _WalkthroughState extends State<Walkthrough> {
// controller to keep track of which page we're on
  PageController _controller = PageController();

// keep track of if we are on the last page or not
bool onLastPage = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            },
            );
            
          },
          children: [
            // container are the walkthrough pages.
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/walk1.png"),
                    fit: BoxFit.fill),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 620,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        FeedFoodStrings.Whead1,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Text(
                      FeedFoodStrings.subtittle1,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/walk2.png"),
                    fit: BoxFit.fill),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 620,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        FeedFoodStrings.Whead2,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Text(
                      FeedFoodStrings.subtittle2,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/walk3.png"),
                    fit: BoxFit.fill),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 620,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        FeedFoodStrings.Whead3,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Text(
                      FeedFoodStrings.subtittle3,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),

        //dot indicators
        Container(
            alignment: Alignment(0, 0.95),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //skip
                GestureDetector(
                  onTap: (){
                    _controller.previousPage(duration: Duration(microseconds: 500), 
                    curve: Curves.easeIn
                    );
                  },
                  child: Text("previous",
                  style: TextStyle(color: Colors.white, fontSize: 18)
                  )
                  ),

                // dot indicator
                SmoothPageIndicator(controller: _controller, count: 3,
                                    axisDirection:Axis.horizontal,
                                    effect: SlideEffect(
                                      radius: 9.0,
                                      dotWidth: 8.0,
                                      dotHeight: 8.0,
                                      activeDotColor: Colors.white
                                      ),
                                      ),

                //net or done
                onLastPage
                ? GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return WelcomePage();
                    },
                    ),
                    );
                  },
                  child: Text("done",
                  style: TextStyle(color: Colors.white, fontSize: 18)
                  )
                  )
                  :GestureDetector(
                  onTap: (){
                    _controller.nextPage(duration: Duration(microseconds: 500), 
                    curve: Curves.easeIn
                    );
                  },
                  child: Text("next",
                  style: TextStyle(color: Colors.white, fontSize: 18)
                  )
                  ),
               
              ],
            )),
      ],
      ),
    );
  }
}
