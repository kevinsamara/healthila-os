import Breadcrumb from "@/components/common/breadcrumb";
import SectionCard from "@/components/common/section-card";
import ResourceHeader from "@/components/resource/resource-header";
import ResourceFilters from "@/components/resource/resource-filters";
import EmptyState from "@/components/common/empty-state";

export default function SuppliersPage() {
  return (
    <>
      <Breadcrumb items={["Suppliers"]} />

      <ResourceHeader
        title="Suppliers"
        description="Manage all suppliers"
        addLabel="Suppliers"
      />

      <ResourceFilters />

      <SectionCard title="Suppliers List">
        <EmptyState
          title="No Suppliers Found"
          description="Create your first Suppliers."
        />
      </SectionCard>
    </>
  );
}
