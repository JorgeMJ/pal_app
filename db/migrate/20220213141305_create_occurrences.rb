class CreateOccurrences < ActiveRecord::Migration[6.0]
  def change
    create_table :occurrences do |t|
      t.string :time
      t.text :antecedent

      t.timestamps
    end
  end
end
