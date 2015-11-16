class StepSerializer < ActiveModel::Serializer
  	attributes :id, :title, :description, :category, :frequency, :count, :published
end
