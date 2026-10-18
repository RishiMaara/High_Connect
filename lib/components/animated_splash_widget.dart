import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:video_player/video_player.dart';

// Global controller to persist across runApp calls
VideoPlayerController? globalSplashVideoController;

class AnimatedSplashWidget extends StatefulWidget {
  final VoidCallback? onFinished;

  const AnimatedSplashWidget({Key? key, this.onFinished}) : super(key: key);

  @override
  State<AnimatedSplashWidget> createState() => _AnimatedSplashWidgetState();
}

class _AnimatedSplashWidgetState extends State<AnimatedSplashWidget> {
  bool _isVideoInitialized = false;

  @override
  void initState() {
    super.initState();

    if (globalSplashVideoController == null) {
      globalSplashVideoController = VideoPlayerController.asset('assets/videos/splash_video.mp4')
        ..initialize().then((_) {
          globalSplashVideoController!.setVolume(0.0); // Mute for web autoplay
          globalSplashVideoController!.setLooping(false);
          globalSplashVideoController!.play();
          if (mounted) {
            setState(() {
              _isVideoInitialized = true;
            });
          }
        }).catchError((_) {
          // Fallback if video fails to load
          widget.onFinished?.call();
        });
    } else {
      _isVideoInitialized = globalSplashVideoController!.value.isInitialized;
      if (!globalSplashVideoController!.value.isPlaying &&
          globalSplashVideoController!.value.position < globalSplashVideoController!.value.duration) {
        globalSplashVideoController!.play();
      }
    }

    globalSplashVideoController!.addListener(_videoListener);

    // Fallback timeout: If the video takes more than 6 seconds, just finish.
    Future.delayed(const Duration(seconds: 6), () {
      if (mounted) {
        widget.onFinished?.call();
      }
    });
  }

  void _videoListener() {
    if (globalSplashVideoController!.value.isInitialized) {
      if (!mounted) return;
      if (!_isVideoInitialized) {
        setState(() {
          _isVideoInitialized = true;
        });
      }

      if (!globalSplashVideoController!.value.isPlaying &&
          globalSplashVideoController!.value.position >= globalSplashVideoController!.value.duration &&
          globalSplashVideoController!.value.duration > Duration.zero) {
        widget.onFinished?.call();
      }
    }
  }

  @override
  void dispose() {
    globalSplashVideoController?.removeListener(_videoListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3A3A3A),
      body: Stack(
        children: [
          // Background Video covering full screen (shown once ready)
          if (_isVideoInitialized)
            Positioned.fill(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: globalSplashVideoController!.value.size.width,
                  height: globalSplashVideoController!.value.size.height,
                  child: VideoPlayer(globalSplashVideoController!),
                ),
              ),
            ),

          // Branded loading screen — shown until video is ready
          if (!_isVideoInitialized)
            Positioned.fill(
              child: Container(
                color: const Color(0xFF3A3A3A),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // App logo — pulsing gently while loading
                    Image.asset(
                      'assets/images/high_connect_logo.png',
                      width: 160,
                      height: 160,
                      fit: BoxFit.contain,
                    )
                        .animate(onPlay: (c) => c.repeat(reverse: true))
                        .scaleXY(
                          begin: 1.0,
                          end: 1.06,
                          duration: 900.ms,
                          curve: Curves.easeInOut,
                        )
                        .fadeIn(duration: 400.ms),

                    const SizedBox(height: 48),

                    // Slim loading bar at bottom
                    SizedBox(
                      width: 120,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.white24,
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                        minHeight: 2,
                      ),
                    ).animate().fadeIn(delay: 300.ms, duration: 500.ms),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
