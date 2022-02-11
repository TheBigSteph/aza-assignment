class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.references :customer, null: false, foreign_key: true
      t.integer :input_amount
      t.string :input_currency
      t.integer :output_amount
      t.string :output_currency

      t.timestamps
    end
  end
end
