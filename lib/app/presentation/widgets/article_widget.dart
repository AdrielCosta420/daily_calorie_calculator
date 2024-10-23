// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_element
import 'package:flutter/material.dart';

class ArticleWidget extends StatelessWidget {
  final String autor;
  final String content;
  final String goal;
  final String title;
  final List<String> tags;
  final String imageUrl;
  final DateTime publishedDate;

  const ArticleWidget({
    super.key,
    required this.autor,
    required this.content,
    required this.goal,
    required this.title,
    required this.tags,
    required this.imageUrl,
    required this.publishedDate,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openPostBottomSheet(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 3,
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),

              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // const SizedBox(height: 10),
              // Text(
              //   content,
              //   maxLines: 2,
              //   overflow: TextOverflow.ellipsis,
              //   style: const TextStyle(fontSize: 14),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void _openPostBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height * .95,
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          imageUrl,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'by $autor',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        content,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xffc9deb5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          goal,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        children: tags.map((tag) {
                          return Chip(
                            label: Text(tag),
                            backgroundColor: Colors.blueGrey[50],
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Published on ${publishedDate.day}/${publishedDate.month}/${publishedDate.year}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: () => Navigator.of(ctx).pop(),
                      child: const CircleAvatar(
                        backgroundColor: Colors.black54,
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: () => Navigator.of(ctx).pop(),
                      child: const CircleAvatar(
                        backgroundColor: Colors.black54,
                        child: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
