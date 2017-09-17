User.destroy_all
Task.destroy_all

User.create(first_name: 'test', last_name: 'test', email: 'taskki@taskki.com', password: '123456', password_confirmation: '123456')

10.times do
  t = Task.new(title: Faker::Hipster.sentence, due: Faker::Date.forward(8))
  t.user = User.last
  t.save
end