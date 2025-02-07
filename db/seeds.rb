# らんてくん用のデータ作成
runt = User.create!(name: 'らんてくん',
              email: 'test@example.com',
              password: 'password',
              password_confirmation: 'password')
runt_id = runt.id

## Bookデータ作成
runt_book_number = 20
runt_book_number.times do |index|
  rand_pages = rand(100..999)
  rand_status = rand(0..3)
  runt.books.create!(title: Faker::Book.title,
                      author: Faker::Book.author,
                      pages: rand_pages,
                      status: rand_status)
end
## Goalデータ作成
10.times do |index|
  book = Book.find(rand(1..runt_book_number))
  temp_start_date = Date.today + rand(0..10)
  temp_target_date = temp_start_date + rand(1..31)
  diff_days = (temp_target_date - temp_start_date).to_i
  temp_pages_per_day = (book.pages.to_f / diff_days).ceil
  runt.goals.create!(book_id: book.id,
                      start_date: temp_start_date,
                      target_date: temp_target_date,
                      pages_per_day: temp_pages_per_day,
                      reading_pages: rand(0...book.pages),
                      status: 0)
end



# ロボらんてくん用のデータ作成
robo_runt = User.create!(name: 'ロボらんてくん',
              email: 'sample@example.com',
              password: 'password',
              password_confirmation: 'password')
robo_runt_id = robo_runt.id

## Bookデータ作成
robo_runt_book_number = 10
robo_runt_book_number.times do |index|
  rand_pages = rand(100..999)
  rand_status = rand(0..3)
  robo_runt.books.create!(title: Faker::Book.title,
                      author: Faker::Book.author,
                      pages: rand_pages,
                      status: rand_status)
end
## Goalデータ作成
5.times do |index|
  book = Book.find(rand(1..robo_runt_book_number))
  temp_start_date = Date.today + rand(0..10)
  temp_target_date = temp_start_date + rand(1..31)
  diff_days = (temp_target_date - temp_start_date).to_i
  temp_pages_per_day = (book.pages.to_f / diff_days).ceil
  robo_runt.goals.create!(book_id: book.id,
                      start_date: temp_start_date,
                      target_date: temp_target_date,
                      pages_per_day: temp_pages_per_day,
                      reading_pages: rand(0...book.pages),
                      status: 0)
end
