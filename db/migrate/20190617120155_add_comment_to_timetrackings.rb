class AddCommentToTimetrackings < ActiveRecord::Migration[5.1]
  def change
    add_column :timetrackings, :comment, :text
  end
end
