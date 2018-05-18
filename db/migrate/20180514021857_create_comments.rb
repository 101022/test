class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments, comment: 'コメント' do |t|
      t.string :commenter, comment:                    '名前'
      t.text :body, comment:                           'コメント'
      t.references :post, foreign_key: true, comment:  '紐づく日記'

      t.timestamps
    end
  end
end
