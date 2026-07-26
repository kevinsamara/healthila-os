"use client";

import { ColumnDef } from "@tanstack/react-table";

import { Badge } from "@/components/ui/badge";

import type { Product } from "../types/product";

export const columns: ColumnDef<Product>[] = [

  {
    accessorKey: "sku",
    header: "SKU",
  },

  {
    accessorKey: "name",
    header: "Product",
  },

  {
    accessorKey: "barcode",
    header: "Barcode",
  },

  {
    accessorKey: "is_active",

    header: "Status",

    cell: ({ row }) =>

      row.original.is_active ? (

        <Badge>

          Active

        </Badge>

      ) : (

        <Badge variant="secondary">

          Inactive

        </Badge>

      ),
  },

];
