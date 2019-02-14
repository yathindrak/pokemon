import 'package:flutter/material.dart';
import './page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String currentProfileCover = "https://api.androidhive.info/images/nav-menu-header-bg.jpg";
  String currentProfilePic = "https://cdn-images-1.medium.com/max/1200/1*DK3dn70fM0LHmF1ZnXsMag.jpeg";
  String otherProfilePic = "https://avatars0.githubusercontent.com/u/5999543?s=460&v=4";

  void switchAccounts() {
    String picBackup = currentProfilePic;
    this.setState(() {
      currentProfilePic = otherProfilePic;
      otherProfilePic = picBackup;
    });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokemon"),
        backgroundColor: Colors.cyan,
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the Drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          //padding: EdgeInsets.zero,
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Yathindra Kodithuwakku"),
              accountEmail:  new Text("yathindra@testmail.com"),
              currentAccountPicture: new GestureDetector(
                onTap: () => print("This is your current account."),
                child: CircleAvatar(
                  backgroundImage: new NetworkImage(currentProfilePic),
                ),
              ),
              otherAccountsPictures: <Widget>[
                new GestureDetector(
                  child: CircleAvatar(
                    backgroundImage: new NetworkImage(otherProfilePic),
                  ),
                  onTap: () => switchAccounts()
                ),
              ],
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage(currentProfileCover)
                )
              ),
            ),
            new ListTile(
              title: new Text("Page One"),
              trailing: new Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page("Page One")));
              }
            ),
            new ListTile(
              title: new Text("Page Two"),
              trailing: new Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new Page("Page Two")));
              }
            ),
            new Divider(),
            new ListTile(
              title: new Text("Cancel"),
              trailing: new Icon(Icons.cancel),
              onTap: () => Navigator.pop(context),
            )
          ],
        ),
      ),
      body: Center(
        child: Text("Hello from pokemon"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.cyan,
        child: Icon(Icons.refresh)
      ),
    );
  }

}