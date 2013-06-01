# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.confirm!
user.add_role :admin

contas = Conta.create([{nome: 'Bradesco Prime', descricao: 'Conta corrente Ag 1019 CC 43352-7', cartao: false},
                       {nome: 'Itau Personnalite', descricao: 'Conta corrente Ag 4097 CC 2565-6', cartao: false},
                       {nome: 'Santander VanGogh', descricao: 'Conta corrente Ag 3193 CC 01081143-8', cartao: false},
                       {nome: 'Caixa Economica Federal', descricao: 'Conta corrente Ag 0919 Op 001 CC 24001-4', cartao: false},
                       {nome: 'Bradesco Visa Platinum', descricao: 'Cartao de Credito Bradesco Visa Platinum', cartao: true},
                       {nome: 'Personnalite Visa Platinum', descricao: 'Cartao de Credito Personnalite Visa Platinum', cartao: true},
                       {nome: 'Personnalite Master Platinum', descricao: 'Cartao de Credito Personnalite Master Platinum', cartao: true},
                       {nome: 'Santander Visa Platinum', descricao: 'Cartao de Credito Santander Visa Platinum', cartao: true},
                       {nome: 'Santander Master Platinum', descricao: 'Cartao de Credito Santander Master Platinum', cartao: true},
                       {nome: 'Caixa Visa Infinite', descricao: 'Cartao de Credito Caixa Visa Infinite', cartao: true}
                      ])

naturezas = Natureza.create([{nome: 'Aluguel', descricao: 'Despesas com alugueis de imoveis', receita: false},
                             {nome: 'Condominio', descricao: 'Taxa de condominio', receita: false},
                             {nome: 'Apartamento', descricao: 'Prestacao do financiamento do Apartamento', receita: false},
                             {nome: 'Mestrado', descricao: 'Mensalidades e despesas extras com Mestrado Marcelo', receita: false},
                             {nome: 'Energia Eletrica', descricao: 'Despesa mensal de energia eletrica', receita: false},
                             {nome: 'Telefonia Celular', descricao: 'Despesa com contas de telefonia celular', receita: false},
                             {nome: 'Telefonia Fixa, Internet e TV', descricao: 'Despesas com telefonia fixa, incluindo TV paga e Internet', receita: false},
                             {nome: 'Supermercado etc', descricao: 'Compras em supermercados, padarias, etc', receita: false},
                             {nome: 'Presentes, etc', descricao: 'Presentes de aniversario e afins', receita: false},
                             {nome: 'Viagens', descricao: 'Despesas com viagens (hospedagem, passagens, etc)', receita: false},
                             {nome: 'Passeios e eventos', descricao: 'Ingressos e outras despesas em saidas e passeios', receita: false},
                             {nome: 'Roupas, etc', descricao: 'Compras de vestuario e acessorios', receita: false},
                             {nome: 'Cuidados pessoais, etc', descricao: 'Cortes de cabelo, terapias, massagens, exames, etc', receita: false},
                             {nome: 'Esportes e jogos', descricao: 'Futebol, equipamentos, games', receita: false},
                             {nome: 'Previdencia', descricao: 'Aportes em planos de Previdencia Privada', receita: false},
                             {nome: 'Combustivel', descricao: 'Despesas com abastecimento de Combustivel nos carros', receita: false},
                             {nome: 'Seguros', descricao: 'Despesas com seguros', receita: false},
                             {nome: 'IPVA', descricao: 'Imposto sobre propriedade de veiculos automotores', receita: false},
                             {nome: 'Manutencao dos Carros', descricao: 'Despesas de manutencao dos carros (oficinas, etc)', receita: false},
                             {nome: 'Licenciamento', descricao: 'Despesa anual de emplacamento dos carros', receita: false},
                             {nome: 'Mensalidade BeachPark', descricao: 'Manutencao do contrato do BeachCard', receita: false},
                             {nome: 'Cartao Bradesco Visa', descricao: 'Pagamento da fatura cartao de credito Bradesco Visa Platinum', receita: false},
                             {nome: 'Cartao CEF Visa', descricao: 'Pagamento da fatura cartao de credito CEF Visa Infinite', receita: false},
                             {nome: 'Cartao Itau Visa', descricao: 'Pagamento da fatura cartao de credito Itau Visa Platinum', receita: false},
                             {nome: 'Cartao Itau Master', descricao: 'Pagamento da fatura cartao de credito Itau Visa Platinum', receita: false},
                             {nome: 'Cartao Santander Visa', descricao: 'Pagamento da fatura cartao de credito Santander Visa Platinum', receita: false},
                             {nome: 'Cartao Santander Master', descricao: 'Pagamento da fatura cartao de credito Santander Master Platinum', receita: false},
                             {nome: 'Despesas Bancarias', descricao: 'Tarifas e demais cobrancas bancarias', receita: false}
                            ])

aluguel = Natureza.find(1)
apartamento = Natureza.find(3)
mestrado = Natureza.find(4)
Orcamento.create([{mes: 6, ano: 2013, valor: 1540, natureza: aluguel},
                  {mes: 7, ano: 2013, valor: 1540, natureza: aluguel},
                  {mes: 8, ano: 2013, valor: 1540, natureza: aluguel},
                  {mes: 6, ano: 2013, valor: 2200, natureza: apartamento},
                  {mes: 7, ano: 2013, valor: 2250, natureza: apartamento},
                  {mes: 8, ano: 2013, valor: 2340, natureza: apartamento},
                  {mes: 9, ano: 2013, valor: 2400, natureza: apartamento},
                  {mes: 7, ano: 2013, valor: 1140, natureza: mestrado},
                  {mes: 8, ano: 2013, valor: 5600, natureza: mestrado}
])

bradesco = Conta.find(1)
Lancamento.create([{mes: 6, ano: 2013, valor: 1540, natureza: aluguel, conta: bradesco, realizado: true},
                   {mes: 7, ano: 2013, valor: 1540, natureza: aluguel, conta: bradesco, realizado: true},
                   {mes: 8, ano: 2013, valor: 1540, natureza: aluguel, conta: bradesco, realizado: false},
                   {mes: 6, ano: 2013, valor: 2240, natureza: apartamento, conta: bradesco, realizado: true},
                   {mes: 7, ano: 2013, valor: 2295, natureza: apartamento, conta: bradesco, realizado: false},
                   {mes: 7, ano: 2013, valor: 1140, natureza: mestrado, conta: bradesco, realizado: false}
])
