import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxwithnotesapp/Coustom_view/coustom_single_notes.dart';
import 'package:getxwithnotesapp/routes/notes_controller.dart';
import 'package:getxwithnotesapp/routes/routes_name.dart';
import 'package:getxwithnotesapp/utils/colors.dart';
import 'package:intl/intl.dart';

// Define the DateFormat class outside of the HomePage class
class MyDateFormat {
  final String pattern;

  MyDateFormat(this.pattern);

  String format(DateTime dateTime) {
    final formatter = DateFormat(pattern);
    return formatter.format(dateTime);
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);String formattedTime(DateTime dateTime) {
    final formatter = DateFormat('h:mma (M/d/yyyy)');
    return formatter.format(dateTime);
  }


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotesController());

    return Scaffold(
      body: Container(
        color: AppColors.backgroundColor,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'My Notes',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        // Replace this with your desired function
                        print('Menu button pressed');
                      },
                      icon: const Icon(Icons.menu),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            // Add your function here
                            print('Search button pressed');
                          },
                          icon: const Icon(Icons.search_rounded),
                        ),
                        IconButton(
                          onPressed: () {
                            // Add your function here
                            print('More button pressed');
                          },
                          icon: const Icon(Icons.more_vert),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: Obx(() {
                    if (controller.notes.isEmpty) {
                      return const Center(
                        child: Text('No Notes Available!'),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: controller.notes.length,
                        itemBuilder: (context, index) {
                          final note = controller.notes[index];
                          return CoustomeSingleNotes(
                            title: note.title,
                            date: formattedTime(note.createdate),
                            descriptions: note.descriptions,
                            onDelete: () {
                              // Implement your delete logic here
                              controller.deleteNote(index); // Assuming you have a deleteNote method in NotesController
                            },
                          );
                        },
                      );

                    }
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: AppColors.primaryColor,
        onPressed: () => Get.toNamed(RoutesName.NoteScreen),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
