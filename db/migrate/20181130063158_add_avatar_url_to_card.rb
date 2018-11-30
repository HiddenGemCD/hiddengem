class AddAvatarUrlToCard < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :avatar_url, :string
  end
end
