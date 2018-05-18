class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts, comment: 'ブログ' do |t|
      t.string :name, comment:    '名前'
      t.string :title, comment:   'タイトル'
      t.text :content, comment:   '本文'

      t.timestamps
    end
  end
end
