import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ebook/page/profile_page.dart';
import 'package:flutter_ebook/views/settings/settings.dart';
import '../model/user.dart';
import '../util/user_preferences.dart';
import '../widget/appbar_widget.dart';
import '../widget/button_widget.dart';
import '../widget/numbers_widget.dart';
import '../widget/profile_widget.dart';
import '../views/settings/settings.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'contactus.dart';
import 'help.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: (() => Navigator.pop(context)),
        ),
        title: Center(
          child: Text("Account"),
        ),
        // actions: [
        //   GestureDetector(
        //     onTap: () {
        //       Navigator.push(
        //           context, MaterialPageRoute(builder: (context) => Settings()));
        //     },
        //     child: Icon(Icons.settings),
        //   ),
        // ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ));
            },
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          ListTile(
            title: Text('Settings'),
            subtitle: Text('Privacy and logout'),
            leading: Icon(Icons.settings),
            trailing: Icon(Icons.chevron_right, color: Colors.yellow),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Settings())),
          ),
          Divider(),
          ListTile(
            title: Text('Help & Support'),
            subtitle: Text('Help center and legal support'),
            leading: Icon(Icons.help),
            trailing: Icon(
              Icons.chevron_right,
              color: Colors.yellow,
            ),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Help())),
          ),
          Divider(),
          ListTile(
            title: Text('FAQ'),
            subtitle: Text('Questions and Answer'),
            leading: Icon(Icons.question_answer),
            trailing: Icon(Icons.chevron_right, color: Colors.yellow),
            // onTap: () => Navigator.of(context).push(
            //     MaterialPageRoute(builder: (_) => FaqPage())),
          ),
          Divider(),
          ListTile(
            title: Text('Contact Us'),
            subtitle: Text('Contact For More Information'),
            leading: Icon(Icons.contact_page),
            trailing: Icon(Icons.chevron_right, color: Colors.yellow),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => Contact_Us())),
          ),
          Divider(),
          ListTile(
            title: Text('Rate US'),
            subtitle: Text('Show Us Your concern'),
            leading: Icon(Icons.star),
            trailing: Icon(Icons.chevron_right, color: Colors.yellow),
            onTap: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return Expanded(
                  child: AlertDialog(
                    title: Text('Welcome'),
                    content: RatingBar.builder(
                      initialRating: 3,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.face,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    actions: [
                      FlatButton(
                        textColor: Colors.black,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('CANCEL'),
                      ),
                      FlatButton(
                        textColor: Colors.black,
                        onPressed: () {},
                        child: Text('RATE'),
                      ),
                    ],
                  ),
                );
              },

              // Center(child: buildUpgradeButton()),
              // const SizedBox(height: 24),
              // NumbersWidget(),
              // const SizedBox(height: 48),
              // buildAbout(user),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildName(Userz user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  // Widget buildUpgradeButton() => ButtonWidget(
  //       text: 'Upgrade To PRO',
  //       onClicked: () {},
  //     );

  Widget buildAbout(Userz user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              user.about,
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );
}
