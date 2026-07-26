import PageHeader from "@/components/common/page-header";
import EmptyState from "@/components/common/empty-state";

import { getProductsService } from "@/modules/products/services/products.service";

export default async function ProductsPage() {
  const products = await getProductsService();

  return (
    <>
      <PageHeader
        title="Products"
        description="Manage your products"
      />

      {products.length === 0 ? (
        <EmptyState
          title="No products"
          description="Create your first product."
        />
      ) : (
        <pre className="rounded-lg border p-4 overflow-auto text-xs">
          {JSON.stringify(products, null, 2)}
        </pre>
      )}
    </>
  );
}
