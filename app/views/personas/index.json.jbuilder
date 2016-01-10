json.array!(@personas) do |persona|
  json.extract! persona, :id
  json.url persona_url(persona, format: :json)
end
