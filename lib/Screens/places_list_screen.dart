import 'package:flutter/material.dart';


import '../Widget/image_preview.dart';


class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _titleController=TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Great Places'),
        actions: [
          IconButton(onPressed: ()=> showModalBottomSheet(
              context: context, builder: (BuildContext ctx){
            return Column(children: [
              Expanded(child: Column(children: [
                Container(
                  margin:const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  padding:const EdgeInsets.fromLTRB(10,2,10,2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5,),
                      border: Border.all(color: Theme.of(context).colorScheme.primary,),
                  ),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText:  "Place Name",
                    ),
                    controller: _titleController,
                  ),
                ),
                SizedBox(height: 10,),
                ImagePreview(),
              ],),),
              ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.add), label: Text('Add Place'),),
            ],);
          }),
            icon: const Icon(Icons.add,),),
        ],
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
