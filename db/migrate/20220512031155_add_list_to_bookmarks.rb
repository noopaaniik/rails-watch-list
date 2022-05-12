class AddListToBookmarks < ActiveRecord::Migration[6.1]
  def change
    add_reference :bookmarks, :list, null: false, foreign_key: true
  end
end
