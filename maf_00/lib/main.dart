import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double mScreenHeight = MediaQuery.of(context).size.height;
    double mScreenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: mScreenHeight,
        width: mScreenWidth,
        child: Stack(
          children: <Widget>[
            buildProfileImage(mScreenHeight, mScreenWidth),
            Positioned(
              top: mScreenHeight / 2.3,
              child: Container(
                height: mScreenHeight / 1.7,
                width: mScreenWidth,
                decoration: BoxDecoration(
                  color: Color(0xeef5f4ff),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    spacerHeight20(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildUserName(),
                        buildEditButton(),
                      ],
                    ),
                    spacerHeight20(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildCategory("500", "Following"),
                        buildCategory("20M", "Followers"),
                        buildCategory("1.2k", "Posts"),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          spacerHeight20(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildCategoryType(
                                  imagePath: "assets/photos.png",
                                  title: "Photos"),
                              buildCategoryType(
                                  imagePath: "assets/audio.png",
                                  title: "Audio"),
                              buildCategoryType(
                                  imagePath: "assets/video.png",
                                  title: "Video"),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50.0, vertical: 20),
                            child: Divider(
                              height: 10,
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildCategoryType(
                                  imagePath: "assets/phone.png", title: "Call"),
                              buildCategoryType(
                                  imagePath: "assets/chat.png",
                                  title: "Message"),
                              buildCategoryType(
                                  imagePath: "assets/activity.png",
                                  title: "Activity"),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xFf8643FF), Color(0xff4136F1)],
          ),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: 0,
          backgroundColor: Colors.transparent,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
                color: Color(0xFf8643FF),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard_rounded,
                size: 30,
                color: Color(0xFf8643FF),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.white,
                ),
                label: '')
          ],
        ),
      ),
    );
  }

  Column buildCategoryType({String imagePath, String title}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset(imagePath),
        ),
        Text(title)
      ],
    );
  }

  Column buildCategory(String value, String title) {
    return Column(
      children: [
        Text(
          "$value",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text("$title")
      ],
    );
  }

  SizedBox spacerHeight20() => SizedBox(height: 20);

  Widget buildEditButton() {
    return GestureDetector(
      onTap: () {
        print("Flutter rocks");
      },
      child: Container(
        height: 35,
        width: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xFf8643FF), Color(0xff4136F1)])),
        child: Center(
          child: Text(
            "Edit",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  buildUserName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Sedem Balfour",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text("Accra, Ghana")
      ],
    );
  }

  Container buildProfileImage(double mScreenHeight, double mScreenWidth) {
    return Container(
      height: mScreenHeight,
      width: mScreenWidth,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.white, Colors.red[200]])),
      child: Column(
        children: [
          Image.asset("assets/sedem.png"),
        ],
      ),
    );
  }
}
