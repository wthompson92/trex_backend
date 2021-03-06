module Types
  class TripType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :start_date, String, null: false
    field :end_date, String, null: false
    field :user_id, Integer, null: false
    field :follower_id, Integer, null: false
    field :legs, [Types::LegType], null: true
  end
end
