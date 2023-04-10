import 'package:flutter/material.dart';
import 'package:spotify_ui/data/data.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 220.0,
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          // Row(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.all(16.0),
          //       child: Image.asset(
          //         'assets/images/spotify_logo.png',
          //         height: 45.0,
          //         filterQuality: FilterQuality.high,
          //       ),
          //     ),
          //   ],
          // ),
          _SideMenuIconTab(
            iconData: Icons.home_outlined,
            title: 'Home',
            onTap: () {},
          ),
          _SideMenuIconTab(
            iconData: Icons.search,
            title: 'Search',
            onTap: () {},
          ),
          _SideMenuIconTab(
            iconData: Icons.audiotrack_outlined,
            title: 'Radio',
            onTap: () {},
          ),
          const SizedBox(
            height: 24.0,
          ),

          _SideMenuIconTab(
            iconData: Icons.add_box, 
            title: 'Create Playlist', 
            onTap: () {},
          ),
          _SideMenuIconTab(
            iconData: Icons.favorite_outlined, 
            title: 'Liked Song', 
            onTap: () {},
          ),


          

          _LibraryPlaylist(),
        ],
      ),
    );
  }
}

class _SideMenuIconTab extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;

  const _SideMenuIconTab({
    super.key,
    required this.iconData,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: Theme.of(context).iconTheme.color,
        size: 28.0,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: onTap,
    );
  }
}

class _LibraryPlaylist extends StatefulWidget {
  const _LibraryPlaylist({super.key});

  @override
  State<_LibraryPlaylist> createState() => __LibraryPlaylistState();
}

class __LibraryPlaylistState extends State<_LibraryPlaylist> {

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
    return Expanded(
      child: Scrollbar(
        thumbVisibility: true,
        controller: _scrollController,

        child: ListView(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(vertical: 12.0,),
          physics: const ClampingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    "Your Library",
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...yourLibrary.map((e) => 
                  ListTile(
                    dense: true,
                    title: 
                      Text(
                      e,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ).toList(),
              ],
            ),
      
            const SizedBox(height: 24.0,),
      
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    "Playlist",
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ...playlists.map((e) => 
                  ListTile(
                    dense: true,
                    title: 
                      Text(
                      e,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ).toList(),
              ],
            ),
      
          ],
        ),
      ),
    );
  }
}
