import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as filePath;
import 'package:path_provider/path_provider.dart' as syspaths;

class ImageInput extends StatefulWidget {
  Function onPikedImage;
  ImageInput(this.onPikedImage);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storeImage;
  Future<void> _takePhoto() async {
    print('Photo taken');
    final piker = ImagePicker();
    final imageFile = await piker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (imageFile == null) {
      return;
    }

    setState(() {
      _storeImage = File(imageFile.path);
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = filePath.basename(imageFile.path);
    final saveImage =
        await File(imageFile.path).copy('${appDir.path}/$fileName');

    widget.onPikedImage(saveImage);
    print(fileName);
    print(appDir);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _storeImage != null
              ? Image.file(
                  _storeImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : const Text(
                  'No image taken',
                  textAlign: TextAlign.center,
                ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: TextButton.icon(
                onPressed: _takePhoto,
                icon: Icon(Icons.camera),
                label: Text('Take Picture')))
      ],
    );
  }
}
