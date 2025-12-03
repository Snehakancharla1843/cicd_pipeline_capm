using { cuid, managed } from '@sap/cds/common';

namespace my.procurement;

entity Suppliers : cuid, managed {
  name        : String(100);
  email       : String(100);
  phone       : String(20);
  address     : String(255);
}

entity PurchaseOrders : cuid, managed {
  poNumber       : String(20);
  supplier       : Association to Suppliers;
  orderDate      : Date;
  deliveryDate   : Date;
  status         : String(20);
  totalAmount    : Decimal(15,2);
  currency       : String(5);

  items          : Composition of many PurchaseOrderItems
                     on items.parent = $self;
}

entity PurchaseOrderItems : cuid {
  parent         : Association to PurchaseOrders;
  material       : String(40);
  description    : String(255);
  quantity       : Decimal(13,3);
  uom            : String(10);
  price          : Decimal(15,2);
  lineAmount     : Decimal(15,2);
}

entity PurchaseInvoices : cuid, managed {
  piNumber       : String(20);
  po             : Association to PurchaseOrders;
  invoiceDate    : Date;
  postingDate    : Date;
  status         : String(20);
  totalAmount    : Decimal(15,2);
  currency       : String(5);

  items          : Composition of many PurchaseInvoiceItems
                     on items.parent = $self;
}

entity PurchaseInvoiceItems : cuid {
  parent         : Association to PurchaseInvoices;
  poItem         : Association to PurchaseOrderItems;
  material       : String(40);
  description    : String(255);
  quantity       : Decimal(13,3);
  price          : Decimal(15,2);
  lineAmount     : Decimal(15,2);
}
