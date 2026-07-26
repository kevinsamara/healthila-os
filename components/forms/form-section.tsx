import { ReactNode } from "react";

type Props = {
  title: string;
  children: ReactNode;
};

export default function FormSection({
  title,
  children,
}: Props) {
  return (
    <section className="space-y-4">
      <h3 className="text-lg font-medium">
        {title}
      </h3>

      {children}
    </section>
  );
}
