class CreateAdminMsgs < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_msgs do |t|
      t.text :body

      t.timestamps
    end
  end
end
