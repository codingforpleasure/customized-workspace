<!--ts-->
   * [Mongo](#mongo)
      * [Insert fields into a collection](#insert-fields-into-a-collection)
      * [Select all documents in a collection](#select-all-documents-in-a-collection)

<!-- Added by: gil_diy, at: Thu 28 Apr 2022 17:33:44 IDT -->

<!--te-->

# Mongo


## Insert fields into a collection

```mongo
db.inventory.insertMany([
   { item: "journal", qty: 25, size: { h: 14, w: 21, uom: "cm" }, status: "A" },
   { item: "notebook", qty: 50, size: { h: 8.5, w: 11, uom: "in" }, status: "A" },
   { item: "paper", qty: 100, size: { h: 8.5, w: 11, uom: "in" }, status: "D" },
   { item: "planner", qty: 75, size: { h: 22.85, w: 30, uom: "cm" }, status: "D" },
   { item: "postcard", qty: 45, size: { h: 10, w: 15.25, uom: "cm" }, status: "A" }
]);
```

## Select all documents in a collection

```mongo
db.<collection name>.find({})
```
## 

```mongo
db.<collection name>.find( { status: "D" } )
```