class AddPreviewToStreams < ActiveRecord::Migration[6.1]
  def change
    add_column :streams, :preview_url, :string
  end
end
