class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments 'コメント' do |t|
      t.string :commenter                     '名前'
      t.text :body                            'コメント'
      t.references :post, foreign_key: true   '紐づく日記'

      t.timestamps
    end
  end
end
