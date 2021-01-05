import 'package:exercide_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'screens/details_screen.dart';
import 'widgets/bottom_nav_bar.dart';
import 'widgets/category_card.dart';
import 'widgets/search_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: "Cairo",
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor)
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNav(),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xFFF5CEB8),
              image: DecorationImage(
                image: AssetImage('assets/images/undraw_pilates_gpdb.png'),
                alignment: Alignment.centerLeft
              )
            ),
          ),
          SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        alignment: Alignment.center,
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          color: Color(0xFFF2BEA1),
                          shape: BoxShape.circle
                        ),
                        child: SvgPicture.asset('assets/icons/menu.svg'),
                      ),
                    ),
                    Text(
                        'Good Morign \nShooshi',
                        style: Theme.of(context).textTheme.display1.copyWith(fontWeight: FontWeight.bold)
                    ),
                    SearchBar(),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: .85,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        children: <Widget>[
                          CategoryCard(
                            svgSrc: 'assets/icons/Hamburger.svg',
                            title: 'Diet Recommendation',
                            press: () {}

                          ),
                          CategoryCard(
                              svgSrc: 'assets/icons/Excrecises.svg',
                              title: 'Kegel Exercises',
                              press: () {}
                          ),
                          CategoryCard(
                              svgSrc: 'assets/icons/Meditation.svg',
                              title: 'Meditation',
                              press: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return DetailsScreen();
                                    })
                                );
                              }
                          ),
                          CategoryCard(
                              svgSrc: 'assets/icons/yoga.svg',
                              title: 'Yoga',
                              press: () {}
                          ),

                        ],
                      ),
                    )

                  ],
                ),
              )
          )
        ],
      ),
    );

  }
}


class BottomNav extends StatelessWidget {
  const BottomNav({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ButtomNavItem(
            title: 'Today',
            svgSrc: 'assets/icons/calendar.svg',
            isActive: true,

          ),
          ButtomNavItem(
            title: 'All Excercise',
            svgSrc: 'assets/icons/gym.svg',
          ),
          ButtomNavItem(
            title: 'Settings',
            svgSrc: 'assets/icons/Settings.svg'
          )
        ],
      ),
    );
  }
}






