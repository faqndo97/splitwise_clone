class CreateDeptorsExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :deptors_expenses do |t|
      t.references :expense, null: false, foreign_key: true
      t.references :deptor, null: false

      t.timestamps
    end

    add_foreign_key :deptors_expenses, :users, column: :deptor_id
  end
end
