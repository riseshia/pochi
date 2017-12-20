# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Top", type: :feature do
  describe "access top page" do
    it "redirected to Sign in page" do
      visit root_path
      expect(page).to have_text("Login with Github")
    end
  end
end
