import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String userId = '';
  String userPassword = '';
  final TextEditingController idController = TextEditingController();
  final TextEditingController pwController = TextEditingController();

  @override
  void dispose() {
    idController.dispose();
    pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "오늘의 웹툰",
          style: GoogleFonts.sunflower(
              textStyle:
                  const TextStyle(fontSize: 28, fontWeight: FontWeight.w500)),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        elevation: 2,
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                Text("Log In",
                    style: GoogleFonts.sunflower(
                        textStyle: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500))),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 3,
                  color: Colors.grey.withOpacity(0.5),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  // ID 입력창
                  controller: idController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '1자 이상 입력해주세요.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      userId = value!;
                    });
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Email address",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  // PW 입력창
                  controller: pwController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '1자 이상 입력해주세요.';
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      userPassword = value!;
                    });
                  },
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text("회원가입이 필요하다면,"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: const Text("여기를 클릭하세요"))
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  // 로그인 버튼
                  onPressed: () {
                    final formKeyState = _formKey.currentState!;
                    if (formKeyState.validate()) {
                      // form이 유효한 경우
                      formKeyState
                          .save(); // TextFormField의 onSaved() 호출하여 state 저장
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("$userId님 환영합니다!")));
                      Navigator.pop(context, "$userId"); // 일단 임시로 ID만 전달하도록!
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "로그인",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
