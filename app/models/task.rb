class Task < ApplicationRecord
  extend Enumerize
  enumerize :status, in: { doing: 0, waiting: 1, pending: 2, done: 3, canceled: 4 }

  # バリーデーションは機能しているが、エラー表示が出ない。

  # バリデーション記述（タイトル）
  validates :title, 
  presence: { message: 'タイトルを入力してください' }, 
  length: { in: 2..20, message: '2〜20文字以内でタイトルを入力してください' }

  # バリデーション記述（タスク内容）
  validates :content, presence: true

  # バリデーション記述（ステータス）
  validates :status, presence: true

  # バリデーション記述（期日）
  validates :deadline_at, presence: true

end
