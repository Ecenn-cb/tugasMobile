import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const KartuApp());
}

class KartuApp extends StatelessWidget {
  const KartuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Kartu Nama Digital",
      debugShowCheckedModeBanner: false,
      home: KartuScreen(),
    );
  }
}

class KartuScreen extends StatelessWidget {
  const KartuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.black,
                radius: 70,
                backgroundImage: AssetImage("../Gambar/Foto.jpg"),
              ),
              const SizedBox(height: 20),
              Text(
                "Melsen Candika Bagaskara",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                "IF-A-2023-5520123022",
                style: GoogleFonts.amarante(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
                width: 200,
                child: Divider(color: Colors.white),
              ),
              const Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: ListTile(
                  leading: Icon(Icons.call),
                  title: Text("0895395251660"),
                ),
              ),
              const Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: ListTile(
                  leading: Icon(Icons.email),
                  title: Text("bagaskaramelsen@gmail.com"),
                ),
              ),
              const Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: ListTile(
                  leading: Icon(Icons.photo_camera),
                  title: Text("@immelsen"),
                ),
              ),
              const Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: ListTile(
                  leading: Icon(Icons.message),
                  title: Text("Selamat Berjuang! Sukses..."),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
