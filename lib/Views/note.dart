import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxwithnotesapp/routes/notes_controller.dart';
import 'package:getxwithnotesapp/utils/colors.dart';

import '../Model/notes_model.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final titleController = TextEditingController();
    final descriptionsController = TextEditingController();
    final createdateController = DateTime.now();
    final controller=Get.put(NotesController());


    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.backgroundColor,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.link)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(35),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              textInputAction: TextInputAction.done,
              style: const TextStyle(
                fontSize: 25,
              ),
              minLines: 1,
              maxLines: 2,

              // Add your desired text style here
              decoration: const InputDecoration(
                hintText: 'Enter your Title',
                border: InputBorder.none,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: descriptionsController,
              style: const TextStyle(
                fontSize: 16,
              ),
              minLines: 1,
              maxLines: 5,

              // Add your desired text style here
              decoration: const InputDecoration(
                hintText: 'Write Your Descriptions',
                border: InputBorder.none,
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: AppColors.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: MaterialButton(
                  height: 50,
                  onPressed: () {
                    // Check if both title and descriptions are not empty
                    if (titleController.text.isNotEmpty && descriptionsController.text.isNotEmpty) {
                      // Add the note if both fields are filled
                      controller.addNotes(
                        NotesModel(
                          title: titleController.text,
                          descriptions: descriptionsController.text,
                          createdate: createdateController,
                        ),
                      );
                      // Show a success message after adding the note
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Note added successfully!'),
                        ),
                      );
                      // Navigate back to the home screen
                      Get.back();
                    } else {
                      // Show an error message if either title or descriptions is empty
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please fill in both title and descriptions.'),
                        ),
                      );
                    }
                  },


                  shape: const OutlineInputBorder(
                      borderRadius:BorderRadius.all(
                          Radius.circular(10))),
                  color: AppColors.primaryColor, // Choose your desired color
                  textColor: Colors.white, // Choose your desired text color
                  child: const Text('Save Changes',style: TextStyle(
                    fontSize: 16,
                  ),),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}