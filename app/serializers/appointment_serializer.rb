class AppointmentSerializer < ActiveModel::Serializer
  attributes :time_and_date, :rabbi
  belongs_to :rabbi

end
