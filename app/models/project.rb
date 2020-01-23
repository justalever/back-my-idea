class Project < ApplicationRecord
  after_create :set_expiration
  belongs_to :user
  has_rich_text :description
  has_one_attached :thumbnail
  has_many :comments, as: :commentable


  def backers
    # find users who backed a specific project
  end


end
