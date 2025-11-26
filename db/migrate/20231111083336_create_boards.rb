class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.string :title
      t.text :body
      t.string :subject
      t.string :grade

      t.timestamps
    end
  end
end
