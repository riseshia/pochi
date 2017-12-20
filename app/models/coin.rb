# frozen_string_literal: true

class Coin < ApplicationRecord
  belongs_to :task

  validates :task_id, presence: true
end
