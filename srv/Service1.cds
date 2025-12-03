using my.procurement as db from '../db/schema';

service ProcurementService {

  entity Suppliers as projection on db.Suppliers;

  entity PurchaseOrders as projection on db.PurchaseOrders;
  entity PurchaseOrderItems as projection on db.PurchaseOrderItems;

  entity PurchaseInvoices as projection on db.PurchaseInvoices;
  entity PurchaseInvoiceItems as projection on db.PurchaseInvoiceItems;

}
