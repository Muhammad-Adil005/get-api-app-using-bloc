import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_api_app_using_bloc/bloc/post_bloc.dart';
import 'package:get_api_app_using_bloc/bloc/post_event.dart';
import 'package:get_api_app_using_bloc/bloc/post_state.dart';
import 'package:get_api_app_using_bloc/utils/enum.dart';

class PostsScreens extends StatefulWidget {
  const PostsScreens({super.key});

  @override
  State<PostsScreens> createState() => _PostsScreensState();
}

class _PostsScreensState extends State<PostsScreens> {
  @override
  void initState() {
    context.read<PostBloc>().add(PostFetched());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("POST API's"),
        ),
        body: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            switch (state.postStatus) {
              case PostStatus.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case PostStatus.failure:
                return Center(
                  child: Text(
                    state.message.toString(),
                  ),
                );
              case PostStatus.success:
                return ListView.builder(
                    itemCount: state.postList.length,
                    itemBuilder: (context, index) {
                      final item = state.postList[index];
                      return ListTile(
                        title: Text(
                          item.title.toString(),
                          style: const TextStyle(
                            color: Colors.pinkAccent,
                          ),
                        ),
                        subtitle: Text(
                          item.body.toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    });
            }
          },
        ));
  }
}
