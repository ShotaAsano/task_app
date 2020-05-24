class Task < ApplicationRecord
  # バリーデーションは機能しているが、エラー表示が出ない。「message: "文字列"」で表示できるのでは？

  # バリデーション記述（タイトル）
  validates :title, presence: true
  
  # FIXME: バリデーションエラーが出ないので一時的にコメントアウトしている

  # length: { in: 2..30 }
  # message: {"タイトルを2文字以上30字以内で入力してください！" }

  # バリデーション記述（タスク内容）
  # validates :content, presence: true,
  # length: { minimum: 5, maximum: 100, message: "タスク内容を5文字以上100字以内で入力してください！"}

  # # バリデーション記述（ステータス）
  # validates :status, presence: true,
  # length: { minimum: 2, maximum: 8, message: "タイトルを2文字以上8字以内で入力してください！"}

end
