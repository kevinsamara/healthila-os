"use client";

import {
  Control,
  FieldValues,
  Path,
} from "react-hook-form";

import {
  FormControl,
  FormField,
  FormItem,
  FormLabel,
  FormMessage,
} from "@/components/ui/form";

import { Textarea } from "@/components/ui/textarea";

type Props<T extends FieldValues> = {
  control: Control<T>;
  name: Path<T>;
  label: string;
};

export default function TextareaField<T extends FieldValues>({
  control,
  name,
  label,
}: Props<T>) {
  return (
    <FormField
      control={control}
      name={name}
      render={({ field }) => (
        <FormItem>
          <FormLabel>{label}</FormLabel>

          <FormControl>
            <Textarea {...field} />
          </FormControl>

          <FormMessage />
        </FormItem>
      )}
    />
  );
}
