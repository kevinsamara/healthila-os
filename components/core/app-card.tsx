import { ReactNode } from "react";

type Props = {
  title: string;
  children: ReactNode;
};

export default function AppCard({
  title,
  children,
}: Props) {
  return (
    <div className="rounded-xl border bg-white p-6 shadow-sm">
      <h2 className="mb-4 text-lg font-semibold">
        {title}
      </h2>

      {children}
    </div>
  );
}
