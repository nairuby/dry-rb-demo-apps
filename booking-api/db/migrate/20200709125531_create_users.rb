# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def up
    create_table :users do |t|
      t.text :name
      t.integer :age
      t.text :email

      t.timestamps
    end
  end

  def down
    remove_table :user
  end
end
