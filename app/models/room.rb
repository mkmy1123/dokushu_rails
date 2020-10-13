class Room < ApplicationRecord
  validates :name, :place, :number, presence: true
  validates :name, length: { maximum: 30 }
  validates :name, format: { with: /\+?#[0-9][0-9]/, message: "会議室名が正しくありません" }
  validates :place, inclusion: ["東京", "大阪", "福岡", "札幌", "仙台", "名古屋", "金沢"]
  validates :number, numericality: { greater_than: 4, less_than: 31 }
  validate :number_must_be_5_multiple

  before_validation :remove_space

  private
    def remove_space
      ary = self.name.split(' ')
      self.name = ary.join('_')
    end

    def number_must_be_5_multiple
      if number.present? && number % 5 != 0
        errors.add(:number, "収容人数は5の倍数で指定してください")
      end
    end
end
