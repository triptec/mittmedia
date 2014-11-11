class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.string :title
      t.string :type
      t.json :configuration_data

      t.timestamps
    end
  end
end
