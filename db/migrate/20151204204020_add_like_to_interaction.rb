class AddLikeToInteraction < ActiveRecord::Migration
  def change
    add_column :interactions, :like, :boolean
  end
end
