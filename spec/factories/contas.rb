# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :conta do
    nome "MyString"
    descricao "MyString"
    cartao false
  end
end
