import { z } from "zod";

export const productSchema = z.object({
  category_id: z.string().uuid().nullable().optional(),
  brand_id: z.string().uuid().nullable().optional(),

  sku: z.string().min(1, "SKU is required"),

  barcode: z.string().optional(),

  name: z.string().min(2, "Product name is required"),

  slug: z.string().optional(),

  description: z.string().optional(),

  base_unit_id: z.string().uuid().nullable().optional(),

  is_active: z.boolean().default(true),
});

export type ProductInput = z.input<typeof productSchema>;
export type Product = z.output<typeof productSchema>;
