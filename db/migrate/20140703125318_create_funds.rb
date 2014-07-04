class CreateFunds < ActiveRecord::Migration
  def change
    create_table :funds do |t|
      t.text :description
      t.integer :debit
      t.integer :credit

      t.timestamps
    end
  end
end
