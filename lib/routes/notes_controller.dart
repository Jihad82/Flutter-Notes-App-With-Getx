import 'package:get/get.dart';
import 'package:getxwithnotesapp/Model/notes_model.dart';

class NotesController extends GetxController{

  RxList notes =<NotesModel> [].obs;
  addNotes ( NotesModel notesData)

  {
    notes.add(notesData);
    update();

  }

  void deleteNote(int index) {}
}