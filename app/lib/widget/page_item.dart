import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PageItem extends StatefulWidget {
  int? id;
  String? name;
  String? address;
  String? content;
  PageItem({super.key, this.id, this.address, this.content, this.name});

  @override
  State<PageItem> createState() => _PageItemState();
}

class _PageItemState extends State<PageItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// 顶部头像名称
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage('https://picsum.photos/200?random=${widget.id ?? 1}'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name ?? '-',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.address ?? '-',
                        style: const TextStyle(fontSize: 16),
                      )
                    ],
                  )
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.ellipsis),
              )
            ],
          ),
        ),

        /// 大图
        Expanded(
          child: Image.network(
            'https://picsum.photos/1500?random=${widget.id ?? 1}',
            fit: BoxFit.cover,
          ),
        ),

        /// 底部内容
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 操作按钮
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(CupertinoIcons.heart),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(CupertinoIcons.chat_bubble),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(CupertinoIcons.paperplane),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(CupertinoIcons.bookmark),
                  ),
                ],
              ),

              /// 点赞区
              const Row(
                children: [
                  SizedBox(
                    width: 24 * 2,
                    child: Stack(
                      children: [
                        Positioned(
                          child: CircleAvatar(
                            radius: 12,
                            backgroundImage: NetworkImage('https://picsum.photos/200?random=7'),
                          ),
                        ),
                        Positioned(
                          left: 12,
                          child: CircleAvatar(
                            radius: 12,
                            backgroundImage: NetworkImage('https://picsum.photos/200?random=153'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text('Liked by xxx and 100 others'),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Text(widget.content ?? '-')
            ],
          ),
        ),
      ],
    );
  }
}
