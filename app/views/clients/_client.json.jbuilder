json.extract! client, :id, :name, :name_kana, :president, :president_kana, :zip_code, :address, :tel, :fax, :email, :created_at, :updated_at
json.url client_url(client, format: :json)
