class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    
    attr_accessor :creating
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many :user_decisions, dependent: :destroy
    has_many :decision, through: :user_decisions
    
    validates :nom, presence: true, length: {minimum: 2}
    validates :prenom, presence: true, length: {minimum: 2}
    validates :pseudo, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 5}
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, length: {minimum: 8}, confirmation: true, if: :creating?
    validates :password_confirmation, presence: true, length: {minimum: 8}, if: :creating?
    
    def creating?
       creating == 'true' || creating == true 
    end
    
end
