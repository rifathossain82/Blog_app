import 'package:bootcamp_app/controller/blog/blogs_list_controller.dart';
import 'package:bootcamp_app/controller/blog/favorite_blog_list_controller.dart';
import 'package:bootcamp_app/controller/blog/state/blog_state.dart';
import 'package:bootcamp_app/views/screens/components/blog_card.dart';
import 'package:bootcamp_app/views/screens/create_update_blog_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteBlogsListScreen extends ConsumerStatefulWidget {
  const FavoriteBlogsListScreen({Key? key}) : super(key: key);

  @override
  _FavoriteBlogsListScreenState createState() => _FavoriteBlogsListScreenState();
}

class _FavoriteBlogsListScreenState extends ConsumerState<FavoriteBlogsListScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteBlogsListState = ref.watch(favoriteBlogsListProvider);
    final favoriteBlogsList = favoriteBlogsListState is FavoriteBlogsListSuccessState ? favoriteBlogsListState.blogsList : [];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, CupertinoPageRoute(builder: (context) => const CreateUpdateBlogScreen()));
        },
        child: const Icon(Icons.add),
      ),
      body: favoriteBlogsListState is FavoriteBlogsListSuccessState && favoriteBlogsList.isNotEmpty
          ? ListView.builder(
              itemCount: favoriteBlogsList.length,
              itemBuilder: (BuildContext context, int index) {
                return BlogCard(blogModel: favoriteBlogsList[index]);
              },
            )
          : favoriteBlogsList.isEmpty
          ? const Center(child:  Text('No Data Found'))
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
