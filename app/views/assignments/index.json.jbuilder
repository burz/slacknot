json.array!(@assignments) do |assignment|
  json.extract! assignment, :name, :assigned_on, :due_on, :percent_completed
  json.url assignment_url(assignment, format: :json)
end
