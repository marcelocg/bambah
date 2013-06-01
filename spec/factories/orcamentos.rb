# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :orcamento do
    mes 1
    ano 1
    observacao "MyString"
    valor "9.99"
    natureza nil
    conta nil
  end
end
