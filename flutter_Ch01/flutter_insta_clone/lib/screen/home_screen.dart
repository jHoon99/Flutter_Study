import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          StoryArea(),
          FeedList(),
        ],
      ),
    );
  }
}

class StoryArea extends StatelessWidget {
  const StoryArea({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: .horizontal,
      child: Row(
        children: [
          ...List.generate(
            10,
            (index) => UserStory(userName: 'User $index'),
          ),
        ],
      ),
    );
  }
}

class UserStory extends StatelessWidget {
  final String userName;

  const UserStory({
    super.key,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: 60,
                height: 60,
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.blue.shade300,
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              Text(userName),
            ],
          ),
        ],
      ),
    );
  }
}

class FeedData {
  final String userName;
  final int likeCount;
  final String content;

  const FeedData({
    required this.userName,
    required this.likeCount,
    required this.content,
  });
}

const feedDataList = [
  FeedData(userName: 'user1', likeCount: 10, content: '오늘 점심은 맛있었다. 오늘 점심은 맛있었다.오늘 점심은 맛있었다.오늘 점심은 맛있었다.오늘 점심은 맛있었다.오늘 점심은 맛있었다.오늘 점심은 맛있었다.오늘 점심은 맛있었다.오늘 점심은 맛있었다.오늘 점심은 맛있었다.오늘 점심은 맛있었다.'),
  FeedData(userName: 'user2', likeCount: 20, content: '오늘 점심은 맛있었다.'),
  FeedData(userName: 'user3', likeCount: 30, content: '오늘 점심은 맛있었다.'),
  FeedData(userName: 'user4', likeCount: 40, content: '오늘 점심은 맛있었다.'),
  FeedData(userName: 'user5', likeCount: 50, content: '오늘 점심은 맛있었다.'),
  FeedData(userName: 'user6', likeCount: 60, content: '오늘 점심은 맛있었다.'),
  FeedData(userName: 'user7', likeCount: 70, content: '오늘 점심은 맛있었다.'),
];

class FeedList extends StatelessWidget {
  const FeedList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, // ← 추가
      physics: NeverScrollableScrollPhysics(), // ← 스크롤은 부모한테 위임
      itemBuilder: (context, index) => FeedItem(feedDataList[index]),
      itemCount: feedDataList.length,
    );
  }
}

class FeedItem extends StatelessWidget {
  final FeedData feedData;

  const FeedItem(this.feedData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Row(
                spacing: 16,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(borderRadius: .circular(20), color: Colors.blue.shade300),
                  ),
                  Text(feedData.userName),
                ],
              ),
              const Icon(Icons.more_vert),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 280,
          color: Colors.indigo.shade300,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_outlined),
                    padding: EdgeInsets.zero, // ← 추가
                    constraints: BoxConstraints(), // ← 추가
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(CupertinoIcons.chat_bubble),
                    padding: EdgeInsets.zero, // ← 추가
                    constraints: BoxConstraints(), // ← 추가
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(CupertinoIcons.paperplane),
                    padding: EdgeInsets.zero, // ← 추가
                    constraints: BoxConstraints(), // ← 추가
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(CupertinoIcons.bookmark),
                    padding: EdgeInsets.zero, // ← 추가
                    constraints: BoxConstraints(), // ← 추가
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '좋아요 ${feedData.likeCount}개',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: RichText(
            maxLines: 3,
            text: TextSpan(
              children: [
                TextSpan(text: feedData.userName, style: TextStyle(fontWeight: FontWeight.bold)),
                WidgetSpan(child: SizedBox(width: 8)),
                TextSpan(text: feedData.content),
              ],
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
