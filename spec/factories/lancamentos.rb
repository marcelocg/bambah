# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lancamento do
    mes 1
    ano 1
    descricao "MyString"
    valor "9.99"
    realizado false
    natureza_id nil
    conta_id nil
  end
end
