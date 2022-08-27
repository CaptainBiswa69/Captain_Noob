import 'package:disaster_notifier/pages/pdf_view.dart';
import 'package:flutter/material.dart';

class DosDont extends StatelessWidget {
  const DosDont({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Do's and Don'ts")),
      body: Column(children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => const PdfView(
                    pdfUrl:
                        "https://firebasestorage.googleapis.com/v0/b/serv-b58fb.appspot.com/o/Cyclone1.pdf?alt=media&token=568446ba-eece-4b88-ad15-f700ad09290f"))));
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Card(
              child: ListTile(
                leading: Icon(Icons.warning_amber),
                title: Text("During a Cyclone"),
                trailing: Text("View"),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => const PdfView(
                    pdfUrl:
                        "https://firebasestorage.googleapis.com/v0/b/serv-b58fb.appspot.com/o/floods1.pdf?alt=media&token=482065d2-45cf-4a8f-bb21-278a06c3003b"))));
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Card(
              child: ListTile(
                leading: Icon(Icons.warning_amber),
                title: Text("During a Flood"),
                trailing: Text("View"),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => const PdfView(
                    pdfUrl:
                        "https://firebasestorage.googleapis.com/v0/b/serv-b58fb.appspot.com/o/Tsunami.pdf?alt=media&token=ec07d7df-c49b-4cd4-bb8c-3aee9ed199bd"))));
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Card(
              child: ListTile(
                leading: Icon(Icons.warning_amber),
                title: Text("During a Tsunami"),
                trailing: Text("View"),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => const PdfView(
                    pdfUrl:
                        "https://firebasestorage.googleapis.com/v0/b/serv-b58fb.appspot.com/o/Earthquakes.pdf?alt=media&token=a4db5d66-de01-461e-a08e-7f6485021410"))));
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Card(
              child: ListTile(
                leading: Icon(Icons.warning_amber),
                title: Text("During a EarthQuake"),
                trailing: Text("View"),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => const PdfView(
                    pdfUrl:
                        "https://firebasestorage.googleapis.com/v0/b/serv-b58fb.appspot.com/o/urban%20floods1.pdf?alt=media&token=2dd6acb3-b894-4dfd-b7d1-a65ad33fa9fd"))));
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Card(
              child: ListTile(
                leading: Icon(Icons.warning_amber),
                title: Text("During a Urban Floods"),
                trailing: Text("View"),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
