import { Bell, Search } from "lucide-react";

export default function Topbar() {
  return (
    <header className="flex h-16 items-center justify-between border-b bg-white px-8">

      <div className="relative w-[420px]">

        <Search
          size={18}
          className="absolute left-3 top-3 text-gray-400"
        />

        <input
          placeholder="Search products, orders..."
          className="w-full rounded-xl border py-2 pl-10 pr-4"
        />

      </div>

      <div className="flex items-center gap-5">

        <Bell size={20} />

        <div className="text-right">

          <p className="text-sm font-semibold">
            Kevin Samara
          </p>

          <p className="text-xs text-gray-500">
            Administrator
          </p>

        </div>

        <div className="flex h-10 w-10 items-center justify-center rounded-full bg-green-600 font-bold text-white">
          K
        </div>

      </div>

    </header>
  );
}
