import 'package:api/presentation/ui/utils/product_controller.dart';
import 'package:api/presentation/ui/widget/grid_product.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductController productController = ProductController();
  TextEditingController _pNamecontroller = TextEditingController();
  TextEditingController _pImagecontroller = TextEditingController();
  TextEditingController _pQtycontroller = TextEditingController();
  TextEditingController _pUnitPricecontroller = TextEditingController();
  TextEditingController _pTotalPricecontroller = TextEditingController();

  Future<void> fatchData() async {
    await productController.fatchProduct();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fatchData();
  }

  void _showSheet(
      {String? id,
      String? name,
      String? img,
      int? qty,
      int? unitPrice,
      int? totalPrice}) {
    _pNamecontroller.text = name ?? '';
    _pImagecontroller.text = img ?? '';
    _pQtycontroller.text = qty != null ? qty.toString() : '';
    _pUnitPricecontroller.text = unitPrice != null ? unitPrice.toString() : '';
    _pTotalPricecontroller.text =
        totalPrice != null ? totalPrice.toString() : '';

    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5 +
                  MediaQuery.of(context).viewInsets.bottom,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _pNamecontroller,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        labelText: 'Product Name',
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: _pImagecontroller,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: 'Product Image',
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: _pQtycontroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Product Qty', border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: _pUnitPricecontroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Product Unit Price',
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: _pTotalPricecontroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Product Total Price',
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          'Cancel',
                          style: TextStyle(fontSize: 18),
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            backgroundColor: Colors.deepPurple,
                            foregroundColor: Colors.white),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (id == null) {
                              productController.createProduct(
                                  _pNamecontroller.text,
                                  _pImagecontroller.text,
                                  int.parse(_pQtycontroller.text),
                                  int.parse(_pUnitPricecontroller.text),
                                  int.parse(_pTotalPricecontroller.text));
                            } else {
                              productController.updateProduct(
                                  id,
                                  _pNamecontroller.text,
                                  _pImagecontroller.text,
                                  int.parse(_pQtycontroller.text),
                                  int.parse(_pUnitPricecontroller.text),
                                  int.parse(_pTotalPricecontroller.text));
                            }
                            fatchData();

                            Navigator.pop(context);
                            setState(() {});
                          },
                          child: Text(
                              id == null ? 'Add Product' : 'Update Product',
                              style: TextStyle(fontSize: 18)),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              backgroundColor: Colors.deepPurple,
                              foregroundColor: Colors.white)),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product List',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.grey.shade300,
        centerTitle: true,
      ),
      body: GridView.builder(
          itemCount: productController.productList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.8),
          itemBuilder: (context, index) {
            final product = productController.productList[index];
            return GridProduct(
                product: product,
                onEdit: () {
                  _showSheet(
                      id: product.sId,
                      img: product.img,
                      name: product.productName,
                      qty: product.qty,
                      unitPrice: product.unitPrice,
                      totalPrice: product.totalPrice
                  );
                },
                onDelete: () {
                  productController
                      .deleteProduct(product.sId.toString())
                      .then((value) {
                    if (value) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Delete Success'),
                        duration: Duration(seconds: 2),
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('You are fail try again!'),
                        duration: Duration(seconds: 2),
                      ));
                    }
                  });
                  fatchData();
                  setState(() {});
                });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showSheet(),
        child: Icon(Icons.add),
        backgroundColor: Colors.grey.shade300,
      ),
    );
  }
}
