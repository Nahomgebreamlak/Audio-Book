import './viewcontroler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:just_audio/just_audio.dart';

class FloatingAudioPlayer extends StatefulWidget {
  final Function onPaused;
  String audiopath;
  String musicduration;
  FloatingAudioPlayer(
      {Key keys, @required this.onPaused, this.audiopath, this.musicduration})
      : super(key: keys);

  @override
  _FloatingAudioPlayerState createState() => _FloatingAudioPlayerState();
}

class _FloatingAudioPlayerState extends State<FloatingAudioPlayer> {
  Duration _duration;
  AudioPlayer _audioPlayer;
  final boxmusic = GetStorage();
  final ViewPageController viewcontroler = Get.put(ViewPageController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 35),
        Container(
          height: 75,
          width: 325,
          decoration: BoxDecoration(
            color: Colors.grey[350].withOpacity(0.8),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: StreamBuilder(
            stream: _audioPlayer.positionStream,
            builder: (context, snapshot) {
              if (snapshot.hasData && _duration != null) {
                if (_audioPlayer.processingState == ProcessingState.completed) {
                  _audioPlayer.stop();
                  Future.delayed(Duration(seconds: 0), widget.onPaused);
                }
                return Row(
                  children: [
                    if (_audioPlayer.playerState.playing)
                      pauseButton()
                    else
                      playButton(),
                    Expanded(child: progressSlider(snapshot.data)),
                  ],
                );
              }

              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    );
  }

  Widget playButton() {
    return IconButton(
      icon: Icon(Icons.play_arrow_outlined),
      onPressed: playAudio,
      iconSize: 34,
      color: Colors.white,
    );
  }

  Widget pauseButton() {
    return IconButton(
      icon: Icon(Icons.pause_outlined),
      onPressed: pause,
      iconSize: 34,
      color: Colors.white,
    );
  }

  pause() {
    _audioPlayer.pause();
    Future.delayed(Duration(milliseconds: 500), widget.onPaused);
  }

  Widget progressSlider(Duration position) {
    const textStyle = TextStyle(color: Colors.black);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(position.toString().substring(2, 7), style: textStyle),
              Text(_duration.toString().substring(2, 7), style: textStyle),
            ],
          ),
        ),
        SizedBox(
          width: 300,
          height: 25,
          child: Slider(
            min: 0,
            max: _duration.inMilliseconds.toDouble(),
            value: position.inMilliseconds.toDouble(),
            activeColor: Colors.white,
            inactiveColor: Colors.grey,
            onChanged: (value) {
              _audioPlayer.seek(Duration(milliseconds: value.floor()));
            },
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    initAudio();
  }

  @override
  void dispose() {
    super.dispose();
    print(" player dispose in  ${_audioPlayer.position}");
    boxmusic.write("${widget.musicduration}", _audioPlayer.position);
    print("bax value in dispose music  ${boxmusic.read('musicduration')}");

    _audioPlayer?.dispose();
  }

  initAudio() async {
    //  print(audiopath);
    _audioPlayer = AudioPlayer();
    final duration = await _audioPlayer.setAsset(widget.audiopath);
    if (boxmusic.read('${widget.musicduration}') == null) {
      boxmusic.write('${widget.musicduration}', _audioPlayer.position);
    }

    setState(() {
      print("bax value in init music  ${boxmusic.read('musicduration')}");

      _duration = duration;
      //
      //_duration = parseDuration(boxmusic.read('musicduration'));

      print(" player duration in init ${_audioPlayer.position}");
    });

    playAudio();
  }

  playAudio() {
    //String time = boxmusic.read('musicduration');
    // print(time);
    _audioPlayer.seek(boxmusic.read('${widget.musicduration}'));

    _audioPlayer.play();
  }

  Duration parseDuration(String s) {
    int hours = 0;
    int minutes = 0;
    int micros;
    List<String> parts = s.split(':');
    if (parts.length > 2) {
      hours = int.parse(parts[parts.length - 3]);
    }
    if (parts.length > 1) {
      minutes = int.parse(parts[parts.length - 2]);
    }
    micros = (double.parse(parts[parts.length - 1]) * 1000000).round();
    return Duration(hours: hours, minutes: minutes, microseconds: micros);
  }
}
