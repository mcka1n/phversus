class FixPoolIdOnDistillates < ActiveRecord::Migration
  def change
  	change_table :distillates do |t|
      t.rename :pool_id, :media_id
     end
  end
end
