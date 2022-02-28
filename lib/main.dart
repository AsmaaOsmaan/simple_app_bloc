import 'package:flutter/material.dart';
import 'package:flutter_blocc/app_router.dart';

void main() {
// hello from branch test
//test2

  runApp(BreakingBadApp(appRouter: AppRouter(),));
}

class BreakingBadApp extends StatelessWidget {
  final AppRouter appRouter;

  const BreakingBadApp({Key? key,required this.appRouter}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          onGenerateRoute:appRouter.generateRoute ,
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


