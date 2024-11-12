import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CachedImage extends StatelessWidget {
  String? imageUrl;
  CachedImage({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(color: Colors.grey),
        errorWidget: (context, url, error) => Container(color: Colors.red[100]),
        imageUrl: imageUrl ??
            'https://startflutter.ir/api/files/equwrpwnez9pvim/qnbj8d6b9lzzpn8/rectangle_63_OHpTjZfdL4.png',
      ),
    );
  }
}
