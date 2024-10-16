# frozen_string_literal: true

class StartedTest < ApplicationRecord
  belongs_to :test
  belongs_to :user
end
