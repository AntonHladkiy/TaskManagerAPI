# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :priority, numericality: { greater_than: 0 }
  validate :due_date_cannot_be_in_past

  def due_date_cannot_be_in_past
    errors.add(:dueDate, "can't be in the past") if dueDate.present? && dueDate < Date.today
  end
end
