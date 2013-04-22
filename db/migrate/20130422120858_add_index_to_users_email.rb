class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
    # ensure uniqueness by enforcing at database level
    add_index :users, :email, unique: true
  end
end
