class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts 'ブログ' do |t|
      t.string :name    '名前'
      t.string :title   'タイトル'
      t.text :content   '本文'

      t.timestamps
    end
  end
end
