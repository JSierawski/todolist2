class CreateTodoItemsUsers < ActiveRecord::Migration
  def change
    create_table :todo_items_users do |t|
      t.references :user, index: true, foreign_key: true
      t.references :todo_item, index: true, foreign_key: true
    end
  end
end
