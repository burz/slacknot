json.array!(@problems) do |problem|
  json.extract! problem, :prompt, :text, :latex, :notes, :completed
  json.url problem_url(problem, format: :json)
end
