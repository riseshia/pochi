# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    provider "github"
    sequence(:uid) { |n| "uid#{n}" }
  end
end
