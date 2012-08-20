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

  before_save :strip_names
  before_update :log_tags

  # Public: The User's full name
  #
  # Returns a String of the User's first_name and last_name
  def name
    "#{first_name} #{last_name}"
  end

  alias_method :full_name, :name

  def avatar_path
    'http://placehold.it/100'
  end

  def log_tags
    Rails.logger.info "TAG LIST"
  end

  # ===========================================================================
  # Private
  # ===========================================================================

  private

  # Internal: Strip whitespace from name attributes
  #
  # Example
  #
  #   @user.first_name = ' Gareth '
  #   @user.save
  #   @user.first_name
  #   # => "Gareth"
  #
  # Returns ???
  def strip_names
    # first_name = first_name.strip
    # last_name = last_name.strip
  end

end
