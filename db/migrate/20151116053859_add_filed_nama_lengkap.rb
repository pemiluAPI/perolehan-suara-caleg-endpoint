class AddFiledNamaLengkap < ActiveRecord::Migration
  def change
  	add_column :calegs, :nama_lengkap, :string, after: :peserta
  end
end
