class Task < ApplicationRecord
  validates :name, presence: true
  validates :name, length: {maximum: 30}

  # before_validation :set_nameless_name

  validate :validate_name_not_including_comma

  belongs_to :user

  private

  def validate_name_not_including_comma
    errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
  end

  # def set_nameless_name
  #   self.name = '名称なし' if name.blank?
  # end

end
