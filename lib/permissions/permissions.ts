export const PERMISSIONS = {
  PRODUCTS_VIEW: "products.view",
  PRODUCTS_CREATE: "products.create",
  PRODUCTS_UPDATE: "products.update",
  PRODUCTS_DELETE: "products.delete",

  INVENTORY_VIEW: "inventory.view",

  CUSTOMERS_VIEW: "customers.view",

  PURCHASING_VIEW: "purchasing.view",

  FINANCE_VIEW: "finance.view",
} as const;

export type Permission =
  (typeof PERMISSIONS)[keyof typeof PERMISSIONS];
