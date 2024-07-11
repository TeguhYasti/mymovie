// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListAllUser extends StatefulWidget {
  const ListAllUser({super.key});
  @override
  State<ListAllUser> createState() => _ListAllUserState();
}

class _ListAllUserState extends State<ListAllUser> {
  List alluser = [];

  Future<void> getAllUser() async {
    String urlAllUser = "https://jsonplaceholder.typicode.com/users";
    try {
      var response = await http.get(Uri.parse(urlAllUser));
      alluser = jsonDecode(response.body);
      setState(() {
        alluser = jsonDecode(response.body);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getAllUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'All User',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red.shade300,
      ),
      body: ListView.builder(
        itemCount: alluser.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => Userdetil(
                                alluser[index]["username"],
                                alluser[index]["name"],
                                alluser[index]["email"],
                                alluser[index]["phone"],
                                alluser[index]["website"],
                                alluser[index]["address"]["street"],
                                alluser[index]["address"]["suite"],
                                alluser[index]["address"]["city"],
                                alluser[index]["address"]["zipcode"],
                                alluser[index]["address"]["lat"],
                                alluser[index]["address"]["lng"],
                                alluser[index]["company"]["name"],
                                alluser[index]["company"]["catchPhrase"],
                                alluser[index]["company"]["bs"],
                              )));
                },
                title: Text(
                  alluser[index]["name"],
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(alluser[index]["email"]),
                    Text(alluser[index]["address"]["street"]),
                    Text(alluser[index]["address"]["city"]),
                  ],
                )),
          );
        },
      ),
    );
  }
}

class Userdetil extends StatelessWidget {
  final dynamic username,
      name,
      email,
      phone,
      website,
      street,
      suite,
      city,
      zipcode,
      lat,
      lng,
      namecom,
      catchPhrase,
      bs;
  const Userdetil(
      this.username,
      this.name,
      this.email,
      this.phone,
      this.website,
      this.street,
      this.suite,
      this.city,
      this.zipcode,
      this.lat,
      this.lng,
      this.namecom,
      this.catchPhrase,
      this.bs,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade200,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text("Berikut ini adalah Detail User"),
            Text(
              "Nama : $name",
              style: TextStyle(
                  color: Color.fromARGB(255, 47, 21, 167), fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text("Email : $email"),
            Text("username : $username"),
            Text("phone : $phone"),
            SizedBox(
              height: 20,
            ),
            Text("Alamat"),
            Text("$street, $suite, $city, $zipcode"),
            SizedBox(
              height: 20,
            ),
            Text("Company : "),
            Text("$namecom"),
            Text("Alamat : $catchPhrase"),
            Text("$bs"),
          ],
        ),
      ),
    );
  }
}
