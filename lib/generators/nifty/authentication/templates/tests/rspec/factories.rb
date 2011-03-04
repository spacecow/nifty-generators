Factory.define :user do |f|
  f.sequence(:username){|n| "Default username #{n}"}
  f.sequence(:email){|n| "default#{n}@email.com"}
  f.password "abc123"
end
