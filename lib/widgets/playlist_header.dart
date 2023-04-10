import 'package:flutter/material.dart';
import 'package:spotify_ui/data/data.dart';

class PlaylistHeader extends StatelessWidget {
  final Playlist playlist;

  const PlaylistHeader({super.key, required this.playlist});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          playlist.imageURL,
          height: 200.0,
          width: 200.0,
          fit: BoxFit.cover,
        ),
        
        const SizedBox(width: 16.0,),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'PLAYLIST',
                style: Theme.of(context).textTheme.overline!.copyWith(fontSize: 20.0),
              ),
              const SizedBox(height: 12.0,),
              Text(playlist.name, style: Theme.of(context).textTheme.headline2,),
              const SizedBox(height: 16.0,),
              Text(playlist.description, style: Theme.of(context).textTheme.subtitle1,),
              const SizedBox(height: 16.0,),
              
            ],
          )
        ),
      ],
    );
  }
}