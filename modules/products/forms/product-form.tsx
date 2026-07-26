"use client";

import { zodResolver } from "@hookform/resolvers/zod";

import { useForm } from "react-hook-form";

import {
  Form,
} from "@/components/ui/form";

import { Button } from "@/components/ui/button";

import TextField
from "@/components/erp/form/text-field";

import TextareaField
from "@/components/erp/form/textarea-field";

import {
  productSchema,
  type ProductInput,
} from "../schemas/product.schema";

import {
  createProduct,
} from "../actions/create-product";

export default function ProductForm() {

  const form =
    useForm<ProductInput>({

      resolver:
        zodResolver(productSchema),

      defaultValues: {

        sku: "",

        barcode: "",

        name: "",

        slug: "",

        description: "",

        is_active: true,

      },

    });

  async function onSubmit(
    values: ProductInput,
  ) {

    await createProduct(values);

    form.reset();

  }

  return (

    <Form {...form}>

      <form
        onSubmit={form.handleSubmit(onSubmit)}
        className="space-y-5"
      >

        <TextField
          control={form.control}
          name="sku"
          label="SKU"
        />

        <TextField
          control={form.control}
          name="name"
          label="Product Name"
        />

        <TextField
          control={form.control}
          name="barcode"
          label="Barcode"
        />

        <TextField
          control={form.control}
          name="slug"
          label="Slug"
        />

        <TextareaField
          control={form.control}
          name="description"
          label="Description"
        />

        <Button type="submit">

          Save Product

        </Button>

      </form>

    </Form>

  );

}
