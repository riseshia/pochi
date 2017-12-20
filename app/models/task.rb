# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :coins, dependent: :destroy

  validates :name, presence: true
  validates :user_id, presence: true
  validates :category_id, presence: true
end
