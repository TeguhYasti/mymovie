import 'package:myshopteguh/screen_page/page_login.dart';
import 'package:flutter/material.dart';
import 'package:myshopteguh/screen_page/page_login.dart';
import 'package:myshopteguh/screen_page/page_registration.dart';


class PageRegister extends StatefulWidget {
  const PageRegister({super.key});

  @override
  State<PageRegister> createState() => _PageRegisterState();
}

class _PageRegisterState extends State<PageRegister> {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtFullname = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  //key untuk form
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Register Form'),
      ),
      body: Form(
        key: keyForm,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: txtUsername,
                  validator: (val) {
                    return val!.isEmpty ? "Tidak Boleh Kosong" : null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Fullname',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: txtUsername,
                  validator: (val) {
                    return val!.isEmpty ? "Tidak Boleh Kosong" : null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: txtUsername,
                  validator: (val) {
                    return val!.isEmpty ? "Tidak Boleh Kosong" : null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Username',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: txtPassword,
                  validator: (val) {
                    return val!.isEmpty ? "Tidak Boleh Kosong" : null;
                  },
                  decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 50,
                ),
                MaterialButton(
                  onPressed: () {},
                  color: Colors.orange,
                  textColor: Colors.white,
                  height: 45,
                  child: Text('Submit'),
                ),
                SizedBox(
                  height: 275,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const PageLogin()),
                        (route) => false);
                  },
                  child: const Text("Anda sudah punya akun silahkan login"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
