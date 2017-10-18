class UserSerializer < ActiveModel::Serializer
  attributes :id , :email, :name, :provider, :role

  has_many :appointments
end
