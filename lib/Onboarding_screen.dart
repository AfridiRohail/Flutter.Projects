import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardind extends StatefulWidget {
  const OnBoardind({Key? key}) : super(key: key);

  @override
  State<OnBoardind> createState() => _OnBoardindState();
}

class _OnBoardindState extends State<OnBoardind> {
  final Controler = PageController();
  @override
  void dispose() {
    Controler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: Controler,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/cake.jpg'),
                  ),
                  SizedBox(height: 10,),
                  ListTile(
                    title: Text(
                      'Welcome To BreadChef',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                    ),
                    subtitle: Text(
                        'Lorem Ipsum is  the bakery of all kind of sweets and cakes simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 120),
              child: Column(
                children: [
                  Image(
                    image: AssetImage('assets/delivery.png'),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ListTile(
                    title: Text(
                      'Fast Delivery',
                      style: TextStyle(fontSize: 30),
                    ),
                    subtitle: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry'),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/recive.jpg'),
                  ),
                  SizedBox(height: 20,),
                  ListTile(
                    title: Text('Cash On Delivery',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    subtitle: Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting  in the cakes and the sweets in the bakery industry. Lorem Ipsum has been the industry'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              child: Text('Skip'),
              onPressed: () => Controler.jumpToPage(2),
            ),
            Center(
              child: SmoothPageIndicator(
                controller: Controler,
                count: 3,
                effect: WormEffect(
                  spacing: 16,
                  dotColor: Colors.red,
                  activeDotColor: Colors.green,
                ),
                onDotClicked: (index) => Controler.animateToPage(index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn),
              ),
            ),
            TextButton(
              child: const Text('Next'),
              onPressed: () => Controler.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut),
            ),
          ],
        ),
      ),
    );
  }
}
