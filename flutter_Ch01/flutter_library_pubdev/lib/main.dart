import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

const assetImagePath = 'assets/images/';
const bannerImage = '$assetImagePath/baneer.png';

void main() {
  runApp(
    MaterialApp(
      home: HomeWidget(),
    ),
  );
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter에서 외부 라이브러리 사용하기'),
      ),
      body: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RandomWords(),
        ImageWidget(),
      ],
    );
  }
}

class RandomWords extends StatelessWidget {
  const RandomWords({super.key});

  @override
  Widget build(BuildContext context) {
    final list = generateWordPairs().take(5).toList();
    final widgets = list
        .map(
          (word) => Text(
            word.asSnakeCase,
            style: const TextStyle(fontSize: 32),
          ),
        )
        .toList();
    return Column(children: widgets);
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(bannerImage, width: 100, height: 100, fit: BoxFit.fill,);
  }
}
