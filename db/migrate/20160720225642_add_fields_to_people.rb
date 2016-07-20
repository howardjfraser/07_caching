class AddFieldsToPeople < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :job, :string
    add_column :people, :bio, :string
  end
end
