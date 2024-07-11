import 'package:myshopteguh/model/model_berita.dart';
import 'package:myshopteguh/model/model_user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myshopteguh/model/model_berita.dart';

class PageListBerita extends StatefulWidget {
  const PageListBerita({super.key});

  @override
  State<PageListBerita> createState() => __PageListBeritaState();
}

class __PageListBeritaState extends State<PageListBerita> {
  Future<List<Datum>?> getBerita() async {
    try {
      http.Response res = await http
          .get(Uri.parse('http://192.168.56.1/beritaDb/getBerita.php'));
      return welcomeFromJson(res.body).data;
    } catch (e) {
      setState(() {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Berita"),
        backgroundColor: Colors.orange,
      ),
      body: FutureBuilder(
          future: getBerita(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Datum>?> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    Datum? data = snapshot.data?[index];
                    return Padding(
                      padding: EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => detilberita(data)));
                        },
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    'http://192.168.56.1/beritaDb/gambar_berita/${data?.gambarBerita}',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  '${data?.judul}',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                ),
                                subtitle: Text('${data?.isiBerita}',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black54),
                                    maxLines: 2),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            }
          }),
    );
  }
}

class detilberita extends StatelessWidget {
  final Datum? data;
  const detilberita(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${data?.judul}'),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Image.network(
                'http://192.168.56.1/beritaDb/gambar_berita/${data?.gambarBerita}'),
            Text(
              '${data?.judul}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text(
              '${data?.tglBerita}',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Text(
              '${data?.isiBerita}',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
