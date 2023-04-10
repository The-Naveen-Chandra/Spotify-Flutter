import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_ui/data/data.dart';
import 'package:spotify_ui/models/current_track_model.dart';

class TracksList extends StatelessWidget {
  final List<Song> tracks;
  const TracksList({super.key, required this.tracks});

  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingTextStyle: Theme.of(context).textTheme.overline!.copyWith(fontSize: 12.0),
      dataRowHeight: 50.0,
      // remove the box
      showCheckboxColumn: false,

      columns: [
        DataColumn(label: Text('Title', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey.shade400),)),
        DataColumn(label: Text('Artist', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey.shade400),)),
        DataColumn(label: Text('Album', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.grey.shade400),)),
        DataColumn(label: Icon(Icons.access_time, color: Colors.grey.shade400,)),
      ], 
      rows: tracks.map((e) {
        final selected = context.watch<CurrentTrackModel>().selected?.id == e.id;
        final textStyle = TextStyle(color: selected ? Theme.of(context).accentColor : Theme.of(context).iconTheme.color);
        return DataRow(cells: [

          // title
          DataCell(
            Text(
              e.title,
              style: textStyle,
            ),
          ),

          // artist
          DataCell(
            Text(
              e.artist,
              style: textStyle,
            ),
          ),

          // album
          DataCell(
            Text(
              e.album,
              style: textStyle,
            ),
          ),

          // duration
          DataCell(
            Text(
              e.duration,
              style: textStyle,
            ),
          ),
        ],
        selected: selected,
        onSelectChanged: (_) => context.read<CurrentTrackModel>().selectTrack(e),
        );
      }).toList(),
    );
  }
}