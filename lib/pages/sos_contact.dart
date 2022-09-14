import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Sos extends StatefulWidget {
  const Sos({Key? key}) : super(key: key);

  @override
  State<Sos> createState() => _SosState();
}

class _SosState extends State<Sos> {
  TextEditingController _editingController = TextEditingController();
  String num1 = "7008721914";
  String num2 = "1990928662";
  String num3 = "1325628891";
  String num4 = "1817618819";
  String num5 = "9198181181";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Sos Feature"),
        ),
        body: Column(
          children: [
            GestureDetector(
              onTap: (() {
                _displayTextInputDialog(context, "Number1");
              }),
              child: Card(
                child: ListTile(
                  leading: const Text("1"),
                  title: Text(num1),
                  trailing: IconButton(
                    icon: Icon(Icons.call),
                    onPressed: () {
                      launchUrlString("tel: $num1 ");
                    },
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (() {
                _displayTextInputDialog(context, "Number1");
              }),
              child: Card(
                child: ListTile(
                  leading: const Text("1"),
                  title: Text(num2),
                  trailing: IconButton(
                    icon: Icon(Icons.call),
                    onPressed: () {
                      launchUrlString("tel: $num1 ");
                    },
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (() {
                _displayTextInputDialog(context, "Number1");
              }),
              child: Card(
                child: ListTile(
                  leading: const Text("1"),
                  title: Text(num3),
                  trailing: IconButton(
                    icon: Icon(Icons.call),
                    onPressed: () {
                      launchUrlString("tel: $num1 ");
                    },
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (() {
                _displayTextInputDialog(context, "Number1");
              }),
              child: Card(
                child: ListTile(
                  leading: const Text("1"),
                  title: Text(num4),
                  trailing: IconButton(
                    icon: const Icon(Icons.call),
                    onPressed: () {
                      launchUrlString("tel: $num1 ");
                    },
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (() {
                _displayTextInputDialog(context, "Number1");
              }),
              child: Card(
                child: ListTile(
                  leading: const Text("1"),
                  title: Text(num5),
                  trailing: IconButton(
                    icon: Icon(Icons.call),
                    onPressed: () {
                      launchUrlString("tel: $num1 ");
                    },
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  getdata() async {
    final prefs = await SharedPreferences.getInstance();
    num1 = prefs.getString("Number1") ?? "";
    num2 = prefs.getString("Number2") ?? "";
    num3 = prefs.getString("Number3") ?? "";
    num4 = prefs.getString("Number4") ?? "";
    num5 = prefs.getString("Number5") ?? "";
    setState(() {});
  }

  data() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("Number1", num1);
    prefs.setString("Number2", num2);
    prefs.setString("Number3", num3);
    prefs.setString("Number4", num4);
    prefs.setString("Number5", num5);
    setState(() {});
  }

  update(String s, String data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(s, data);
  }

  Future<void> _displayTextInputDialog(BuildContext context, String s) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('SOS Number'),
            content: TextField(
              controller: _editingController,
              decoration: const InputDecoration(hintText: "Put Number"),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: Text('OK'),
                onPressed: () {
                  setState(() {
                    // update(s, _editingController.text);
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        });
  }
}
