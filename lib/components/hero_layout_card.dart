import 'package:flutter/material.dart';

class HeroLayoutCard extends StatelessWidget {
  const HeroLayoutCard({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: <Widget>[
          ClipRect(
            child: OverflowBox(
              maxWidth: width * 7 / 8,
              minWidth: width * 7 / 8,
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                  url,
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(18.0),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     mainAxisSize: MainAxisSize.min,
            //     children: <Widget>[
            //       Text(
            //         imageInfo.title,
            //         overflow: TextOverflow.clip,
            //         softWrap: false,
            //         style: Theme.of(context)
            //             .textTheme
            //             .headlineLarge
            //             ?.copyWith(color: Colors.white),
            //       ),
            //       const SizedBox(height: 10),
            //       Text(
            //         imageInfo.subtitle,
            //         overflow: TextOverflow.clip,
            //         softWrap: false,
            //         style: Theme.of(context)
            //             .textTheme
            //             .bodyMedium
            //             ?.copyWith(color: Colors.white),
            //       )
            //     ],
            //   ),
          ),
        ]);
  }
}
