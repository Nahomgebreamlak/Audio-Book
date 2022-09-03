import "package:get/get.dart";
import 'package:get_storage/get_storage.dart';

class ViewPageController extends GetxController {
  RxInt pagenumber = 0.obs;
  RxInt pagenumber2 = 0.obs;
  RxInt pagenumber3 = 0.obs;
  RxInt pagenumber4 = 0.obs;
  RxInt pagenumber5 = 0.obs;
  RxInt pagenumber6 = 0.obs;
  RxInt pagenumber7 = 0.obs;
  RxInt pagenumber8 = 0.obs;
  RxInt medemdemta = 0.obs;

  RxString audiopath = "".obs;
  RxString audioduration = "".obs;
  final box = GetStorage();

  @override
  void onInit() async {
    super.onInit();
    if (box.read('pagenumber') != null) {
      pagenumber.value = box.read('pagenumber');
    }
    if (box.read('pagenumber2') != null) {
      pagenumber2.value = box.read('pagenumber2');
    }
    if (box.read('pagenumber3') != null) {
      pagenumber2.value = box.read('pagenumber3');
    }
    if (box.read('pagenumber4') != null) {
      pagenumber2.value = box.read('pagenumber4');
    }
    if (box.read('pagenumber5') != null) {
      pagenumber2.value = box.read('pagenumber5');
    }
    if (box.read('pagenumber6') != null) {
      pagenumber2.value = box.read('pagenumber6');
    }
    if (box.read('pagenumber7') != null) {
      pagenumber2.value = box.read('pagenumber7');
    }

    if (box.read('medemdemta') != null) {
      pagenumber2.value = box.read('medemdemta');
    }
    if (box.read('musicduration') != null) {
      audioduration.value = box.read('musicduration');
    }
  }

  setPagenumber() {
    print("Page number texewia");
    if (box.read('pagenumber') != null) {
      pagenumber.value = box.read('pagenumber');
      print("page number after set page ${pagenumber.value}");
    }
  }

  setPagenumber2() {
    print("Page number texewia2");
    if (box.read('pagenumber2') != null) {
      pagenumber2.value = box.read('pagenumber2');
      print("page number after set page ${pagenumber2.value}");
    }
  }

  setPagenumber3() {
    print("Page number texewia2");
    if (box.read('pagenumber3') != null) {
      pagenumber3.value = box.read('pagenumber3');
      print("page number after set page ${pagenumber3.value}");
    }
  }

  setPagenumber4() {
    print("Page number texewia2");
    if (box.read('pagenumber4') != null) {
      pagenumber4.value = box.read('pagenumber4');
      print("page number after set page ${pagenumber4.value}");
    }
  }

  setPagenumber5() {
    print("Page number texewia2");
    if (box.read('pagenumber5') != null) {
      pagenumber5.value = box.read('pagenumber5');
      print("page number after set page ${pagenumber5.value}");
    }
  }

  setPagenumber6() {
    print("Page number texewia2");
    if (box.read('pagenumber6') != null) {
      pagenumber6.value = box.read('pagenumber6');
      print("page number after set page ${pagenumber6.value}");
    }
  }

  setPagenumber7() {
    print("Page number texewia2");
    if (box.read('pagenumber7') != null) {
      pagenumber7.value = box.read('pagenumber7');
      print("page number after set page ${pagenumber7.value}");
    }
  }

  setPagenumber8() {
    print("Page number texewia2");
    if (box.read('pagenumber8') != null) {
      pagenumber8.value = box.read('pagenumber8');
      print("page number after set page ${pagenumber8.value}");
    }
  }

  setPagenumbermedemdemta() {
    print("Page number texewia2");
    if (box.read('pagenumbermedemdemta') != null) {
      medemdemta.value = box.read('pagenumbermedemdemta');
      print("page number after set page ${pagenumber8.value}");
    }
  }

  void setaudioduration() async {
    print("duration number texewia");
    if (box.read('musicduration') != null) {
      audioduration.value = box.read('musicduration');
      print("page number after set page ${audioduration.value}");
    }
  }
}
