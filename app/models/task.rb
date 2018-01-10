# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :user

  has_many :coins, dependent: :destroy

  validates :name, presence: true
  validates :user_id, presence: true

  delegate :count, to: :coins, prefix: true, allow_nil: true

  scope :doing, -> { where(done: false) }
  scope :done, -> { where(done: true) }
end
