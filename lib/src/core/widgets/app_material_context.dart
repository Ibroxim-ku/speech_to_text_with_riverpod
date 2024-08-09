import 'package:flutter/material.dart';
import 'package:text_writer/src/core/route/app_route_name.dart';
import 'package:text_writer/src/core/route/app_router.dart';

class AppMaterialContext extends StatelessWidget {
  const AppMaterialContext({super.key});

  @override
  Widget build(BuildContext context) => Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Convertor',
          initialRoute: AppRouteName.homePage,
          onGenerateRoute: AppRouter().onGenerateRoute,
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
            child: ScrollConfiguration(
              behavior: const ScrollBehavior(),
              child: child ?? const Scaffold(),
            ),
          ),
        ),
      );
}
