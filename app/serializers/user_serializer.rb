class UserSerializer < ActiveModel::Serializer
  attributes :id , :email, :name, :provider, :role, :wallet
end
