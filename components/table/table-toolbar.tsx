import PrimaryButton from "@/components/common/primary-button"

export default function TableToolbar() {
  return (
    <div className="mb-4 flex items-center justify-between">

      <input
        placeholder="Search..."
        className="w-72 rounded-lg border px-4 py-2"
      />

      <div className="flex gap-2">

        <button className="rounded-lg border px-4 py-2">
          Refresh
        </button>

        <PrimaryButton>
          + Add
        </PrimaryButton>

      </div>

    </div>
  )
}
