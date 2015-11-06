class CreateCalegs < ActiveRecord::Migration
  def change
    create_table :calegs do |t|
    	t.string :peserta
    	t.integer :dapil_1
    	t.integer :dapil_2
    	t.integer :dapil_3
    	t.integer :dapil_4
    	t.integer :dapil_5

      t.timestamps
    end
  end
end
