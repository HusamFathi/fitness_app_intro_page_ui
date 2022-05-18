import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness Signing UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(
        title: 'Fitness Signing UI',
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/videos/intro.mp4")
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.play();
          _controller.setLooping(true);
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              height: _controller.value.size.height,
              width: _controller.value.size.width,
              child: VideoPlayer(_controller),
            ),
          ),
        ),
        const Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.fromLTRB(12.0, 40, 0, 0),
            child: Text(
              'My\nFitness\nTracker',
              style: TextStyle(
                fontSize: 65,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
