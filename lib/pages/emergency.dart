import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/text.dart' as text;
import 'package:url_launcher/url_launcher_string.dart';

class Emergency extends StatefulWidget {
  const Emergency({Key? key}) : super(key: key);

  @override
  State<Emergency> createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const text.Text("Emergency Number")),
      body: SingleChildScrollView(
        child: Column(children: [
          numberTile("108", "AMBULANCE"),
          numberTile("100", "POLICE STATION"),
          numberTile("101", "FIRE STATION"),
          numberTile("112", "CENTRALIZED EMERGENCY NUMBER "),
          numberTile("011-26701728", "DISASTER MANAGEMENT N.D.M.A"),
          numberTile("1078", "FLOOD CONTROL ROOM ODISHA"),
          numberTile("011-24363260", "EARTHQUAKE / FLOOD / DISASTER N.D.R.F "),
          numberTile("1912", "ODISHA HELPLINE FOR CYCLONE HELP"),
          numberTile("1554", "COAST GUARD CYCLONE HELPLINE"),
          numberTile("1093", "COASTAL HELPLINE "),
          numberTile("9540161344", "AIR AMBULANCE"),
          numberTile("0674 239 1983", "ABHUBANESWAR CAPITAL HOSPITAL"),
        ]),
      ),
    );
  }

  Widget numberTile(String num, String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.contact_page),
          title: text.Text(name),
          trailing: GestureDetector(
              onTap: (() {
                launchUrlString('tel: $num');
              }),
              child: const Icon(Icons.call)),
        ),
      ),
    );
  }
}
