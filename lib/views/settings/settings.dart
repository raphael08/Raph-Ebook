import 'package:flutter/material.dart';
import '../../theme/theme_config.dart';
import '../../util/router.dart';
import '../../view_models/app_provider.dart';
import '../../views/downloads/downloads.dart';
import '../../views/favorites/favorites.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

final terms_condition =
    'https://docs.google.com/document/d/1vfn0tzCujdCC1KoE3GgMa29nTQrFOkqSH77Xz-0KtyA/edit?usp=sharing';
final privacy =
    'https://docs.google.com/document/d/1xrnCV54htOV6AeXMWJU594FMH69zVMPYQWumIZaxmUY/edit?usp=sharing';
final Uri _privacy = Uri.parse('$privacy');
final Uri _terms_condition = Uri.parse('$terms_condition');

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List items = [];

  @override
  void initState() {
    super.initState();
    items = [
      {
        'icon': Feather.heart,
        'title': 'Favorites',
        'function': () => _pushPage(Favorites()),
      },
      {
        'icon': Feather.download,
        'title': 'Downloads',
        'function': () => _pushPage(Downloads()),
      },
      {
        'icon': Feather.moon,
        'title': 'Dark Mode',
        'function': () => _pushPage(Downloads()),
      },
      {
        'icon': Feather.info,
        'title': 'About',
        'function': () => showAbout(),
      },
      {
        'icon': Feather.file_text,
        'title': 'Licenses',
        'function': () => _pushPageDialog(LicensePage()),
      },
      {
        'icon': Feather.shield,
        'title': 'Terms Use',
        'function': () => _launchUrl(),
      },
      {
        'icon': Icons.privacy_tip,
        'title': 'Privacy Policy',
        'function': () => _policy(),
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    // Remove Dark Switch if Device has Dark mode enabled
    if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
      items.removeWhere((item) => item['title'] == 'Dark Mode');
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Settings',
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          if (items[index]['title'] == 'Dark Mode') {
            return _buildThemeSwitch(items[index]);
          }

          return ListTile(
            onTap: items[index]['function'],
            leading: Icon(
              items[index]['icon'],
            ),
            title: Text(
              items[index]['title'],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
      ),
    );
  }

  Widget _buildThemeSwitch(Map item) {
    return SwitchListTile(
      secondary: Icon(
        item['icon'],
      ),
      title: Text(
        item['title'],
      ),
      value: Provider.of<AppProvider>(context).theme == ThemeConfig.lightTheme
          ? false
          : true,
      onChanged: (v) {
        if (v) {
          Provider.of<AppProvider>(context, listen: false)
              .setTheme(ThemeConfig.darkTheme, 'dark');
        } else {
          Provider.of<AppProvider>(context, listen: false)
              .setTheme(ThemeConfig.lightTheme, 'light');
        }
      },
    );
  }

  _pushPage(Widget page) {
    MyRouter.pushPage(context, page);
  }

  _pushPageDialog(Widget page) {
    MyRouter.pushPageDialog(context, page);
  }

  showAbout() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(
            'About',
          ),
          content: Column(
            children: [
              Container(
                child: Image(image: AssetImage("assets/images/app-icon.png")),
              ),
              Container(
                child: Text(
                  'Simple eBook by Raphael',
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              textColor: Theme.of(context).accentColor,
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Close',
              ),
            ),
          ],
        );
      },
    );
  }
}

void _launchUrl() async {
  if (!await launchUrl(_terms_condition))
    throw 'Could not launch $_terms_condition';
}

void _policy() async {
  if (!await launchUrl(_privacy)) throw 'Could not launch $_policy';
}
