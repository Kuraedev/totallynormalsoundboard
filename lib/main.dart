import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
 
void main() {
  return runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Totally normal soundboard',
          style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: XylophonePage(),
    ),
  ));
}
 
class XylophonePage extends StatefulWidget {
  const XylophonePage({super.key});
 
  @override
  State<XylophonePage> createState() => _XylophonePageState();
}
 
class _XylophonePageState extends State<XylophonePage> {
  AudioPlayer? currentPlayer;

  void playSound(String soundFile) async {
    // Stop the current player if it's playing
    if (currentPlayer != null) {
      await currentPlayer!.stop();
      await currentPlayer!.dispose();
    }

    // Create new player and play the sound
    currentPlayer = AudioPlayer();
    await currentPlayer!.play(AssetSource('sounds/$soundFile'));
  }

  @override
  void dispose() {
    currentPlayer?.dispose();
    super.dispose();
  }

  Widget buildSoundButton(String label, String soundFile, Color color) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          margin: EdgeInsets.all(8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(color: Colors.black, width: 2),
              ),
              padding: EdgeInsets.zero,
            ),
            onPressed: () => playSound(soundFile),
            child: SizedBox(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: AspectRatio(
          aspectRatio: 3 / 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  children: [
                    buildSoundButton('Enrique', 'enrique.mp3', Color(0xFF66BB6A)),
                    buildSoundButton('Maayong Gabi', 'maayong-gabi.mp3', Color(0xFF4CAF50)),
                    buildSoundButton('Kiara Swearing', 'kiara-swearing-tutorial.mp3', Color(0xFF81C784)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    buildSoundButton('Diddy Done', 'diddy-done.mp3', Color(0xFFFFE0B2)),
                    buildSoundButton('Discord Call', 'discord-call-sound.mp3', Color(0xFFFF9800)),
                    buildSoundButton('Low Cortisol', 'low-cortisol-song.mp3', Color(0xFFE65100)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    buildSoundButton('Mamboman', 'mamboman-bo-shi-ge-ju-matikanetannhauser.mp3', Color(0xFFE57373)),
                    buildSoundButton('Kim Jong Un', 'kim-jong-un-brainrot.mp3', Color(0xFFF06292)),
                    buildSoundButton('Allahu Akbar', 'allahu-akbaar.mp3', Color(0xFFF8BBD0)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    buildSoundButton('Ambatukam', 'ambatukam.mp3', Color(0xFF9C27B0)),
                    buildSoundButton('Battotai', 'battotai-imperial-japanese-march.mp3', Color(0xFF81D4FA)),
                    buildSoundButton('Balls', 'can-i-put-my-balls-in-your-jaws.mp3', Color(0xFFFFD54F)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 
 