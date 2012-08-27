class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable,
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :first_name, :last_name, :website, :company, :bio,
                  :skills, :learning, :skill_list, :learning_list

  acts_as_taggable
  acts_as_taggable_on :skills, :learning

  before_save :capitalize_names

  validates :first_name, :last_name, :email, :presence => true
  validates :first_name, :last_name, :format => { :with => /\A[a-zA-Z]+\z/,
                                                  :message => "only letters allowed" }
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :bio, :length => { :in => 2..140 }

  # Public: The User's full name
  #
  # Returns a String of the User's first_name and last_name
  def name
    "#{ first_name } #{ last_name }"
  end

  alias_method :full_name, :name

  # ===========================================================================
  # Private
  # ===========================================================================

  # private

  # Internal: Capitalize each name attribute
  #
  # Example
  #
  #   @user.first_name = 'gareth'
  #   @user.save
  #   @user.first_name
  #   # => "Gareth"
  #
  # Returns a String
  def capitalize_names
    first_name.capitalize!
    last_name.capitalize!
  end

end
