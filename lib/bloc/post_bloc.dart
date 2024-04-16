import 'package:bloc/bloc.dart';
import 'package:get_api_app_using_bloc/bloc/post_event.dart';
import 'package:get_api_app_using_bloc/bloc/post_state.dart';
import 'package:get_api_app_using_bloc/utils/enum.dart';

import '../model/post_model.dart';
import '../repository/post_repository.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostRepository postRepository =
      PostRepository(); // This line is called Dependencies Injection
  List<PostModel> tempPostList = [];

  PostBloc() : super(const PostState()) {
    on<PostFetched>(fetchPostApi);
  }

  Future<void> fetchPostApi(PostFetched event, Emitter<PostState> emit) async {
    await postRepository.fetchPost().then((value) {
      emit(
        state.copyWith(
            postStatus: PostStatus.success,
            postList: value,
            message: 'success'),
      );
    }).onError((error, stackTrace) {
      print('error inside fetchPostApi function : $error');
      print('stackTrace inside fetchPostApi function : $stackTrace');
      emit(state.copyWith(
          postStatus: PostStatus.failure, message: error.toString()));
    });
  }
}
