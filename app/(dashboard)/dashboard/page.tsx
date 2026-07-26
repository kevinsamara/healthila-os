import Breadcrumb from "@/components/common/breadcrumb";
import PageHeader from "@/components/common/page-header";
import StatCard from "@/components/common/stat-card";
import SectionCard from "@/components/common/section-card";
import DataTable from "@/components/table/data-table";

const rows = [
  {
    order: "#1001",
    customer: "Kevin",
    total: "Rp 250.000",
    status: "Paid",
  },
  {
    order: "#1002",
    customer: "Vania",
    total: "Rp 180.000",
    status: "Pending",
  },
] as const;

const columns = [
  { key: "order", title: "Order" },
  { key: "customer", title: "Customer" },
  { key: "total", title: "Total" },
  { key: "status", title: "Status" },
] satisfies {
  key: keyof (typeof rows)[number];
  title: string;
}[];

export default function DashboardPage() {
  return (
    <>
      <Breadcrumb items={["Dashboard"]} />

      <PageHeader
        title="Dashboard"
        description="Welcome to Healthila OS"
      />

      <div className="mb-8 grid gap-6 md:grid-cols-2 xl:grid-cols-4">
        <StatCard
          title="Today's Sales"
          value="Rp 12.400.000"
          subtitle="+8.2%"
        />

        <StatCard
          title="Orders"
          value="42"
          subtitle="Today"
        />

        <StatCard
          title="Customers"
          value="1,284"
        />

        <StatCard
          title="Low Stock"
          value="6"
        />
      </div>

      <SectionCard title="Recent Orders">
        <DataTable
          columns={columns}
          rows={rows}
        />
      </SectionCard>
    </>
  );
}
