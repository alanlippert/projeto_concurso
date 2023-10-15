# frozen_string_literal: true

class AddNameToAdmins < ActiveRecord::Migration[7.0]
  def change
    add_column :admins, :first_name, :string
    add_column :admins, :last_name, :string
  end
end
