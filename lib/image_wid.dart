import 'package:flutter/material.dart';

class ImageWid extends StatelessWidget {
  const ImageWid({super.key});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage('assets/Maisha HS.JPG'),
      alignment: Alignment.center,
    );
    // SingleChildScrollView(
    //   child: Column(
    //     children: [
    //       Image(
    //           image: NetworkImage(
    //               'https://tsuburaya-prod.com/wp-content/uploads/2022/03/Ultrawoman-Decker-Top.png')),
    //       Image(
    //           image: NetworkImage(
    //               'https://upload.wikimedia.org/wikipedia/en/4/4e/Ultraman_Profile_Photo.jpg')),
    //     ],
    //   ),
    // );
  }
}
