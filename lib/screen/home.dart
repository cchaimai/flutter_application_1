import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/welcome.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<TextEditingController> _controllers =
      List.generate(13, (index) => TextEditingController());

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: Colors.green,
          flexibleSpace: const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                "เข้าสู่ระบบ",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/bg3.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Center(
                      child: Text(
                        "ยินดีต้อนรับ",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0, left: 4.0),
                    child: Text(
                      "เลขประจำตัวประชาชน",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 78, 77, 77),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(13, (index) {
                        return Container(
                          width: 40,
                          height: 50,
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: TextField(
                            controller: _controllers[index],
                            maxLength: 1,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 20),
                            decoration: const InputDecoration(
                              counterText: '',
                              border: OutlineInputBorder(),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 12.0),
                            ),
                            onChanged: (value) {
                              if (value.isNotEmpty && index < 12) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                          ),
                        );
                      }),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0, left: 4.0),
                    child: Text(
                      "รหัสผ่าน",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 78, 77, 77),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4.0, vertical: 10.0),
                    child: TextField(
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        contentPadding: const EdgeInsets.only(
                            left: 20.0, top: 12.0, bottom: 12.0),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.login),
                        label: const Text("เข้าสู่ระบบ",
                            style: TextStyle(fontSize: 20)),
                        onPressed: () {
                          String citizenId = _controllers
                              .map((controller) => controller.text)
                              .join();
                          if (citizenId.length != 13 ||
                              !RegExp(r'^\d+$').hasMatch(citizenId)) {
                            _showErrorDialog(context,
                                "กรุณากรอกเลขบัตรประชาชนให้ครบ 13 หลักและต้องเป็นตัวเลขเท่านั้น");
                          } else {
                            // ignore: avoid_print
                            print('Citizen ID: $citizenId');
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const WelcomeScreen()),
                              (Route<dynamic> route) => false,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          textStyle: const TextStyle(fontSize: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("หากยังไม่มีบัญชี "),
                        TextButton(
                          onPressed: () {
                            print("ไปที่หน้าสมัครบัญชี");
                          },
                          child: const Text(
                            "สมัครเลย",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                        const Text(" | "),
                        TextButton(
                          onPressed: () {
                            print("ไปที่หน้าลืมรหัสผ่าน");
                          },
                          child: const Text(
                            "ลืมรหัสผ่าน",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
              child: Text(
            "ข้อผิดพลาด",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          )),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text("ตกลง"),
              onPressed: () {
                for (var controller in _controllers) {
                  controller.clear();
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
