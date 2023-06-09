import 'package:flutter/material.dart';
import 'package:spotify_ui/data/data.dart';
import 'package:spotify_ui/widgets/widgets.dart';

class PlaylistScreen extends StatefulWidget {

  final Playlist playlist;

  const PlaylistScreen({super.key, required this.playlist});

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  ScrollController? _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 140.0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // left
              InkWell(
                customBorder: const CircleBorder(),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.chevron_left_rounded, size: 28.0,),
                ),
              ),
              
              const SizedBox(width: 14.0),

              // right
              InkWell(
                customBorder: const CircleBorder(),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.chevron_right_rounded, size: 28.0,),
                ),
              ),
            ],
          ),
        ),

        actions: [
          TextButton.icon(
            style: TextButton.styleFrom(foregroundColor: Theme.of(context).iconTheme.color),
            onPressed: () {}, 
            icon: const Icon(
              Icons.account_circle_outlined,
              size: 30.0,
            ),
            label: const Text("Naveen"),
          ),

          const SizedBox(width: 1.0,),

          IconButton(
            padding: const EdgeInsets.only(),
            onPressed: () {}, 
            icon: const Icon(
              Icons.keyboard_arrow_down,
              size: 30.0,
            ),
          ),

          const SizedBox(width: 20.0,),

        ],
      ),

      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFb01c2c),
              // const Color(0xFFAF1018),
              Theme.of(context).backgroundColor,
            ],
            stops: const  [0,0.6],
          ),
        ),
        child: Scrollbar(
          thumbVisibility: true,
          controller: _scrollController,
          child: ListView(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 60.0,
            ),
            children: [

              const SizedBox(height: 30.0,),

              // Playlist Header
              PlaylistHeader(playlist: widget.playlist),
              
              const SizedBox(height: 24.0,),
              
              // Track List
              TracksList(tracks: widget.playlist.songs),
            ],
          ),
        ),
      ),
    );
  }
}