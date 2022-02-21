class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :pig

  validates :status, inclusion: { in: ['pending', 'accepted', 'rejected'] }
  validate :end_date_is_after_start_date
  # validates :start_date, comparison: { greater_than: :end_date } # Rails 7

  validates :start_date, presence: true
  validates :end_date, presence: true

  private

  def end_date_is_after_start_date
    if end_date < start_date
      errors.add(:end_date, 'cannot be before the start date')
    end
  end
end
