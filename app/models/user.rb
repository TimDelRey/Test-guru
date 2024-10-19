# frozen_string_literal: true

class User < ApplicationRecord
  has_many :created_tests,
           class_name: 'Test',
           foreign_key: 'user_id',
           dependent: :nullify
  has_many :started_test,
           class_name: 'StartedTest',
           foreign_key: 'user_id',
           dependent: :destroy
  has_many :tests, through: :started_test

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  def tests_history_by_level(level)
    Test.joins(:started_tests)
        .where(started_tests: { user_id: id })
        .where('level = ?', level)
        .pluck(:title)
  end
end
