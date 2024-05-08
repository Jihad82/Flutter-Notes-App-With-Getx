import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxwithnotesapp/routes/route_page.dart';
import 'package:getxwithnotesapp/routes/routes_name.dart';
import 'package:getxwithnotesapp/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Notes App ',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.backgroundColor,

      ),
      getPages: RoutePages.routes,
      initialRoute: RoutesName.Home,
    );
  }
}
