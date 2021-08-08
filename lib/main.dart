import 'package:campaign_app/donation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Campaign Donate',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Donation> donations = [
    Donation(
        name: "Autisme",
        description: "Donasi Untuk Autisme",
        image: "assets/images/donation1.png"),
    Donation(
        name: "Autisme 2",
        description: "Donasi Untuk Autisme",
        image: "assets/images/donation3.png"),
    Donation(
        name: "Autisme 3",
        description: "Donasi Untuk Autisme",
        image: "assets/images/donation1.png"),
    Donation(
        name: "Autisme 4",
        description: "Donasi Untuk Autisme",
        image: "assets/images/donation3.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              // ignore: prefer_const_constructors
              ImageSlideshow(
                width: double.infinity,
                height: 200,
                initialPage: 0,
                indicatorColor: Colors.blue,
                indicatorBackgroundColor: Colors.grey,

                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Image.asset(
                    'assets/images/payment.png',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/paymentss.png',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/donation1.png',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/donation2.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/donation3.png',
                    fit: BoxFit.cover,
                  ),
                ],
                onPageChanged: (value) {
                  // ignore: avoid_print
                  print('Page changed: $value');
                },

                /// Auto scroll interval.
                /// Do not auto scroll with null or 0.
                autoPlayInterval: 3000,
              ),
              // ignore: prefer_const_constructors
              Text(
                'Headline',
                // ignore: prefer_const_constructors
                style: TextStyle(fontSize: 18),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: donations.length,
                  // ignore: avoid_types_as_parameter_names
                  itemBuilder: (context, int) => Card(
                      child: Column(
                    children: <Widget>[
                      Image(
                        image: AssetImage(donations[int].image),
                        width: 160.0,
                        height: 100.0,
                      ),
                      Text(donations[int].name),
                      Text(donations[int].description)
                    ],
                  )),
                ),
              ),
              const Text(
                'Demo Headline 2',
                style: TextStyle(fontSize: 18),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  // ignore: avoid_types_as_parameter_names
                  itemCount: donations.length,
                  // ignore: avoid_types_as_parameter_names
                  itemBuilder: (ctx, int) {
                    return Card(
                      child: ListTile(
                          title: Text(donations[int].name),
                          leading:
                              Image(image: AssetImage(donations[int].image)),
                          subtitle: Text(donations[int].description)),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueAccent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          // Respond to item press.
        },
        items: const [
          BottomNavigationBarItem(
              // ignore: deprecated_member_use
              title: Text('Home'),
              icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              // ignore: deprecated_member_use
              title: Text('Donate'),
              icon: Icon(Icons.account_balance)),
          BottomNavigationBarItem(
              // ignore: deprecated_member_use
              title: Text('Account'),
              icon: Icon(Icons.account_circle)),
        ],
      ),
    );
  }
}
