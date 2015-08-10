json.array!(@links) do |link|
  json.extract! link, :url, :shortended_url
  json.url link_url(link, format: :json)
end
