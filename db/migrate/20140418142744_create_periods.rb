class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.date :start_at
      t.date :end_at
      t.string :label
      t.references :company, index: true

      t.timestamps
    end
  end
end
