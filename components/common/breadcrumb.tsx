type Props = {
  items: string[]
}

export default function Breadcrumb({ items }: Props) {
  return (
    <div className="mb-4 flex items-center gap-2 text-sm text-gray-500">
      {items.map((item, index) => (
        <div key={item} className="flex items-center gap-2">
          {index !== 0 && <span>/</span>}
          <span>{item}</span>
        </div>
      ))}
    </div>
  )
}
