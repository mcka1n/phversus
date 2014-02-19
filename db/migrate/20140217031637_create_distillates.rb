class CreateDistillates < ActiveRecord::Migration
  def change
    create_table :distillates do |t|
      t.string   "pool_id"
      t.string   "tag"
      t.timestamps
    end
  end
end
