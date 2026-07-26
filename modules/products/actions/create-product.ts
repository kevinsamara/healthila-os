"use server";

import { revalidatePath } from "next/cache";

import {
  productSchema,
  type ProductInput,
} from "../schemas/product.schema";

import {
  createProductService,
} from "../services/products.service";

export async function createProduct(
  input: ProductInput,
) {
  const payload =
    productSchema.parse(input);

  await createProductService(payload);

  revalidatePath("/products");
}
