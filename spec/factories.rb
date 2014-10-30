FactoryGirl.define do
  factory :organization do
    sequence(:name) { |n| "Organization#{n}" }
  end

  factory :organization_user do
    sequence(:email) { |n| " user#{n}@example.com" }
    password "password"
    password_confirmation "password"
    organization
  end 

  factory :agency do
    sequence(:name) { |n| "Agency#{n}" }
    organization
  end

  factory :organization_eservice, class: "Eservice" do
    sequence(:name) { |n| "Organization E-service#{n}" }
    association :owner, factory: :organization
  end

  factory :agency_eservice, class: "Eservice" do
    sequence(:name) { |n| "Agency E-service#{n}" }
    association :owner, factory: :agency
  end

  factory :agency_category do
    sequence(:name) { |n| "Agency Category#{n}" }
    association :owner, factory: :organization
  end

  factory :organization_eservice_category, class: "EserviceCategory" do
    sequence(:name) { |n| "Organization E-service Category#{n}" }
    association :owner, factory: :organization
  end

  factory :agency_eservice_category, class: "EserviceCategory" do
    sequence(:name) { |n| "Agency E-service Category#{n}" }
    association :owner, factory: :agency
  end
end