import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './loginpage.dart';
import 'background.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  _RegisterPageState() {
    _selectedValue = _productSizeList[0];
  }
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  String dropdownvalue = 'profession';

  Future<void> signUp() async {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
    // Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  final _productSizeList = ["Engineer", "Doctor", "Pilot", "Student"];
  String? _selectedValue = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BackGround(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: const Text(
                "Register",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2661FA),
                    fontSize: 36),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Name"),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: "Email"),
              ),
            ),
            // SizedBox(height: size.height * 0.03),
            // Container(
            //   alignment: Alignment.center,
            //   margin: const EdgeInsets.symmetric(horizontal: 40),
            //   child: TextField(
            //     controller: _usernameController,
            //     decoration: const InputDecoration(labelText: "Username"),
            //   ),
            // ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true,
              ),
            ),

            SizedBox(height: size.height * 0.03),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: DropdownButtonFormField(
                decoration: const InputDecoration(
                    labelText: "PROFESSION",
                    prefixIcon: Icon(
                      Icons.work,
                      color: Colors.deepPurple,
                    ),
                    border: OutlineInputBorder()),
                iconEnabledColor: Colors.red,
                hint: Text("Tap to Select"),
                items: _productSizeList
                    .map((e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    _selectedValue = val as String;
                  });
                },
                icon: const Icon(
                  Icons.arrow_drop_down_circle,
                  color: Colors.deepPurple,
                ),
                dropdownColor: Colors.deepPurple.shade100,
              ),
            ),

            // Container(
            //   alignment: Alignment.centerRight,
            //   margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            //   child: const Text(
            //     'Forget your password',
            //     style: TextStyle(
            //       fontSize: 12,
            //       color: Color(0xFF2661FA),
            //     ),
            //   ),
            // ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: TextButton(
                onPressed: () {
                  signUp();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 183, 224, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80),
                    ),
                    padding: const EdgeInsets.all(0)),
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: size.width * 0.50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 255, 136, 34),
                        Color.fromARGB(255, 255, 177, 45),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(0),
                  child: const Text(
                    "SIGN UP",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 0),
            Container(
              alignment: Alignment.centerRight,
              // margin: const EdgeInsets.symmetric(
              //   horizontal: 170,
              //   vertical: 10,
              // ),
              child: Padding(
                padding: const EdgeInsets.only(right: 55, top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      'Already a member?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: const Text(
                        ' LOGIN',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // Container(
            //   alignment: Alignment.centerRight,
            //   margin: const EdgeInsets.symmetric(
            //     horizontal: 40,
            //     vertical: 10,
            //   ),
            //   child: GestureDetector(
            //     onTap: () {
            //       widget.showLoginPage;
            //       // Navigator.of(context).push(MaterialPageRoute(
            //       //     builder: (context) => const LoginScreen()));
            //       // Navigator.of(context).pop();
            //     },
            //     child: const Text(
            //       "Already have an ccount? Sign in",
            //       style: TextStyle(
            //         fontSize: 15,
            //         fontWeight: FontWeight.bold,
            //         color: Color(0xFF2661FA),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
