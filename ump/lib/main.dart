import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ump/pages/otherpage.dart';
import 'package:ump/pages/pageaudio.dart';
import 'package:ump/pages/pagecamera.dart';
import 'package:ump/pages/pageplace.dart';
import 'package:ump/pages/pagevideo.dart';

void main() => runApp(MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;

  //create all the pages
  final PageAudio _listProducts = PageAudio();
  final PageVideo _clients = new PageVideo();
  final PageCamera _sites = new PageCamera();
  final PagePlace _flutterpages = new PagePlace();
  final OtherPage _otherpages = new OtherPage();
  Widget _showPage = new PageAudio();

  Widget _pageChooser(int page){
    switch (page){
      case 0:
      return _listProducts;
      break;

      case 1:
      return _clients;
      break;

      case 2:
      return _sites;
      break;

      case 3:
      return _flutterpages;
      break;

      case 4:
      return _otherpages;
      break;

      default :
      return new Container(
        child: new Center(
          child: new Text(
            'No Page found By page Chooser.',
            style: new TextStyle(fontSize: 30),
          )
        )
      );
          }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index: pageIndex,
          items: <Widget>[
            Icon(Icons.home, size: 25),
            Icon(Icons.search, size: 25),
            Icon(Icons.camera, size: 25),
            Icon(Icons.call_split, size: 25),
            Icon(Icons.perm_identity, size: 25),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.blueAccent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (int tappedIndex) {
            setState(() {
              _showPage = _pageChooser(tappedIndex);
            });
          },
        ),
        body: Container(
          color: Colors.blueAccent,
          child: Center(
                //child :Text(_page.toString(), textScaleFactor: 10.0),
                child: _showPage,
            ),
          ));
  }
}
 
