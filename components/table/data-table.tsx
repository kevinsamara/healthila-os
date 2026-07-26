type Column<T extends Record<string, unknown>> = {
  key: keyof T;
  title: string;
};

type Props<T extends Record<string, unknown>> = {
  columns: readonly Column<T>[];
  rows: readonly T[];
};

export default function DataTable<
  T extends Record<string, unknown>,
>({
  columns,
  rows,
}: Props<T>) {
  return (
    <div className="overflow-hidden rounded-xl border bg-white">
      <table className="min-w-full">

        <thead className="bg-gray-50">
          <tr>
            {columns.map((column) => (
              <th
                key={String(column.key)}
                className="border-b px-5 py-3 text-left text-sm font-semibold"
              >
                {column.title}
              </th>
            ))}
          </tr>
        </thead>

        <tbody>
          {rows.map((row, index) => (
            <tr
              key={index}
              className="border-b"
            >
              {columns.map((column) => (
                <td
                  key={String(column.key)}
                  className="px-5 py-4 text-sm"
                >
                  {String(row[column.key] ?? "")}
                </td>
              ))}
            </tr>
          ))}
        </tbody>

      </table>
    </div>
  );
}
