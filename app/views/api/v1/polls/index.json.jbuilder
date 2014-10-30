json.array!(@polls) do |poll|
  json.extract! poll, :id, :question, :organization_id, :created_at, :updated_at, :answers
end
