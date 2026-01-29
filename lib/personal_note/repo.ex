defmodule PersonalNote.Repo do
  use Ecto.Repo,
    otp_app: :personal_note,
    adapter: Ecto.Adapters.Postgres
end
