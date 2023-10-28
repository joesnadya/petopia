// ignore_for_file: deprecated_member_use

import 'package:image_picker/image_picker.dart';

Future<void> pickImageFromGallery({
  required Function(String v) onSelect,
}) async {
  final ImagePicker picker = ImagePicker();
  final XFile? getAttachment =
      await picker.pickImage(source: ImageSource.gallery, imageQuality: 30);
  if (getAttachment?.path != null) {
    onSelect(getAttachment!.path);
  }
}
