export default function ResourceFilters() {
  return (
    <div className="mb-5 flex flex-wrap items-center gap-3">

      <input
        placeholder="Search..."
        className="w-72 rounded-xl border px-4 py-2"
      />

      <select className="rounded-xl border px-4 py-2">
        <option>All Status</option>
      </select>

      <select className="rounded-xl border px-4 py-2">
        <option>Sort By</option>
      </select>

    </div>
  );
}
