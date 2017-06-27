class AppointmentSerializer < ActiveModel::Serializer
  attributes :time_and_date
  belongs_to :rabbi

end
