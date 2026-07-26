export interface Product {

  id: string;

  sku: string;

  barcode: string | null;

  name: string;

  slug: string | null;

  description: string | null;

  is_active: boolean;

  created_at: string;

}
