
import 'package:get/state_manager.dart';
import 'package:instafeed/model/Empty.dart';
import 'package:instafeed/services/remote_services.dart';


class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = List<Empty>().obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var empty = await RemoteServices.fetchProducts();
      if (empty != null) {
        productList.value = empty;
      }
    } finally {
      isLoading(false);
    }
  }
}