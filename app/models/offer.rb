class Offer
  include Mongoid::Document
  store_in collection: "offers"
  belongs_to :user

  field :_id, type: BSON::ObjectId
  field :offerdetails, type: String

  validates :user_id, presence: true
  validates :offerdetails, presence: true,
            length: {minimum: 3, maximum: 250}
end
