import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  late VideoPlayerController videoPlayerController;
  late Future<void> initializeVideoPlayerFuture;

  @override
  void onInit() {
    super.onInit();
    videoPlayerController = VideoPlayerController.asset('video/video.mp4');
    initializeVideoPlayerFuture = videoPlayerController.initialize().then((_) {
      videoPlayerController.play();
      update();
    });
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    super.onClose();
  }
}
