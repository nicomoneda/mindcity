class AddViewersToStreams < ActiveRecord::Migration[6.1]
  def change
    add_column :streams, :viewers, :integer
  end
end
