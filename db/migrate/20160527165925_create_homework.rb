class CreateHomework < ActiveRecord::Migration
  def up
    create_table :homework do |t|
      t.string  :name
      t.string :work
      t.timestamps
    end
  end

  def down
    drop_table :homework
  end
end

