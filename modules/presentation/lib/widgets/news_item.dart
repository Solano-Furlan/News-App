import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    Key? key,
    required this.article,
    required this.onPressed,
  }) : super(key: key);

  final ArticleModel article;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(0),
        primary: Colors.grey.shade200,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 250,
            width: double.infinity,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(24),
            ),
            child: article.urlToImage != null
                ? Image.network(
                    article.urlToImage!,
                    fit: BoxFit.cover,
                  )
                : null,
          ),
          const SizedBox(height: 15),
          AutoSizeText(
            article.title ?? "",
            maxLines: 2,
            style: appTheme.textTheme.headline2,
          ),
          const SizedBox(height: 10),
          AutoSizeText(
            article.publishedAt.toString(),
            maxLines: 1,
            style: appTheme.textTheme.labelSmall,
          ),
          const SizedBox(height: 10),
          AutoSizeText(
            article.author ?? article.source ?? "",
            maxLines: 1,
            style: appTheme.textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}
