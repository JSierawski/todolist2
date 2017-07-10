# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Profile.destroy_all
TodoList.destroy_all
TodoItem.destroy_all

counter = 0;

users = User.create! [
  { username: "Fiorina", password_digest: "HPiscool"},
  { username: "Trump", password_digest: "putin"},
  { username: "Carson", password_digest: "sleepy"},
  { username: "Clinton", password_digest: "email"}
]

todoitems = TodoItem.create! [
  { due_date: Date.today + 1.year, title: "task 1", description: "asdf", completed: false},
  { due_date: Date.today + 1.year, title: "task 2", description: "sdf", completed: false},
  { due_date: Date.today + 1.year, title: "task 3", description: "dfg", completed: false},
  { due_date: Date.today + 1.year, title: "task 4", description: "fgh", completed: true},
  { due_date: Date.today + 1.year, title: "task 5", description: "ert", completed: false},
  { due_date: Date.today + 1.year, title: "task 6", description: "cb", completed: false},
  { due_date: Date.today + 1.year, title: "task 7", description: "hgjk", completed: true},
  { due_date: Date.today + 1.year, title: "task 8", description: "kjlj", completed: true},
  { due_date: Date.today + 1.year, title: "task 9", description: "sdhi", completed: false},
  { due_date: Date.today + 1.year, title: "task 10", description: "dsfjkl", completed: false},
  { due_date: Date.today + 1.year, title: "task 11", description: "qjklf", completed: false},
  { due_date: Date.today + 1.year, title: "task 12", description: "kjbng", completed: true},
  { due_date: Date.today + 1.year, title: "task 13", description: "wweee", completed: false},
  { due_date: Date.today + 1.year, title: "task 14", description: "iohjdf", completed: false},
  { due_date: Date.today + 1.year, title: "task 15", description: "vnadj", completed: true},
  { due_date: Date.today + 1.year, title: "task 16", description: "who", completed: false},
  { due_date: Date.today + 1.year, title: "task 17", description: "nbajnb", completed: false},
  { due_date: Date.today + 1.year, title: "task 18", description: "qijg", completed: false},
  { due_date: Date.today + 1.year, title: "task 19", description: "ptiry", completed: false},
  { due_date: Date.today + 1.year, title: "task 20", description: "qweui", completed: false}
]

todolists = TodoList.create! [
  { list_name: "Carlys List", list_due_date: Date.today + 1.year, user_id: users[0].id},
  { list_name: "Donalds List", list_due_date: Date.today + 1.year, user_id: users[1].id},
  { list_name: "Bens List", list_due_date: Date.today + 1.year, user_id: users[2].id},
  { list_name: "Hillarys List", list_due_date: Date.today + 1.year, user_id: users[3].id}
]

users.each {|user|
  case user.username
  when 'Fiorina'
    Profile.create(gender: "female", birth_year: 1954, first_name: "Carly", last_name: "Fiorina", user_id: users[0].id)
  when 'Trump'
    Profile.create(gender: "male", birth_year: 1946, first_name: "Donald", last_name: "Trump", user_id: users[1].id)
  when 'Carson'
    Profile.create(gender: "male", birth_year: 1951, first_name: "Ben", last_name: "Carson", user_id: users[2].id)
  when 'Clinton'
    Profile.create(gender: "female", birth_year: 1947, first_name: "Hillary", last_name: "Clinton", user_id: users[3].id)
  end
}

todolists.each_with_index {|list, index|
  5.times do
    todoitems[counter].update(todo_list_id: todolists[index].id)
    counter += 1
  end
}
