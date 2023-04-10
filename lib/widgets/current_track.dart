import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_ui/models/current_track_model.dart';

class CurrentTrack extends StatelessWidget {
  const CurrentTrack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      width: double.infinity,
      color: const Color(0xFF181818),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: const [

            // track info
            _TrackInfo(),

            Spacer(),

            // Player Controls
            _PlayerControls(),
            
            Spacer(),

            // More Controls
            _MoreControls(),
          ],
        ),
      ),
    );
  }
}

class _TrackInfo extends StatelessWidget {
  const _TrackInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;

    if (selected == null) {
      return const SizedBox.shrink();
    }

    return Row(
      children: [
        Image.asset(
          'assets/images/lofigirl.jpg',
          height: 60.0,
          width: 60.0,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 12.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              selected.title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              selected.artist,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Colors.grey[300], fontSize: 12.0),
            )
          ],
        ),

        const SizedBox(width: 12.0,),

        // Icons
        IconButton(
          onPressed: () {}, 
          icon: const Icon(Icons.favorite_border),
          color: Colors.grey.shade400,
          iconSize: 20,
        ),
      ],
    );
  }
}

class _PlayerControls extends StatelessWidget {
  const _PlayerControls({super.key});

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              padding: const EdgeInsets.only(),
              iconSize: 22.0 ,  
              onPressed: () {},
              color: Colors.grey.shade700,
              icon: const Icon(Icons.shuffle_rounded), 
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              iconSize: 30.0 ,  
              onPressed: () {},
              color: Colors.grey.shade400,
              icon: const Icon(Icons.skip_previous_sharp), 
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              iconSize: 40.0 ,  
              onPressed: () {},
              icon: const Icon(Icons.play_circle_fill_sharp), 
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              iconSize: 30.0 ,  
              onPressed: () {},
              color: Colors.grey.shade400,
              icon: const Icon(Icons.skip_next_sharp), 
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              iconSize: 22.0 ,  
              onPressed: () {},
              color: Colors.grey.shade700,
              icon: const Icon(Icons.repeat_sharp), 
            ),
          ],
        ),
        const SizedBox(height: 4.0,),
        Row(
          children: [
            Text('0:00', style: Theme.of(context).textTheme.caption,),
            const SizedBox(width: 8.0,),
            
            Container(
              height: 5.0,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),

            const SizedBox(width: 8.0,),

            Text(
              selected?.duration ?? '0:00',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ],
    );
  }
}

class _MoreControls extends StatelessWidget {
  const _MoreControls({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}