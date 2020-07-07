User.destroy_all

@due_date = Date.today + 1.year

list = [
  { first_name: "Carly",   last_name: "Fiorina", birth_year: 1954, gender: "female" },
  { first_name: "Donald",  last_name: "Trump",   birth_year: 1946, gender: "male" },
  { first_name: "Ben",     last_name: "Carson",  birth_year: 1951, gender: "male" },
  { first_name: "Hillary", last_name: "Clinton", birth_year: 1947, gender: "female" }
]

list.each do |u|
	
	User.create! [ { username: u[:last_name], password_digest: u[:birth_year] } ]
	
	@uid = User.find_by(username: u[:last_name]).id

	Profile.create! [ { first_name: u[:first_name], last_name: u[:last_name], birth_year: u[:birth_year], gender: u[:gender], user_id: @uid } ]

	TodoList.create! [ { list_name: u[:first_name], list_due_date: @due_date, user_id: @uid } ]

	@tid = TodoList.find_by(list_name: u[:first_name]).id

	5.times do 

		TodoItem.create! [ { title: "Title", description: "Description", due_date: @due_date, todo_list_id: @tid, completed: false } ]

	end
	
end
