# frozen_string_literal: true

require 'digest/sha1'

class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages

  has_secure_password

  def tests_history_by_level(level)
    Test.joins(:started_tests)
        .where(started_tests: { user_id: id })
        .where('level = ?', level)
        .pluck(:title)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
