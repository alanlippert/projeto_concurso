# frozen_string_literal: true

class Subject < ApplicationRecord
  has_many :questions
end
