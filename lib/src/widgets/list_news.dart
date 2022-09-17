import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_models.dart';
import 'package:newsapp/src/theme/theme.dart';

class ListNews extends StatelessWidget {
  final List<Article> news;

  const ListNews(this.news);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (BuildContext context, int index) {
        return _New(news: news[index], index: index);
      },
    );
  }
}

class _New extends StatelessWidget {
  final Article news;
  final int index;

  const _New({required this.news, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TarjetTopBar(news, index),
        _TargetTitle(news: news),
        _TargetImage(news: news),
        _TargetBody(news: news),
        _TargetButtom(),
        const SizedBox(height: 10),
        const Divider(),
      ],
    );
  }
}

class _TargetButtom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: () {},
            fillColor: mytheme.accentColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.star_border),
          ),
          const SizedBox(
            width: 10,
          ),
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.blue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.more),
          ),
        ],
      ),
    );
  }
}

class _TargetBody extends StatelessWidget {
  final Article news;

  const _TargetBody({required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text((news.description != null) ? news.description! : ''),
    );
  }
}

class _TargetImage extends StatelessWidget {
  final Article news;

  const _TargetImage({required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
          // ignore: unnecessary_null_comparison
          child: (news.urlToImage != null)
              ? FadeInImage(
                  image: NetworkImage(news.urlToImage!),
                  placeholder: const AssetImage('assets/img/giphy.gif'),
                )
              : const Image(image: AssetImage('assets/img/no-image.png')),
        ),
      ),
    );
  }
}

class _TargetTitle extends StatelessWidget {
  final Article news;

  const _TargetTitle({required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        news.title,
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TarjetTopBar extends StatelessWidget {
  final Article news;
  final int index;
  const _TarjetTopBar(this.news, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          // Text(
          //   '${index + 1}',
          //   style: TextStyle(color: mytheme.accentColor),
          // ),
          Text('${news.source.name}'),
        ],
      ),
    );
  }
}
