class Activity < ApplicationRecord
  include StepModel

  validates :name, presence: true, if: :step1?
  validates :address, presence: true, if: :step2?
  validates :starts_at, presence: true, if: :step3?
  validates :ends_at, presence: true, if: :step3?

  def self.total_steps
    3
  end
end
