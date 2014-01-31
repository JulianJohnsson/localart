class SorceryCore < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name,            :null => false
      t.string :email,            :null => false
      t.string :crypted_password, :null => false
      t.string :salt,             :null => false

      t.timestamps
    end

    add_index :artists, :email, unique: true
  end
end