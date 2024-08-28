import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String? image; // final로 선언하여 불변으로 만듦

  const ImageWidget({required this.image, super.key}); // const 생성자 추가

  @override
  Widget build(BuildContext context) {
    if (image == null || image!.isEmpty) {
      return Container(
        width: 100,
        height: 100,
        color: Colors.grey,
        child: const Center(child: Text("이미지 없음")),
      );
    }

    // 이미지가 파일 경로인지 확인
    bool isFile = image!.startsWith('file://') || File(image!).existsSync();

    return SizedBox(
      width: 100,
      height: 100,
      child: isFile
          ? FutureBuilder<File>(
        future: Future.value(File(image!)),
        builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || !snapshot.hasData) {
            return const Center(child: Text('이미지 로드 실패'));
          } else {
            return Image.file(snapshot.data!, fit: BoxFit.fill);
          }
        },
      )
          : Image.network(
        image!,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                  (loadingProgress.expectedTotalBytes ?? 1)
                  : null,
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) =>
        const Center(child: Text('이미지 로드 실패')), // 네트워크 이미지 로드 실패 처리
      ),
    );
  }
}
