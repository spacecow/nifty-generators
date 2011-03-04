class <%= user_class_name %> < ActiveRecord::Base
<%- if options[:authlogic] -%>
  acts_as_authentic
<%- else -%>
  # new columns need to be added here to be writable through mass assignment
  attr_accessible :username, :email, :password, :password_confirmation

  attr_accessor :password
  before_create :set_role
  before_save :prepare_password

  validates_presence_of :username
  validates_uniqueness_of :username, :email, :allow_blank => true
  validates_format_of :username, :with => /^[-\w\._@]+$/i, :allow_blank => true, :message => "should only contain letters, numbers, or .-_@"
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i
  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_length_of :password, :minimum => 4, :allow_blank => true

  ROLES = %w[god admin mini_admin user]

  def role?( role ); roles.include? role.to_s end
  def role_symbols; roles.map(&:to_sym) end

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end
  def roles
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end
  def set_role; self.roles = ["user"] end
  
  # login can be either username or email address
  def self.authenticate(login, pass)
    <%= user_singular_name %> = find_by_username(login) || find_by_email(login)
    return <%= user_singular_name %> if <%= user_singular_name %> && <%= user_singular_name %>.password_hash == <%= user_singular_name %>.encrypt_password(pass)
  end

  def encrypt_password(pass)
    BCrypt::Engine.hash_secret(pass, password_salt)
  end

  private

  def prepare_password
    unless password.blank?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = encrypt_password(password)
    end
  end
<%- end -%>
end
