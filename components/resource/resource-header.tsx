import PrimaryButton from "@/components/common/primary-button";

type Props = {
  title: string;
  description?: string;
  addLabel?: string;
};

export default function ResourceHeader({
  title,
  description,
  addLabel = "Add New",
}: Props) {
  return (
    <div className="mb-6 flex items-center justify-between">

      <div>

        <h1 className="text-3xl font-bold">
          {title}
        </h1>

        {description && (
          <p className="mt-2 text-gray-500">
            {description}
          </p>
        )}

      </div>

      <PrimaryButton>
        + {addLabel}
      </PrimaryButton>

    </div>
  );
}
