json.array!(@projects) do |project|
  json.extract! project, :id, :title, :description, :github_url, :direct_url, :date
  json.url project_url(project, format: :json)
end
