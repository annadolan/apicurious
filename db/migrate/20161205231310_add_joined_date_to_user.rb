class AddJoinedDateToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :joined_date, :string
  end
end
