type Props = {
  title: string
  description: string
}

export default function EmptyState({
  title,
  description,
}: Props) {
  return (
    <div className="flex flex-col items-center justify-center py-20 text-center">

      <div className="text-5xl">
        📭
      </div>

      <h2 className="mt-6 text-xl font-semibold">
        {title}
      </h2>

      <p className="mt-2 max-w-md text-gray-500">
        {description}
      </p>

    </div>
  )
}
