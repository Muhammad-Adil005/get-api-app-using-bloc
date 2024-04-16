import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_api_app_using_bloc/ui/post_screen.dart';

import 'bloc/post_bloc.dart';

void main() {
  runApp(const ApiAppUsingBloc());
}

class ApiAppUsingBloc extends StatelessWidget {
  const ApiAppUsingBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Api App using Bloc State Management',
        home: PostsScreens(),
      ),
    );
  }
}
