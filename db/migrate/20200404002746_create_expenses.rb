class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.references :payer, null: false
      t.string :name
      t.float :amount
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end

    add_foreign_key :expenses, :users, column: :payer_id
  end
end
