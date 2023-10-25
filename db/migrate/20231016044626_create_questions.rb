# frozen_string_literal: true

class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.text :description, null: false
      t.references :subject, null: false, foreign_key: {on_delete: :cascade}

      t.timestamps
    end
  end
end
