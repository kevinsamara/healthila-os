type Props = React.ButtonHTMLAttributes<HTMLButtonElement>

export default function PrimaryButton({
  children,
  className = "",
  ...props
}: Props) {
  return (
    <button
      className={
        "rounded-xl bg-green-600 px-4 py-2 font-medium text-white transition hover:bg-green-700 " +
        className
      }
      {...props}
    >
      {children}
    </button>
  )
}
