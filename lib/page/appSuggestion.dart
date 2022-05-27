import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
//import '../user/user_data.dart';
//import '../widgets/appbar_widget.dart';

final subjects = 'App suggestion';
final tos = 'rsm@gmail.com';
//var user = UserData.myUser;

// This class handles the Page to edit the About Me Section of the User Profile.
class AppSuggestionFormPage extends StatefulWidget {
  @override
  _AppSuggestionFormPageState createState() => _AppSuggestionFormPageState();
}

class _AppSuggestionFormPageState extends State<AppSuggestionFormPage> {
  //final _formKey = GlobalKey<FormState>();
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  // void updateUserValue(String description) {
  //   user.aboutMeDescription = description;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Form(
          // key: _formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                    width: 350,
                    child: const Text(
                      "Say something",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )),
                Padding(
                    padding: EdgeInsets.all(20),
                    child: SizedBox(
                        height: 250,
                        width: 350,
                        child: TextFormField(
                          // Handles Form Validation
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length > 200) {
                              return 'Please describe  but keep it under 200 characters.';
                            }
                            return null;
                          },
                          controller: descriptionController,
                          textAlignVertical: TextAlignVertical.top,
                          decoration: const InputDecoration(
                              alignLabelWithHint: true,
                              contentPadding:
                                  EdgeInsets.fromLTRB(10, 15, 10, 100),
                              hintMaxLines: 3,
                              hintText: 'Submit Your suggestion...'),
                        ))),
                Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: 350,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              _sendmail(
                                toEmail: tos,
                                subject: subjects,
                                message: descriptionController.text,
                              );
                              // Validate returns true if the form is valid, or false otherwise.
                              // if (_formKey.currentState.validate()) {
                              //   updateUserValue(descriptionController.text);
                              //   Navigator.pop(context);
                              // }
                            }, // key: _formKey,
                            child: const Text(
                              'Send',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        )))
              ]),
        ));
  }

  _sendmail({
    required String toEmail,
    required String subject,
    required String message,
  }) async {
    final Uri _mail = Uri.parse(
        'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(message)}');
    if (!await launchUrl(_mail)) throw 'Could not launch $_mail';
  }
}
