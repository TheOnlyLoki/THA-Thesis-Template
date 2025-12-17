// Helper function to convert TOML datetime to Typst datetime
#let toml_to_datetime(toml_date) = {
  if toml_date == none {
    none
  } else {
    datetime(
      year: toml_date.year(),
      month: toml_date.month(),
      day: toml_date.day(),
    )
  }
}