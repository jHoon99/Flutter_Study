import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class SelectImageDialog extends HookConsumerWidget {
  const SelectImageDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleDialog(
      title: const Text('사진 선택'),
      children: [
        SimpleDialogOption(
          onPressed: () => Navigator.pop(context, ImageSource.camera),
          child: const Text('카메라'),
        ),
        SimpleDialogOption(
          onPressed: () => Navigator.pop(context, ImageSource.gallery),
          child: const Text('앨범에서 선택'),
        ),
      ],
    );
  }
}
