import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toonflix/Screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            // Navigator.push는 다른 페이지로 이동한 것처럼 보이지만, 사실 새로운 페이지를 렌더링하는 것
            context,
            MaterialPageRoute(
              // Navigator는 stateless 위젯을 지원하지 않으므로 MaterialPageRoute로 감싸야 함
              builder: (context) =>
                  DetailScreen(title: title, thumb: thumb, id: id),
              fullscreenDialog: true, // 새로운 페이지가 밑에서 올라오도록
            ));
      },
      child: Column(
        children: [
          Hero(
            tag: id,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 15,
                        offset: const Offset(10, 10),
                        color: Colors.black.withOpacity(0.5),
                      )
                    ]),
                width: 250,
                clipBehavior: Clip.hardEdge,
                child: Image.network(thumb)),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            title,
            style:
                GoogleFonts.notoSans(textStyle: const TextStyle(fontSize: 22)),
          ),
        ],
      ),
    );
  }
}
