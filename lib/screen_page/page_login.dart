import 'package:myshopteguh/screen_page/page_register.dart';
import 'package:flutter/material.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({super.key});

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  TextEditingController txtUsername = TextEditingController();
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
                  height: 330,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const PageRegister()),
                        (route) => false);
                  },
                  child:
                      const Text("Anda belum punya akun ? silahkan register"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
