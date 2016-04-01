class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.boolean :admin
      t.string :gender
      t.date :birthdate
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
