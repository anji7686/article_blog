class Article < ActiveRecord::Base
  belongs_to :user
  validates :title, :presence => true
  validates :body, :presence => true
  has_attached_file :avatar, styles: {thumb: "100x100#"}
#  validates_attachment :image, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }
  has_many :comments
  scope :published, where("articles.published_at IS NOT NULL")
  scope :draft, where("articles.published_at IS NULL")
  scope :recent, lambda { published.where("articles.published_at > ?", 1.week.ago.to_date)}
  scope :where_title, lambda { |term| where("articles.title LIKE ?", "%#{term}%") }
  def long_title
    "#{title} - #{published_at}"
  end

  def published?
    published_at.present?
  end

  def owned_by?(owner)
    return false unless owner.is_a? User
    user == owner
  end
end