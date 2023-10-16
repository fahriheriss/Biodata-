import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final biodata = <String, String>{};
  
  MainApp({super.key}) {
    biodata['name'] = 'Fahri Heris Setiawan (Fahri)';
    biodata['email'] = 'fahriherissetiawan@gmail.com';
    biodata['phone'] = '=6285155359775';
    biodata['image'] = 'profil.jpeg';
    biodata['hobby'] = 'Mengedit Video';
    biodata['addr'] = 'Kudus, Jawa Tengah, Indonesia';
    biodata['desc'] = '''Saya adalah mahasiswa dari Universitas Dian Nuswantoro Jurusan Teknik Informatika''';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi Biodata",
      home: Scaffold(
        appBar: AppBar(title: const Text("Aplikasi Biodata")),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              textKotak(Colors.black, biodata['name'] ?? ''),
                Image(image: AssetImage('assets/${biodata ["image"] ?? ''}')),
                SizedBox(height: 10),
                Row(
                  children: [
                    btnContact(Icons.alternate_email, Colors.green[900], 
                      "mailto:${biodata['email']}"), 
                    btnContact(Icons.mark_email_unread_rounded, Colors.blueAccent,
                      "https/wa.me/${biodata['phone']}"),
                    btnContact(Icons.phone, Colors.deepPurple,
                      "tel:${biodata['phone']}")
                    ],
                ),
                SizedBox(height: 10),
                textAttribute("Hobby", biodata['hobby'] ?? ''),
                textAttribute("Alamat", biodata['addr'] ?? ''),
                SizedBox(height: 10),
                textKotak(Colors.black38, 'Deskripsi'),
                SizedBox(height: 10),
                Text(biodata['desc'] ?? '', 
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
                )
            ]),
        ),
      ),
    );
  }

  Container textKotak(Color bgColor, String text) {
    return Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(color: bgColor),
              child: Text(
                text, 
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20, 
                color: Colors.white ),
              ),
              );
  }

  Row textAttribute(String judul, String text) {
    return Row(
                children: [
                  Container(
                    width: 80,
                    child: Text("- $judul", 
                        style: 
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                  Text(":", style: TextStyle(fontSize: 18)), 
                  Text(text, style: TextStyle(fontSize: 18))
                  ],
                );
  }

  Expanded btnContact(IconData icon, var color, String uri) {
    return Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      launch(uri);
                    }, 
                    child: Icon(icon),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color,
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)),
                      ),
                );
  }

  void launch(String uri) async{
    if (!await launchUrl(Uri.parse(uri))) {
      throw Exception('Tidak Dapat Memanggil: $Uri');
    }
  }
}
