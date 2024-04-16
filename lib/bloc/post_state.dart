import 'package:equatable/equatable.dart';

import '../model/post_model.dart';
import '../utils/enum.dart';

class PostState extends Equatable {
  final PostStatus postStatus; // This is come from enum.dart
  final List<PostModel> postList; // This is come from Model
  final String message; //This is a simple message to display

  const PostState({
    this.postStatus =
        PostStatus.loading, // initially the status should be loading
    this.postList = const <PostModel>[], // initially the list will be empty
    this.message = '',
  });

  // We write copyWith because when we declare the new instance of the class declared above or to update the instance of the class
  PostState copyWith(
      {PostStatus? postStatus, List<PostModel>? postList, String? message}) {
    return PostState(
      postStatus: postStatus ?? this.postStatus,
      postList: postList ?? this.postList,
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [postStatus, postList, message];
}
