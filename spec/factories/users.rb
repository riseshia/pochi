# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    provider "github"
    uid "some_user_id"
  end
end
