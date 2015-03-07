class CommuteSerializer < ActiveModel::Serializer
  attributes :id, :arrived_at, :departed_at
end
