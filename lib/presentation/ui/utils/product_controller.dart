import 'dart:convert';

import 'package:api/data/model/product_model.dart';
import 'package:api/data/network/api_url.dart';
import 'package:http/http.dart' as http;

class ProductController {
  late List<Data> productList = [];
  Future<void> fatchProduct() async {
    final response = await http.get(Uri.parse(ApiUrl.readProduct));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      ProductModel model = ProductModel.fromJson(data);
      productList = model.data ?? [];
    }
  }

  Future<void> createProduct(String pname, String pimg, int pqty,
      int punitPrice, int ptoTalPrice) async {
    final response = await http.post(Uri.parse(ApiUrl.createProduct),
        headers: ({'Content-Type': 'application/json'}),
        body: jsonEncode({
          "ProductName": pname,
          "ProductCode": DateTime.now().millisecondsSinceEpoch,
          "Img": pimg,
          "Qty": pqty,
          "UnitPrice": punitPrice,
          "TotalPrice": ptoTalPrice
        }));

    if (response.statusCode == 200) {
      fatchProduct();
    }
  }

  Future<void> updateProduct( String id,String pname, String pimg, int pqty,
      int punitPrice, int ptoTalPrice) async {
    final response = await http.post(Uri.parse(ApiUrl.updateProduct(id)),
        headers: ({'Content-Type': 'application/json'}),
        body: jsonEncode({
          "ProductName": pname,
          "ProductCode": DateTime.now().millisecondsSinceEpoch,
          "Img": pimg,
          "Qty": pqty,
          "UnitPrice": punitPrice,
          "TotalPrice": ptoTalPrice
        }));

    if (response.statusCode == 200) {
      fatchProduct();
    }
  }




  Future<bool> deleteProduct(String id) async {
    final response = await http.get(Uri.parse(ApiUrl.deleteProduct(id)));

    if(response.statusCode==200){

      return true;

    }
    else{

      return false;
    }
  }
}
