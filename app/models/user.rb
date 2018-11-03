class User < ApplicationRecord
  attr_accessor :login

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :email, length: { minimum: 0 },uniqueness:{case_insensitive:true},allow_blank:true, allow_nil:true
  validates :phonenumber,presence:true,uniqueness:{case_insensitive:true},format:{with: /\A[0-9 +]{5,20}\z/}
  validates :username,uniqueness:{case_insensitive:true},format:{ with: /\A[a-zA-Z0-9]{6,20}\z/,message: "Ce nom d'utilisateur n'est pas valide!" }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def self.find_first_by_auth_conditions(warden_conditions)
       conditions = warden_conditions.dup
       if login = conditions.delete(:login)
           where(conditions.to_hash).where("lower(email)=:value OR lower(username)=:value OR lower(phonenumber)=:value", value: login.downcase).first
       else
           where(conditions.to_hash).first
       end
  end

  def email_required?
     false
  end


end
