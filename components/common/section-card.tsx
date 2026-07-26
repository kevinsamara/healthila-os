type Props = {
  title: string
  children: React.ReactNode
}

export default function SectionCard({
  title,
  children,
}: Props) {
  return (
    <section className="rounded-xl border bg-white shadow-sm">

      <div className="border-b px-6 py-4">
        <h2 className="font-semibold">
          {title}
        </h2>
      </div>

      <div className="p-6">
        {children}
      </div>

    </section>
  )
}
