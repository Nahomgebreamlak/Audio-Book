import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zteharde_genshel/pdfpage.dart';
import 'chapter2.dart';
import 'chapter3.dart';
import 'chapter4.dart';
import 'chapter5.dart';
import 'chapter6.dart';
import 'chapter7.dart';
import 'chapter8.dart';
import 'floating_audio_player.dart';
import 'medemdemta.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  //Color myHexColor = Color(0xff123456);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ዝተሓርደ ገንሸል',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPlayerOpened = false;
  bool _isLoading = true;

  String pathPDF = "";
  String pathPDF2 = "";
  String pathPDF3 = "";
  String pathPDF4 = "";
  String pathPDF5 = "";
  String pathPDF6 = "";
  String pathPDF7 = "";
  String pathPDF8 = "";
  String medemdemta = "";

  String landscapePathPdf = "";
  String remotePDFpath = "";
  String corruptedPathPDF = "";

  @override
  void initState() {
    super.initState();
    fromAsset('assets/chapter1.pdf', 'chapter1.pdf').then((f) {
      setState(() {
        pathPDF = f.path;
      });
    });

    fromAsset('assets/chapter2.pdf', 'chapter2.pdf').then((f) {
      setState(() {
        pathPDF2 = f.path;
      });
    });

    fromAsset('assets/chapter3.pdf', 'chapter3.pdf').then((f) {
      setState(() {
        pathPDF3 = f.path;
      });
    });

    fromAsset('assets/chapter4.pdf', 'chapter4.pdf').then((f) {
      setState(() {
        pathPDF4 = f.path;
      });
    });

    fromAsset('assets/chapter5.pdf', 'chapter5.pdf').then((f) {
      setState(() {
        pathPDF5 = f.path;
      });
    });
    fromAsset('assets/chapter6.pdf', 'chapter6.pdf').then((f) {
      setState(() {
        pathPDF6 = f.path;
      });
    });

    fromAsset('assets/chapter7.pdf', 'chapter7.pdf').then((f) {
      setState(() {
        pathPDF7 = f.path;
      });
    });
    fromAsset('assets/chapter8.pdf', 'chapter8.pdf').then((f) {
      setState(() {
        pathPDF8 = f.path;
      });
    });
    fromAsset('assets/medemdemta.pdf', 'medemdemta.pdf').then((f) {
      setState(() {
        medemdemta = f.path;
      });
    });
  }

  Future<File> fromAsset(String asset, String filename) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    Completer<File> completer = Completer();

    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    final drawerItems = Container(
        color: Colors.grey[200],
        child: ListView(
          children: [
            DrawerHeader(
                // decoration: BoxDecoration(
                //     image: DecorationImage(
                //         image: AssetImage("assets/headerztehardegenshel.png"),
                //         fit: BoxFit.contain)),
                // child: Column(
                //     children: [Text("Tergami"), Text(" Petros .........")]),

                child: ClipRect(
              child: Stack(
                children: <Widget>[
                  Container(
                    //height: 250,
                    //width: 500,
                    child: Image.asset(
                      "assets/headerztehardegenshel.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    left: 0.0,
                    bottom: 0.0,
                    child: Container(
                      height: 60,
                      width: 340,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.black, Colors.black12],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10.0,
                    bottom: 10.0,
                    right: 20.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              "ተርጓሚ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),  
                            Row(
                              //ዲያቆን ጴጥሮስ  ጸጋይ
                              children: <Widget>[
                                Text(
                                  "ዲያቆን ጴጥሮስ  ጸጋይ ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              "ኣሰናዳኢ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.orangeAccent,
                                fontSize: 18.0,
                              ),
                            ),
                            Text(
                              "የሺጥላ ብርሃኑ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[200],
                                  fontSize: 14.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
            ListTile(
              title: Text("ምዕራፍ  1", style: TextStyle(fontSize: 17)),
              leading: Image.asset("assets/ic_library_books_black_24dp.png"),
              onTap: () {
                if (pathPDF != null || pathPDF.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PDFScreen(
                        path: pathPDF,
                        pagenumber: 0,
                      ),
                    ),
                  );
                }
              },
            ),
            ListTile(
              title: Text("ምዕራፍ  2", style: TextStyle(fontSize: 17)),
              leading: Image.asset("assets/ic_library_books_black_24dp.png"),
              onTap: () {
                if (pathPDF2 != null || pathPDF2.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PDFScreen2(
                        path: pathPDF2,
                        pagenumber: 0,
                      ),
                    ),
                  );
                }
              },
            ),
            ListTile(
              title: Text("ምዕራፍ  3", style: TextStyle(fontSize: 17)),
              leading: Image.asset("assets/ic_library_books_black_24dp.png"),
              onTap: () async {
                if (pathPDF3 != null || pathPDF3.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PDFScreen3(
                        path: pathPDF3,
                        pagenumber: 0,
                      ),
                    ),
                  );
                }
              },
            ),
            ListTile(
              title: Text("ምዕራፍ  4", style: TextStyle(fontSize: 17)),
              leading: Image.asset("assets/ic_library_books_black_24dp.png"),
              onTap: () {
                if (pathPDF4 != null || pathPDF4.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PDFScreen4(
                        path: pathPDF4,
                        pagenumber: 0,
                      ),
                    ),
                  );
                }
              },
            ),
            ListTile(
              title: Text("ምዕራፍ  5", style: TextStyle(fontSize: 17)),
              leading: Image.asset("assets/ic_library_books_black_24dp.png"),
              onTap: () {
                if (pathPDF5 != null || pathPDF5.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PDFScreen5(
                        path: pathPDF5,
                        pagenumber: 0,
                      ),
                    ),
                  );
                }

                //   changePDF(1);
              },
            ),
            ListTile(
              title: Text("ምዕራፍ  6", style: TextStyle(fontSize: 17)),
              leading: Image.asset("assets/ic_library_books_black_24dp.png"),
              onTap: () {
                if (pathPDF6 != null || pathPDF6.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PDFScreen6(
                        path: pathPDF6,
                        pagenumber: 0,
                      ),
                    ),
                  );
                }
              },
            ),
            ListTile(
              title: Text("ምዕራፍ 7", style: TextStyle(fontSize: 17)),
              leading: Image.asset("assets/ic_library_books_black_24dp.png"),
              onTap: () {
                //   changePDF(1);

                if (pathPDF7 != null || pathPDF7.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PDFScreen7(
                        path: pathPDF7,
                        pagenumber: 0,
                      ),
                    ),
                  );
                }
              },
            ),
            ListTile(
              title: Text("ምዕራፍ 8", style: TextStyle(fontSize: 17)),
              leading: Image.asset("assets/ic_library_books_black_24dp.png"),
              onTap: () {
                if (pathPDF8 != null || pathPDF8.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PDFScreen8(
                        path: pathPDF8,
                        pagenumber: 0,
                      ),
                    ),
                  );
                }
              },
            ),
            ListTile(
              title: Text("መደምደምታ", style: TextStyle(fontSize: 17)),
              leading: Image.asset("assets/ic_library_books_black_24dp.png"),
              onTap: () {
                if (medemdemta != null || medemdemta.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PDFScreen9(
                        path: medemdemta,
                        pagenumber: 0,
                      ),
                    ),
                  );
                }

                //   changePDF(1);
              },
            ),
            ListTile(
              title: Text("Developer : Nahom Gebreamlak",
                  style: TextStyle(fontSize: 12)),
              leading: Icon(
                Icons.android,
                color: Colors.green,
              ),
            ),
          ],
        ));

    return Scaffold(
      appBar: AppBar(title: Text('ዝተሓርደ ገንሸል')),
      drawer: Drawer(
        child: drawerItems,
      ),
      body: Scrollbar(
          child: ListView(children: [
        ListTile(
            leading: Container(
              child: Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/smallbook.png")))),
            ),
            title: Text(
              "ምዕራፍ 1",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("ዓቢይ ግልጸት "),
            onTap: () {
              //   changePDF(1);

              if (pathPDF != null || pathPDF.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PDFScreen(
                      path: pathPDF,
                      pagenumber: 0,
                    ),
                  ),
                );
              }
            }),
        ListTile(
            leading: Container(
              child: Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/smallbook.png")))),
            ),
            title: Text(
              "ምዕራፍ 2",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("ቅድሚ ምፍጣር ዓለም ኃረየና"),
            onTap: () {
              //   changePDF(1);

              if (pathPDF2 != null || pathPDF2.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PDFScreen2(
                      path: pathPDF2,
                      pagenumber: 0,
                    ),
                  ),
                );
              }
            }),
        ListTile(
            leading: Container(
              child: Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/smallbook.png")))),
            ),
            title: Text(
              "ምዕራፍ 3",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("ናይ መጀመርታ ሰባት"),
            onTap: () {
              //   changePDF(1);

              if (pathPDF3 != null || pathPDF3.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PDFScreen3(
                      path: pathPDF3,
                      pagenumber: 0,
                    ),
                  ),
                );
              }
            }),
        ListTile(
            leading: Container(
              child: Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/smallbook.png")))),
            ),
            title: Text(
              "ምዕራፍ 4",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("ዘመነ አበው"),
            onTap: () {
              //   changePDF(1);

              if (pathPDF4 != null || pathPDF4.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PDFScreen4(
                      path: pathPDF4,
                      pagenumber: 0,
                    ),
                  ),
                );
              }
            }),
        ListTile(
            leading: Container(
              child: Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/smallbook.png")))),
            ),
            title: Text(
              "ምዕራፍ 5",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("ገንሸል ፋሲካ"),
            onTap: () {
              //   changePDF(1);

              if (pathPDF5 != null || pathPDF5.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PDFScreen5(
                      path: pathPDF5,
                      pagenumber: 0,
                    ),
                  ),
                );
              }
            }),
        ListTile(
            leading: Container(
              child: Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/smallbook.png")))),
            ),
            title: Text(
              "ምዕራፍ 6",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("መኅደሪ ድንኳን"),
            onTap: () {
              //   changePDF(1);

              if (pathPDF6 != null || pathPDF6.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PDFScreen6(
                      path: pathPDF6,
                      pagenumber: 0,
                    ),
                  ),
                );
              }
            }),
        ListTile(
            leading: Container(
              child: Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/smallbook.png")))),
            ),
            title: Text(
              "ምዕራፍ 7",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("ሰሎሞን ዝሰርሖ ቤተ መቕደስ"),
            onTap: () {
              //   changePDF(1);

              if (pathPDF7 != null || pathPDF7.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PDFScreen7(
                      path: pathPDF7,
                      pagenumber: 0,
                    ),
                  ),
                );
              }
            }),
        ListTile(
            leading: Container(
              child: Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/smallbook.png")))),
            ),
            title: Text(
              "ምዕራፍ 8",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("ፈጻሜ ተስፋ"),
            onTap: () {
              //   changePDF(1);

              if (pathPDF8 != null || pathPDF8.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PDFScreen8(
                      path: pathPDF8,
                      pagenumber: 0,
                    ),
                  ),
                );
              }
            }),
        ListTile(
            leading: Container(
              child: Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/smallbook.png")))),
            ),
            title: Text(
              "መደምደምታ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(""),
            onTap: () {
              //   changePDF(1);

              if (medemdemta != null || medemdemta.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PDFScreen9(
                      path: medemdemta,
                      pagenumber: 0,
                    ),
                  ),
                );
              }
            }),
      ])),
      // floatingActionButton: floatingActionItem,
    );
  }

  onPaused() {
    setState(() {
      isPlayerOpened = false;
    });
  }

  get floatingActionItem {
    Widget floatingPlayer = FloatingAudioPlayer(onPaused: onPaused);

    Widget floatingActionButton = FloatingActionButton(
      onPressed: () {
        setState(() {
          isPlayerOpened = true;
        });
      },
      child: Icon(Icons.play_arrow_outlined),
    );

    return AnimatedSwitcher(
      reverseDuration: Duration(milliseconds: 0),
      duration: const Duration(milliseconds: 200),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return ScaleTransition(child: child, scale: animation);
      },
      child: isPlayerOpened ? floatingPlayer : floatingActionButton,
    );
  }
}
