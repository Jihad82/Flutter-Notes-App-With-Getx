import 'package:get/get.dart';
import 'package:getxwithnotesapp/Views/home.dart';
import 'package:getxwithnotesapp/Views/note.dart';
import 'package:getxwithnotesapp/routes/routes_name.dart';

class RoutePages{
  static List<GetPage<dynamic>>? routes =[
    GetPage(
        name: RoutesName.Home,
        page: () => HomePage(),
    ),
    GetPage(
      name: RoutesName.NoteScreen,
      page: () => NoteScreen(),
    ),

  ];
}