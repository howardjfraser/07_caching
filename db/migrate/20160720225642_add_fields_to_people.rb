class AddFieldsToPeople < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :job_title, :string
    add_column :people, :bio, :text
  end
end
