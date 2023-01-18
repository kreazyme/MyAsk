import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/post/post_entity.dart';
import 'package:flutter_application_1/presentation/feature/Post/bloc/post_detail_presenter.dart';
import 'package:flutter_application_1/presentation/feature/Post/bloc/post_detail_state.dart';
import 'package:flutter_application_1/presentation/resource/AppEnum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_time_ago/get_time_ago.dart';

class DetailPostPage extends StatefulWidget {
  const DetailPostPage({super.key, required this.post});

  final PostEntity post;

  @override
  State<DetailPostPage> createState() => _DetailPostPageState();
}

class _DetailPostPageState extends State<DetailPostPage> {
  final PostDetailPresenter _postDetailPresenter = PostDetailPresenter();

  @override
  void initState() {
    super.initState();
    _postDetailPresenter.init(widget.post);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostDetailPresenter, PostDetailState>(
      listener: (context, state) {},
      bloc: _postDetailPresenter,
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: const Text('Detail Post'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.post.content,
                style: const TextStyle(fontSize: 22),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
              Row(
                children: [
                  const Icon(Icons.person_outline),
                  const Padding(padding: EdgeInsets.all(4)),
                  Text(
                    "${state.post.user.name}  -",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Padding(padding: EdgeInsets.all(4)),
                  const Icon(Icons.access_time),
                  const Padding(padding: EdgeInsets.all(4)),
                  Text(GetTimeAgo.parse(DateTime.parse(state.post.createdAt)),
                      style: const TextStyle(fontSize: 16)),
                ],
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: false,
                    physics: const ScrollPhysics(),
                    itemCount: state.post.comments.length + 1,
                    itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              color: state.post.comments.length == index
                                  ? Colors.white
                                  : Colors.grey[200]),
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: index == state.post.comments.length
                              ? Container(
                                  child: state.isLoading == LoadingState.loading
                                      ? const Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : Container(
                                          child: state.currentPage <
                                                  state.totalPage
                                              ? MaterialButton(
                                                  onPressed: () {
                                                    _postDetailPresenter
                                                        .loadMore(1);
                                                  },
                                                  child: const Center(
                                                      child: Text(
                                                          'Load more comments')),
                                                )
                                              : Container(),
                                        ))
                              : ListTile(
                                  title: Text(
                                    state.post.comments[index].content,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  subtitle: Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.person_outline),
                                        const Padding(
                                            padding: EdgeInsets.all(4)),
                                        Text(
                                          "${state.post.comments[index].user.name}  -",
                                          style: const TextStyle(fontSize: 16),
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.all(4)),
                                        const Icon(Icons.access_time),
                                        const Padding(
                                            padding: EdgeInsets.all(4)),
                                        Text(
                                            GetTimeAgo.parse(DateTime.parse(
                                                state.post.comments[index]
                                                    .createdAt)),
                                            style:
                                                const TextStyle(fontSize: 16)),
                                      ],
                                    ),
                                  )),
                        )),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: state.isLoading == LoadingState.success && state.isLogin
                    ? TextField(
                        onChanged: (value) =>
                            _postDetailPresenter.onChangeComment(value),
                        decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.send_rounded,
                                color: state.comment == ""
                                    ? Colors.grey
                                    : Colors.blue,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            labelText: 'Comment',
                            hintText: 'Enter your comment'),
                      )
                    : Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
