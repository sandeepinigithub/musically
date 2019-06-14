import 'package:flutter/material.dart';
import 'package:musically/core/viewmodel/TabProvider.dart';
import 'package:musically/core/enum/view_state.dart';
import 'package:musically/core/viewmodel/music_model.dart';
import 'package:musically/ui/widgets/base_view.dart';

import '../locator.dart';

class Music extends StatefulWidget {
  @override
  _MusicState createState() => _MusicState();
}

class _MusicState extends State<Music> {
  MusicModel model = locator<MusicModel>();
  final isPlaying = locator<PlayerProvider>();

  @override
  void initState() {
    super.initState();
    model.initPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<PlayerProvider>(
      builder: (context, player, _) => BaseView<MusicModel>(
            builder: (context, musicmodel, _) =>
                (musicmodel.state == ViewState.Busy || musicmodel.songs == null)
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : (musicmodel.songs.length == 0 ||
                            musicmodel.songs.length == null)
                        ? Center(
                            child: Text('Oops! No song found.'),
                          )
                        : ListView.builder(
                            itemCount: musicmodel.songs.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                  leading: CircleAvatar(
//                  child: Image.network(model.songs[index].albumArt),
                                      ),
                                  title: Text(musicmodel.songs[index].title),
                                  onTap: () {
                                    musicmodel.play(
                                        musicmodel.songs[index].uri, index);
                                  });
                            }),
          ),
    );
  }
}
