class CreateStreams < ActiveRecord::Migration[6.1]
  def change
    create_table :streams do |t|
      t.string :title
      t.string :name

      t.timestamps
    end
  end
end
