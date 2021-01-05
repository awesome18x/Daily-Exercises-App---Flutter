import 'package:exercide_app/constants.dart';
import 'package:exercide_app/main.dart';
import 'package:exercide_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsScreen extends StatelessWidget {
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
              color: kBlueLightColor,
              image: DecorationImage(
                image: AssetImage('assets/images/meditation_bg.png'),
                // fit: BoxFit.fitWidth
              )
            ),
          ),
          SizedBox(height: 20,),
          SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Text(
                    'Meditation',
                    style: Theme.of(context).textTheme.display1.copyWith(fontWeight: FontWeight.w900)
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '3-10 Min Course',
                      style: TextStyle(fontWeight: FontWeight.bold)
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: size.width * .6,
                      child: Text(
                        'Live happier and healthier by learning the fundamentals of mindfulness'
                      ),
                    ),
                    SizedBox(
                      width: size.width * .5,
                      child: SearchBar()
                    ),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: <Widget>[
                        SessionCard(
                          seassionNum: 1,
                          isDone: true,
                        ),
                        SessionCard(
                          seassionNum: 2,
                        ),
                        SessionCard(
                          seassionNum: 3,
                          isDone: true,
                        ),
                        SessionCard(
                          seassionNum: 4,
                        ),
                        SessionCard(
                          seassionNum: 5,
                          isDone: true,
                        ),
                        SessionCard(
                          seassionNum: 6,
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Meditation',
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      padding: EdgeInsets.all(10),
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13)
                      ),
                      child: Row(
                        children: <Widget>[
                          SvgPicture.asset("assets/icons/Meditation_women_small.svg"),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Basic 2',
                                  style: Theme.of(context).textTheme.subtitle
                                ),
                                Text("Start your deepen you practice")
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset("assets/icons/Lock.svg"),
                          ),
                        ],
                      )
                    )
                  ],
                ),
              )
          )
        ],
      )

    );
  }
}

class SessionCard extends StatelessWidget {
  final int seassionNum;
  final bool isDone;
  const SessionCard({
    Key key,
    this.seassionNum,
    this.isDone = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
        return Container(
          width: constraint.maxWidth / 2 -10,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0,17),
                blurRadius: 23,
                spreadRadius: -13,
                color: kShadowColor
              )
            ]
          ),
          child: Row(
            children: <Widget>[
              Container(
                height: 42,
                width: 43,
                decoration: BoxDecoration(
                  color: isDone ? kBlueColor : Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: kBlueColor)
                ),
                child: Icon(
                  Icons.play_arrow,
                  color: isDone ?  Colors.white : kBlueColor
                ),
              ),
              SizedBox(width: 10,),
              Text(
                  'Session $seassionNum',
                style: Theme.of(context).textTheme.subtitle,
              )
            ],
          )
        );
      }
    );
  }
}