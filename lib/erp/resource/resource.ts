import type { ColumnDef } from "@tanstack/react-table";

export interface ResourceDefinition<T> {
  title: string;

  columns: ColumnDef<T>[];

  searchable?: string[];

  defaultSort?: string;

  canCreate?: boolean;

  canEdit?: boolean;

  canDelete?: boolean;
}
