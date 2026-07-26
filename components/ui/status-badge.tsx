type Props = {
  status: string
}

export default function StatusBadge({ status }: Props) {
  const color =
    status === "Paid"
      ? "bg-green-100 text-green-700"
      : status === "Pending"
      ? "bg-yellow-100 text-yellow-700"
      : "bg-gray-100 text-gray-700"

  return (
    <span
      className={`inline-flex rounded-full px-3 py-1 text-xs font-medium ${color}`}
    >
      {status}
    </span>
  )
}
