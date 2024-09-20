import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:saas_app/constants/colors.dart';
import 'package:saas_app/widgets/image_preview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ImagePicker imagePicker;
  String? pickedImagePath;
  bool isPickedImage = false;

  @override
  void initState() {
    imagePicker = ImagePicker();
    super.initState();
  }

  //function to pick image
  void _pickImage(ImageSource source) async {
    final pickedImage = await imagePicker.pickImage(source: source);
    if (pickedImage == null) {
      return;
    }
    setState(() {
      pickedImagePath = pickedImage.path;
      isPickedImage = true;
    });
  }

  //show bottom sheet
  void _showBottomSheetWidget() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Choose from gallery"),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text("Take from camera"),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ML Text Recognition",
          style: TextStyle(
            color: kMainColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ImagePreview(
              imagePath: pickedImagePath,
            ),
            const SizedBox(height: 20),
            if (!isPickedImage)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          WidgetStatePropertyAll<Color>(kMainColor),
                    ),
                    onPressed: _showBottomSheetWidget,
                    child: const Text(
                      "Pick an image",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            if (isPickedImage)
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Process Image",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
          ],
        ),
      ),
    );
  }
}
