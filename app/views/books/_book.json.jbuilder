json.extract! book, :id, :title, :author, :pages, :status, :user, :created_at, :updated_at
json.url book_url(book, format: :json)
