import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class InventoryService {


  final FirRef = FirebaseFirestore.instance;

  String? get userId {
    print("Current User ID: ${FirebaseAuth.instance.currentUser?.uid}");
    return FirebaseAuth.instance.currentUser?.uid;
  }

  String? get useremail {
    print("Current User email: ${FirebaseAuth.instance.currentUser?.email}");
    return FirebaseAuth.instance.currentUser?.email;
  }



  Future<String> Username()async
  {
    DocumentSnapshot DocSnapshot=await FirRef.collection("User").doc(userId.toString()).get();
    return DocSnapshot["username"] as String;

  }




  // Add or Update Items in Firebase
  Future<void> ADDorUpdateInventory(String Category, String itemName, int quantity, double unitPrice) async {
    String uid = userId.toString();
    DocumentReference categoryDoc = FirRef.collection("inventoryitems").doc(uid).collection("Items").doc(Category);
    CollectionReference inventoryref = categoryDoc.collection("items");

    // Ensure the category document exists with a field (e.g., name)
    await categoryDoc.set({"name": Category}, SetOptions(merge: true));

    QuerySnapshot existingItems = await inventoryref.where('name', isEqualTo: itemName).get();

    if (existingItems.docs.isNotEmpty) {
      // Item exists, update its quantity and price
      DocumentReference itemDoc = existingItems.docs.first.reference;
      int existingQuantity = existingItems.docs.first['quantity'];
      double existingPrice = existingItems.docs.first['unitPrice'];

      await itemDoc.update({
        'quantity': existingQuantity + quantity,
        if (existingPrice != unitPrice) 'unitPrice': unitPrice, // Update price only if changed
      });
    } else {
      // Item does not exist, create a new one
      await inventoryref.add({
        'name': itemName,
        'quantity': quantity,
        'unitPrice': unitPrice,
      });
    }
  }

  // Show data in the main screen
  Stream<List<Map<String, dynamic>>> categoryStream() {
    String? uid = userId;
    if (uid == null) {
      print("No user ID found");
      return Stream.value([]);
    }

    print("Fetching data for user: $uid");

    // Get reference to the "Items" collection
    final itemsRef = FirRef.collection("inventoryitems").doc(uid).collection("Items");

    return itemsRef.snapshots().asyncMap((snapshot) async {
      print("Raw snapshot docs: ${snapshot.docs.map((doc) => doc.id).toList()}");

      List<Map<String, dynamic>> categories = [];

      for (var doc in snapshot.docs) {
        print("Processing category: ${doc.id}");

        // Get all items in this category's "items" subcollection
        final itemsSnapshot = await doc.reference.collection("items").get();

        print("Found ${itemsSnapshot.docs.length} items in category ${doc.id}");

        // Calculate totals
        int totalItems = 0;
        double totalPrice = 0.0;

        for (var itemDoc in itemsSnapshot.docs) {
          Map<String, dynamic> data = itemDoc.data();
          int quantity = (data['quantity'] ?? 0) as int;
          double price = (data['unitPrice'] ?? 0.0) as double;

          totalItems += quantity;
          totalPrice += quantity * price;

          print("Item: ${data['name']}, Quantity: $quantity, Price: $price");
        }

        categories.add({
          "name": doc.id,
          "totalItems": totalItems,
          "totalPrice": totalPrice,
        });
      }

      print("Returning categories: $categories");
      return categories;
    });
  }

  //Show detail of items

  Future<List<Map<String,dynamic>>> GetCategoryItems(String CategoryName)async
  {
    String uid= userId.toString();
    CollectionReference colectionref = FirRef.collection("inventoryitems").doc(uid).collection("Items").doc(CategoryName).collection("items");
     QuerySnapshot itemquerysnapshot=await colectionref.get();

     List<Map<String,dynamic>> itemsdeatil=itemquerysnapshot.docs.map((doc){
       var data=doc.data() as  Map<String,dynamic>;
       return data;

     }).toList();

     return itemsdeatil;


  }










}

