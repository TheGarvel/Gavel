# frozen_string_literal: true

class Product < ApplicationRecord
  searchkick  searchable: [:name],
              word_middle: [:name],
              callbacks: :async
  validates :name , presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :start_price, :direct_price , presence:true,numericality: { greater_than: 0,  only_integer: true }

  belongs_to :user
  has_one :room
  has_many_attached :images do |attachable|
    attachable.variant :thumb, resize_to_limit: [600, 300]
  end

  has_one :boughtlist
  has_one :owner, through: :boughtlist, source: :user
  has_many :products_tags, dependent: :destroy
  has_many :tags, through: :products_tags
  has_many :records
  def self.all_status
    [
      %w[待拍賣 for_sale],
      %w[立即競標 sales]
    ]
  end
end
