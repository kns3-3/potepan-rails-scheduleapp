class Schedule < ApplicationRecord
    validates :title, :start_date, :end_date, presence: true
    validates :title, length: { maximum: 20 }
    validates :memo, length: { maximum: 500 }

    validate :end_date_after_start_date

    private

    def end_date_after_start_date
      # 開始日か終了日が空白ならpresenceのバリデーションに任せる
      return if end_date.blank? || start_date.blank?
      # 終了日が開始日より前の日付だった場合、エラーメッセージを追加する
      if end_date < start_date
        errors.add(:end_date, "は開始日以降の日付を選択してください")
      end
    end
end
