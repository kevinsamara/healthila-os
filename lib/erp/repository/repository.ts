import { createClient } from "@/lib/supabase/server";
import type { Database } from "@/lib/supabase/database.types";

type PublicTables = Database["public"]["Tables"];

export class Repository<
  TTable extends keyof PublicTables,
> {
  constructor(
    private readonly table: TTable,
  ) {}

  async all() {
    const supabase = await createClient();

    const { data, error } = await supabase
      .from(this.table)
      .select("*");

    if (error) throw error;

    return data as PublicTables[TTable]["Row"][];
  }

  async insert(
    payload: PublicTables[TTable]["Insert"],
  ) {
    const supabase = await createClient();

    const { data, error } = await supabase
      .from(this.table)
      .insert(payload)
      .select()
      .single();

    if (error) throw error;

    return data as PublicTables[TTable]["Row"];
  }
}
