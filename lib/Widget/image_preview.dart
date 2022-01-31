import 'package:flutter/material.dart';
import 'dart:io';

class ImagePreview extends StatefulWidget {
  const ImagePreview({Key? key}) : super(key: key);

  @override
  _ImagePreviewState createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  var _iamgePicker;
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
            child: _iamgePicker == null ? Center(child: Text('Pick Your Image',),): Image.file(_iamgePicker!,fit: BoxFit.cover,)
          ),
          SizedBox(width: 10,),
          Expanded(child: ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.camera_alt_outlined), label: Text('Take Pic'),)),
        ],
      ),
    );
  }
}
