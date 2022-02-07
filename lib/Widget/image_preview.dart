import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class ImagePreview extends StatefulWidget {
  Function image;
   ImagePreview(
       this.image,
      );
  @override
  _ImagePreviewState createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {

  var _iamgePicker;

  Future<void> _imagePick()async{
    final picker = ImagePicker();

    ///pickImage() instead of getImage()
    var imageFile= await ImagePicker().pickImage(source: ImageSource.camera,maxWidth: 600);

    ///if user open the camera and back without picking image
    if (imageFile==null){
      return;
    }
    setState(() {
      _iamgePicker=File(imageFile.path);
    });

      /// get directory of my app File Location
    Directory appDir = await getApplicationDocumentsDirectory();
      ///get file name
    String fileName = basename(imageFile.path);
      ///store image in the device
    File storedImage= await _iamgePicker.copy('${appDir.path}/$fileName');
    widget.image(storedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5,horizontal:10),
      child: Row(
        children: [
          Container(
            height: 150,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                width: 1,
                color: Theme.of(context).colorScheme.primary,),
            ),
            child: _iamgePicker == null ? Center(child: Text('Pick Your Image',),): ClipRRect(borderRadius: BorderRadius.circular(6),child: Image.file(_iamgePicker!,fit: BoxFit.cover,))
          ),
          SizedBox(width: 10,),
          Expanded(child: ElevatedButton.icon(onPressed: _imagePick, icon: Icon(Icons.camera_alt_outlined), label: Text('Take Pic'),)),
        ],
      ),
    );
  }
}
