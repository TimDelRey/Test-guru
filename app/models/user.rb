# frozen_string_literal: true

class User < ApplicationRecord
  # has_many :created_tests,
  #          class_name: 'Test',
  #          foreign_key: 'user_id',
  #          dependent: :nullify
  # has_many :started_test,
  #          class_name: 'StartedTest',
  #          foreign_key: 'user_id',
  #          dependent: :destroy
  # has_many :tests, through: :started_test
  has_many :test_passages
  has_many :tests, through: :test_passages


  validates :email, presence: true

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
