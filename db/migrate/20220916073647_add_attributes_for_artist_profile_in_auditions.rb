class AddAttributesForArtistProfileInAuditions < ActiveRecord::Migration[5.2]
  def change
     add_column :auditions, :country, :string
     add_column :auditions, :bio, :string
     add_column :auditions, :website_link, :string
  end
end
