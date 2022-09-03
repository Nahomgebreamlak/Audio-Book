import 'dart:async';
import './floating_audio_player.dart';
import './viewcontroler.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class PDFScreen6 extends StatefulWidget {
  final String path;
  int pagenumber;
  PDFScreen6({Key key, this.path, this.pagenumber}) : super(key: key);

  _PDFScreenState6 createState() => _PDFScreenState6();
}

class _PDFScreenState6 extends State<PDFScreen6> with WidgetsBindingObserver {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  final ViewPageController viewcontroler = Get.put(ViewPageController());

  RxInt pages = 0.obs;
  RxInt currentPage = 0.obs;
  bool isReady = false;
  String errorMessage = '';
  Orientation _lastScreenOrientation;

  bool isPlayerOpenedch1 = false;
  bool _isLoadingch1 = true;
  int _page = 0;
  final box = GetStorage();
  @override
  void initState() {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setInt('pagenumber', 8);
    if (box.read('pagenumber6') == null) {
      box.write('pagenumber6', 0);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _lastScreenOrientation = MediaQuery.of(context).orientation;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _launchURL() async {
      const url = 'https://t.me/BSMEZAhtsebeni/349';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    if (_lastScreenOrientation != null &&
        _lastScreenOrientation != MediaQuery.of(context).orientation) {
      // Completely render the page.
      Future.delayed(Duration(microseconds: 100), _repushViewer);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("ዝተሓርደ ገንሸል"),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            // icon: Icon(Icons.share),
            icon: new Image.asset('assets/telegram.png'),

            onPressed: _launchURL,
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          PDFView(
            filePath: widget.path,
            // enableSwipe: true,
            // swipeHorizontal: true,
            autoSpacing: false,
            pageFling: true,
            pageSnap: true,
            // defaultPage: widget.pagenumber,
            // defaultPage: viewcontroler.pagenumber.value,
            defaultPage: box.read('pagenumber6'),
            fitPolicy: FitPolicy.BOTH,
            preventLinkNavigation:
                false, // if set to true the link is handled in flutter
            onRender: (_pages) {
              viewcontroler.setPagenumber6();
              setState(() {
                //  pages.value = _pages;
                pages.value = viewcontroler.pagenumber6.value;

                print(" render page ${pages.value}");

                isReady = true;
              });
            },
            onError: (error) {
              setState(() {
                errorMessage = error.toString();
              });
              print(error.toString());
            },
            onPageError: (page, error) {
              setState(() {
                errorMessage = '$page: ${error.toString()}';
              });
              print('$page: ${error.toString()}');
            },
            onViewCreated: (PDFViewController pdfViewController) {
              _controller.complete(pdfViewController);
            },
            onLinkHandler: (String uri) {
              print('goto uri: $uri');
            },
            onPageChanged: (int page, int total) {
              print('page change: $page/$total');
              setState(() {
                currentPage.value = page;
                box.write("pagenumber6", currentPage.value);
                print("bax value ${box.read('pagenumber5')}");
                print(" Current Page ${currentPage.value}");
              });
            },
          ),
          errorMessage.isEmpty
              ? !isReady
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container()
              : Center(
                  child: Text(errorMessage),
                )
        ],
      ),
      floatingActionButton: floatingActionItem,
    );
  }

  onPaused() {
    setState(() {
      isPlayerOpenedch1 = false;
    });
  }

  get floatingActionItem {
    Widget floatingPlayer = FloatingAudioPlayer(
        onPaused: onPaused,
        audiopath: "assets/chapter6.m4a",
        musicduration: "musicplayerch6");

    Widget floatingActionButton = FloatingActionButton(
      onPressed: () {
        setState(() {
          isPlayerOpenedch1 = true;
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
      child: isPlayerOpenedch1 ? floatingPlayer : floatingActionButton,
    );
  }

  _repushViewer() {
    // Navigator.of(context).pushReplacementNamed(/*YOUR PDF VIEWER PAGE ROUTE */);
    if (widget.path != null || widget.path.isNotEmpty) {
      //  Navigator.of(context).pushReplacementNamed();
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PDFScreen6(
            path: widget.path,
            pagenumber: 0,
          ),
        ),
      );
    }
  }
}
