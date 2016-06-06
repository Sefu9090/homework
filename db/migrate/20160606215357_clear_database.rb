class ClearDatabase < ActiveRecord::Migration
  def up
        drop_table :clas
        drop_table :classes
        drop_table :homeworks
        drop_table :homework
    drop_table :user
    drop_table :ph
  end
  
  def down
    
  end
end
