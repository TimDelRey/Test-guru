 # frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author,
             class_name: 'User',
             foreign_key: 'user_id'

  has_many :questions,
           dependent: :destroy
  # has_many :started_tests,
  #          class_name: 'StartedTest',
  #          foreign_key: 'test_id',
  #          dependent: :destroy
  # has_many :users, through: :started_tests,
  #                  dependent: :nullify
  has_many :test_passages
  has_many :users , through: :test_passages

  validates :title, presence: true,
                    uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true,
                                    greater_than: 0,
                                    allow_nil: true }

  scope :simple, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :desc_tests_by_category, lambda { |name_category|
                                   select(:title, :updated_at)
                                     .order(updated_at: :desc)
                                     .joins(:category)
                                     .where(category: { title: name_category })
                                     .pluck(:title)
                                 }
end
