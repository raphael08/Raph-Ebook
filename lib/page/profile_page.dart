import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ebook/page/auth_page.dart';
import 'package:flutter_ebook/page/changepassword.dart';
import 'package:flutter_ebook/page/editprofile.dart';
import 'package:flutter_ebook/page/payment_page.dart';
import 'package:flutter_ebook/views/settings/settings.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../model/user.dart';
import '../util/user_preferences.dart';
import '../widget/appbar_widget.dart';
import '../widget/button_widget.dart';
import '../widget/numbers_widget.dart';
import '../widget/profile_widget.dart';
import '../views/settings/settings.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    final users = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: (() => Navigator.pop(context)),
        ),
        title: Center(
          child: Text("Profile"),
        ),
        // actions: [
        //   GestureDetector(
        //     onTap: () {
        //       Navigator.push(context,
        //           MaterialPageRoute(builder: (context) => Setttings()));
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
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          buildName(user),
          const SizedBox(height: 24),
          Row(children: [
            const SizedBox(width: 30),
            buildEditButton(),
            const SizedBox(width: 10),
            buildUpgradeButton(),
            const SizedBox(width: 10),
            buildchangepasswordButton()
          ]),
          const SizedBox(height: 24),
          NumbersWidget(),
          const SizedBox(height: 48),
          buildAbout(user),
          const SizedBox(height: 48),
          Row(children: [
            const SizedBox(width: 80),
            builddeactivateButton(),
            const SizedBox(width: 10),
            buildlogoutButton(),
          ]),
        ],
      ),
    );
  }

  Widget buildName(Userz users) => Column(
        children: [
          Text(
            "Raphael S Mkilya",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            users.email,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildEditButton() => ButtonWidget(
        text: 'Edit Profile',
        onClicked: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => EditProfile()));
        },
      );
  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Upgrade To PRO',
        onClicked: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => PaymentPage()));
        },
      );
  Widget buildchangepasswordButton() => ButtonWidget(
        text: 'Reset Password',
        onClicked: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ChangePassword()));
        },
      );
  Widget builddeactivateButton() => ButtonWidget(
        text: 'Deactvate Account',
        onClicked: () {
          Navigator.pop(context);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => AuthPage()));
        },
      );
  Widget buildlogoutButton() => ButtonWidget(
      text: 'Logout',
      onClicked: () =>
          // Fluttertoast.showToast(
          //     msg: "SignOut",
          //     toastLength: Toast.LENGTH_LONG,
          //     gravity: ToastGravity.CENTER);
          FirebaseAuth.instance.signOut().then((value) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AuthPage()));
          }));
}

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
