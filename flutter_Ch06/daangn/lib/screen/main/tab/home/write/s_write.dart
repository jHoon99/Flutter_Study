import 'dart:io';
import 'dart:math';

import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'd_select_image.dart';

class WriteScreen extends HookConsumerWidget {
  const WriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageList = useState<List<String>>([]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('내 물건 팔기'),
        actions: [
          Tap(
            onTap: () {},
            child: Text('임시저장'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageSelectWidget(
              imageList.value,
              onTap: () async {
                final result = await showDialog<ImageSource>(
                  context: context,
                  builder: (_) => const SelectImageDialog(),
                );

                if (result == null) return;

                final picker = ImagePicker();
                final image = await picker.pickImage(source: result);

                if (image != null) {
                  imageList.value = [...imageList.value, image.path];
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ImageSelectWidget extends HookConsumerWidget {
  final List<String> imageList;
  final VoidCallback onTap;

  const ImageSelectWidget(this.imageList, {required this.onTap, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          itemCount: imageList.length + 1,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) {
            if (index == 0) {
              return _cameraButton(onTap);
            }
            return _image(imageList[index - 1]);
          }),
    );
  }

  Widget _cameraButton(onTap) {
    return Tap(
      onTap: onTap,
      child: SizedBox(
        width: 80,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.red),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.camera_alt),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: imageList.length.toString(),
                          style: const TextStyle(color: Colors.orange),
                        ),
                        const TextSpan(text: '/10'),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _image(String path) {
    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.file(
          File(path),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
