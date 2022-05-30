import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://covid19.who.int/');

void main() {
  runApp(const MyApp());
}

void _launchUrl() async {
  if (!await launchUrl(_url)) throw 'Could not launch $_url';
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid Contact Tracing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Covid Contact Tracing'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/contact3.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Text(
                'Welcome to the Covid Contact Tracing App!',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                  //backgroundColor: Colors.blue,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Text(
                'Our services',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                  //backgroundColor: Colors.blue,
                ),
              ),
            ),
            const Card(
              child: ListTile(
                title: Text("Contact Tracing"),
              ),
            ),
            const Card(
              child: ListTile(
                title: Text("Symptoms Survey"),
              ),
            ),
            const Card(
              child: ListTile(
                title: Text("BMI Calculator"),
              ),
            ),
            Card(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/contact2.jpg'),
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.topCenter),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green),
                    // child:Image.asset(
                    //  "images/contact2.jpg",
                    //  height: 20,
                    //  width: 20,
                    // ),
                  ),
                  Container(
                      child: ListTile(
                    title: Text("Uploading PCR"),
                  )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Text(
                'For more information on COVID, click the button below to visit the WHO website',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 13,
                  //backgroundColor: Colors.blue,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: Colors.blue,
              ),
              onPressed: _launchUrl,
              child: Text(
                'visit website',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Image.asset(
              'images/EMULOGO.jpeg',
              height: 150,
              width: 150,
            ),
          ],
        ),
      ),

      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
