import 'package:flutter/material.dart';
import 'package:login_page/viewmodel/login_view_model.dart';
import 'package:login_page/views/create_new_password/create_new_password.dart';
import 'package:login_page/views/verify_your_password/verify_password.dart';
import 'package:provider/provider.dart';
void main(List<String> args) {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (context)=>LoginViewModel() )
  ],    child: MaterialApp(
          debugShowCheckedModeBanner: false,
          
          home: CreateNewPassword(),

      
      ),
    );
  }
}