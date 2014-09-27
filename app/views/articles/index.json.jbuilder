json.array!(@articles) do |article|
  json.extract! article, :id, :title, :summary, :body, :published_at
  json.url article_url(article, format: :json)
end
