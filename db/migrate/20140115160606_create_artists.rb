class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :email
      t.string :password_hash
      t.string :place
      t.string :art_piece
      t.integer :art_piece_price
      t.string :wepay_access_token
      t.integer :wepay_account_id

      t.timestamps
    end
  end
end
