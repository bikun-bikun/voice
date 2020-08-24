class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name, nill: false
      t.string :name_kana, nill: false
      t.string :president, nill: false
      t.string :president_kana, nill: false
      t.string :zip_code
      t.string :address
      t.string :tel
      t.string :fax
      t.string :email

      t.timestamps
    end
  end
end
