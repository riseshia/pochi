# frozen_string_literal: true

class Category < ApplicationRecord
  belongs_to :user

  has_many :tasks

  validates :name, presence: true
  validates :user_id, presence: true
end
