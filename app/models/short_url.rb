class ShortUrl < ActiveRecord::Base
  validates :original_url, presence: true

  def to_param
    id.to_i.to_s(36)
  end
end
