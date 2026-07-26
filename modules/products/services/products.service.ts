import { productsRepository } from "../repository/products.repository";
import type { ProductInput } from "../schemas/product.schema";

export async function createProductService(
  input: ProductInput,
) {
  return productsRepository.insert({
    ...input,

    slug:
      input.slug?.trim() ||
      input.name
        .toLowerCase()
        .replace(/\s+/g, "-"),
  });
}

export async function getProductsService() {
  return productsRepository.all();
}
