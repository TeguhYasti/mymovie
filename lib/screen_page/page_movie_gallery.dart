import 'package:flutter/material.dart';

class Filmlist extends StatefulWidget {
  const Filmlist({super.key});

  @override
  State<Filmlist> createState() => _FilmlistState();
}

class _FilmlistState extends State<Filmlist> {
  List<Map<String, dynamic>> listmovie = [
    {
      "judul": "Pulang Tak Harus Rumah",
      "gambar": "./lib/assets/f1.jpeg",
      "harga": "49999",
    },
    {
      "judul": "Diwe",
      "gambar": "./lib/assets/f2.jpeg",
      "harga": "49999",
    },
    {
      "judul": "Jatuh Cinta Seperti Di Film Film",
      "gambar": "./lib/assets/f3.jpeg",
      "harga": "49999",
    },
    {
      "judul": "Sehidup Semati",
      "gambar": "./lib/assets/f4.jpeg",
      "harga": "49999",
    },
    {
      "judul": "Beekeeper",
      "gambar": "./lib/assets/f5.jpeg",
      "harga": "49999",
    },
    {
      "judul": "Ancika",
      "gambar": "./lib/assets/f6.jpeg",
      "harga": "49999",
    },
    {
      "judul": "Air Mata Diujung Sajadah",
      "gambar": "./lib/assets/f7.jpeg",
      "harga": "49999",
    },
    {
      "judul": "Film 8",
      "gambar": "./lib/assets/f8.jpeg",
      "harga": "49999",
    },
    {
      "judul": "Agak Laen",
      "gambar": "./lib/assets/f9.jpg",
      "harga": "49999",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('DAFTAR FILM READY'),
        centerTitle: true, 
        backgroundColor: Colors.blue.shade500,
        foregroundColor: const Color.fromARGB(255, 34, 34, 34),
        elevation: 0,
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: listmovie.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => PageMovie(
                              listmovie[index]["judul"],
                              listmovie[index]["harga"],
                              listmovie[index]["gambar"],
                            )));
              },
              child: Padding(
                padding: EdgeInsets.all(8),
                child: GridTile(
                  footer: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.black)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${listmovie[index]["judul"]}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text("Rp. ${listmovie[index]["harga"]}"),
                      ],
                    ),
                  ),
                  child: Image.asset("${listmovie[index]["gambar"]}"),
                ),
              ),
            );
          }),
    );
  }
}

class PageMovie extends StatelessWidget {
  final dynamic judul, harga, gambar;
  const PageMovie(this.judul, this.harga, this.gambar, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Image.asset(gambar),
    );
  }
}