"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";

import {
  LayoutDashboard,
  Package,
  Boxes,
  ShoppingCart,
  Factory,
  Users,
  Wallet,
  Settings,
} from "lucide-react";

import { cn } from "@/lib/utils";

const menus = [
  {
    title: "General",
    items: [
      {
        name: "Dashboard",
        href: "/dashboard",
        icon: LayoutDashboard,
      },
    ],
  },
  {
    title: "Operations",
    items: [
      {
        name: "Products",
        href: "/products",
        icon: Package,
      },
      {
        name: "Inventory",
        href: "/inventory",
        icon: Boxes,
      },
      {
        name: "Purchasing",
        href: "/purchasing",
        icon: ShoppingCart,
      },
      {
        name: "Production",
        href: "/production",
        icon: Factory,
      },
    ],
  },
  {
    title: "Business",
    items: [
      {
        name: "Customers",
        href: "/customers",
        icon: Users,
      },
      {
        name: "Finance",
        href: "/finance",
        icon: Wallet,
      },
    ],
  },
  {
    title: "System",
    items: [
      {
        name: "Settings",
        href: "/settings",
        icon: Settings,
      },
    ],
  },
];

export default function Sidebar() {
  const pathname = usePathname();

  return (
    <aside className="flex w-72 flex-col border-r bg-white">

      <div className="border-b p-6">

        <h1 className="text-2xl font-bold">
          🥭 Healthila OS
        </h1>

        <p className="mt-1 text-sm text-gray-500">
          ERP Platform
        </p>

      </div>

      <div className="flex-1 overflow-y-auto p-4">

        {menus.map((group) => (

          <div key={group.title} className="mb-8">

            <p className="mb-3 px-3 text-xs font-semibold uppercase tracking-wider text-gray-400">
              {group.title}
            </p>

            <div className="space-y-1">

              {group.items.map((item) => {

                const Icon = item.icon;

                const active =
                  pathname === item.href;

                return (

                  <Link
                    key={item.href}
                    href={item.href}
                    className={cn(
                      "flex items-center rounded-xl px-3 py-3 text-sm transition",
                      active
                        ? "bg-green-600 text-white"
                        : "hover:bg-gray-100"
                    )}
                  >
                    <Icon
                      className="mr-3"
                      size={18}
                    />

                    {item.name}

                  </Link>

                );
              })}
            </div>
          </div>

        ))}

      </div>

    </aside>
  );
}
