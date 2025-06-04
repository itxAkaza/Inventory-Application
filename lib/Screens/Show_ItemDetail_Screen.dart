import 'package:flutter/material.dart';

import '../FireBase_Services/Inventory_Services.dart';

class ShowItemdetailScreen extends StatefulWidget {
  final String CategoryName;

  const ShowItemdetailScreen({super.key,
    required this.CategoryName

  });

  @override
  State<ShowItemdetailScreen> createState() => _ShowItemdetailScreenState();
}

class _ShowItemdetailScreenState extends State<ShowItemdetailScreen> {

  InventoryService inventoryServices=InventoryService();

  @override
  Widget build(BuildContext context) {
    return   Scaffold(

      appBar: AppBar(
        title: Text(widget.CategoryName,),
        centerTitle: true,
        backgroundColor: Color(0xffFD7B9F5),

      ),
      backgroundColor: Color(0xffF5EFFF),


      body: FutureBuilder(
          future: InventoryService().GetCategoryItems(widget.CategoryName),
          builder: (context,ItemSnapshot){
            if (ItemSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (ItemSnapshot.hasError) {
              return Center(
                child: Text('Error loading inventory: ${ItemSnapshot.error}'),
              );
            }

            if (!ItemSnapshot.hasData ||ItemSnapshot.data!.isEmpty) {
              return const Center(child: Text('Nothing in the inventory'));
            }

            return ListView.builder(
              itemCount: ItemSnapshot.data!.length,
                itemBuilder: (context,index)
                {
                  final categoryitem=ItemSnapshot.data![index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9),
                    child: Card(

                      margin: const EdgeInsets.symmetric(vertical: 8.0),

                      elevation: 2,
                      child: ListTile(
                        title: Text(
                          categoryitem['name'] ?? 'Unnamed Category',
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Quantity: ${categoryitem['quantity'] ?? 0}, unit Price: ${categoryitem['unitPrice']?.toStringAsFixed(2) ?? '0.00'}',
                          style: const TextStyle(fontSize: 14),
                        ),

                      ),
                    ),
                  );

                }
            );

          }
      ),

    );
  }
}
