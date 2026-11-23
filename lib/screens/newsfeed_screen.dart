import 'package:flutter/material.dart';
import '../widgets/newsfeed_card.dart';

// The newsfeed: a list of two posts.
// Post 1 is MY post. Post 2 is by a classmate.
// TODO: change "Classmate Name" below to your classmate's real name
// and use their own post text and date.

class Post {
  Post({
    required this.authorName,
    required this.date,
    required this.text,
    required this.likes,
    this.avatarAsset,
    this.imageAsset,
    this.isLiked = false,
  });

  final String authorName;
  final String date;
  final String text;
  int likes;
  bool isLiked;
  final String? avatarAsset; // profile image (Enhancement 2)
  final String? imageAsset; // null = post has no image (Enhancement 1)
}

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({super.key});

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  final List<Post> _posts = [
    Post(
      authorName: 'Jonjuan Cruz',
      date: 'October 11',
      text: 'HIRAP!',
      likes: 99,
      avatarAsset: 'assets/images/avatar_me.png',
      imageAsset: null, // no image: the card hides the image area
    ),
    Post(
      authorName: 'Yvette Hidalgo Sr.',
      date: 'January 12',
      text: 'I miss you!',
      likes: 200,
      avatarAsset: 'assets/images/avatar_classmate.png',
      imageAsset: 'assets/images/imissyou.jpg',
    ),
  ];
  void _toggleLike(int index) {
    setState(() {
      final post = _posts[index];
      post.isLiked = !post.isLiked;
      post.likes += post.isLiked ? 1 : -1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _posts.length,
      itemBuilder: (context, index) {
        final post = _posts[index];
        return NewsFeedCard(
          authorName: post.authorName,
          date: post.date,
          text: post.text,
          likes: post.likes,
          isLiked: post.isLiked,
          avatarAsset: post.avatarAsset,
          imageAsset: post.imageAsset,
          onLike: () => _toggleLike(index),
        );
      },
    );
  }
}
