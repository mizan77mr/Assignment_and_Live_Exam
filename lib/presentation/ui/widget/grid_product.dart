import 'package:api/data/model/product_model.dart';
import 'package:flutter/material.dart';

class GridProduct extends StatelessWidget {
  Data product;
  VoidCallback onEdit;
  VoidCallback onDelete;

  GridProduct(
      {super.key,
      required this.product,
      required this.onEdit,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 140,
              child: Image.network(
                product.img.toString(),
                fit: BoxFit.cover,
              )),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                product.productName.toString(),
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                'Unit Price: ${product.unitPrice} | Qty: ${product.qty}',
                style: TextStyle(fontSize: 16, color: Colors.black54),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: onEdit, icon: Icon(Icons.edit)),
                  IconButton(
                      onPressed: onDelete,
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ))
                ],
              )
            ]),
          )
        ],
      ),
    );
    ;
  }
}
