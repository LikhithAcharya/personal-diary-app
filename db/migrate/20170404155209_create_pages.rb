class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.text :title
      t.text :description

      t.timestamps
    end
  end
end
