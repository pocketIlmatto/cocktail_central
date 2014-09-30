json.array!(@surveys) do |survey|
  json.extract! survey, :name
  json.url survey_url(survey, format: :json)
end