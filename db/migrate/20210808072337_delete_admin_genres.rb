class DeleteAdminGenres < ActiveRecord::Migration[5.2]
  def change
    drop_table :admin_genres
  end
end
