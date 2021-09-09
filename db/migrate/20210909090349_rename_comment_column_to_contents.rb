class RenameCommentColumnToContents < ActiveRecord::Migration[6.1]
  def change
    rename_column :contents, :comment, :my_comment
  end
end
