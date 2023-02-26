// 로그인으로 가는 버튼
// 로그인 상태에 따라서 아이콘과 텍스트가 달라짐
import 'package:flutter/material.dart';

class LoginStateButton extends StatefulWidget {
  const LoginStateButton({super.key});

  @override
  State<LoginStateButton> createState() => _LoginStateButtonState();
}

class _LoginStateButtonState extends State<LoginStateButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _getUserId(context);
      },
      child: Row(
        children: const [
          Icon(
            Icons.person,
            size: 40,
            color: Colors.grey,
          ),
          Text("로그인이 필요합니다"),
        ],
      ),
    );
  }

  // LoginScreen을 띄우고 navigator.pop으로부터 결과를 기다리는 메서드
  _getUserId(BuildContext context) async {
    final name = await Navigator.pushNamed(context, '/login');
  }

  stateChange() {} // Login된 상태에서는 로그아웃 아이콘, 로그아웃된 상태에서는 사람 아이콘. 상태 변경 메소드
}
