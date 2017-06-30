class ToDoItem < ActiveRecord::Base
  belongs_to :todo_list
end
