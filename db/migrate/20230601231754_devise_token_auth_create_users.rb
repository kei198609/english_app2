class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[7.0]
  def change
    # 既存の users テーブルにカラムを追加する形に変更
    change_table(:users) do |t|
      ## Required
      # provider, uid のカラムを追加
      t.string :provider, :null => false, :default => "email"
      t.string :uid, :null => false, :default => ""

      ## Recoverable
      # 既に存在するためコメントアウト
      # t.string   :reset_password_token
      # t.datetime :reset_password_sent_at

      # 新たなカラム allow_password_change を追加
      t.boolean  :allow_password_change, :default => false

      ## Rememberable
      # 既に存在するためコメントアウト
      # t.datetime :remember_created_at

      ## Confirmable
      # 確認メールを送らないのであれば、これらのカラムは不要
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## User Info
      # 既存のname,avatarカラムがあるので、これらのカラムは不要
      # t.string :nickname
      # t.string :image

      ## Tokens
      t.text :tokens
    end

    # 新たなインデックスを追加
    add_index :users, [:uid, :provider],     unique: true
    # 既存のインデックスと同じなのでコメントアウト
    # add_index :users, :reset_password_token, unique: true
    # 確認メールを送らないのであれば、このインデックスは不要
    # add_index :users, :confirmation_token,   unique: true
  end
end