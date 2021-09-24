import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HalamanKontak(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class User {
  final int id;
  final String name;
  final String nomer;
  final dynamic mail;
  final String gambar;

  User(
      {required this.id,
      required this.name,
      required this.nomer,
      required this.mail,
      required this.gambar});

  static List<User> getUser() {
    return <User>[
      User(
          id: 1,
          name: 'Iqbal',
          nomer: '084376478789',
          mail: 'iqbal@mail.com',
          gambar: 'assets/iqbal.png'),
      User(
          id: 2,
          name: 'Rara',
          mail: 'rara@mail.com',
          nomer: '081234557891',
          gambar: 'assets/rara.png'),
      User(
          id: 3,
          name: 'Kocoy',
          mail: 'kocoy@mail.com',
          nomer: '081526273654',
          gambar: 'assets/kocoy.png'),
      User(
          id: 4,
          name: 'Ola',
          mail: 'ola@mail.com',
          nomer: '082483628298',
          gambar: 'assets/ola.png'),
      User(
          id: 5,
          name: 'Nani nuneno nonina nununi nenenen naneno nonine nananin',
          mail: 'ka@mail.com',
          nomer: '08656567387',
          gambar: 'assets/default.png')
    ];
  }
}

class HalamanKontak extends StatefulWidget {
  @override
  _HalamanKontakState createState() => _HalamanKontakState();
}

class _HalamanKontakState extends State<HalamanKontak> {
  late List<User> data;
  @override
  void initState() {
    data = User.getUser();
    data.sort((a, b) => a.name.compareTo(b.name));
    super.initState();
  }

  Widget build(BuildContext context) {
    String mytitle = 'Kontakku';
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text(
          mytitle,
          style: GoogleFonts.sourceSansPro(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          for (var i = 0; i < data.length; i++)
            InkWell(
              onTap: () {
                //! Halaman Detail Kontak
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 350,
                        color: Colors.transparent,
                        margin: EdgeInsets.only(bottom: 100),
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              color: Colors.blueGrey,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        data[i].name,
                                        style: GoogleFonts.sourceSansPro(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            data[i].gambar,
                                            width: 150,
                                            height: 150,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                data[i].nomer,
                                                style:
                                                    GoogleFonts.sourceSansPro(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                data[i].mail,
                                                style:
                                                    GoogleFonts.sourceSansPro(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              },
              //! Akhir Halaman Detail Kontak
              //! Halaman Kontak
              child: Card(
                color: Colors.white,
                elevation: 10,
                shadowColor: Colors.grey[900],
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              data[i].gambar,
                              width: 65,
                              height: 65,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              child: Text(
                                data[i].name,
                                style: GoogleFonts.sourceSansPro(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(right: 5, child: Icon(Icons.arrow_right))
                    ],
                  ),
                ),
              ),
            )
        ],
      )),
    );
  }
}
