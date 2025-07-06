# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Creating users..."
User.create(email_address: 'user@mail.com', password: '123456', password_confirmation: '123456')

puts "Creating locations..."
Location.create(
  name: "MASP",
  description: "Edifício icônico que abriga uma das mais importantes coleções de obras de arte renomadas da América Latina.",
  address: "Av. Paulista, 1578 - Bela Vista, São Paulo - SP, 01310-200",
  lat: -0.23561e2,
  lng: -0.46656e2,
  rating: 15
)
Location.create(
  name: "Farol Santander",
  description: "Inspirado no Empire State, o prédio é um dos mais altos do país, cartão postal da cidade, com mirante no topo.",
  address: "R. João Brícola, 24 - Centro Histórico de São Paulo, São Paulo - SP, 01014-900",
  rating: 12
)
Location.create(
  name: "Instituto Tomie Ohtake",
  description: "Apresentação de novas tendências da arte nacional e internacional, com ateliês, cursos, livraria e bistrô.",
  address: "Rua Coropé, 88 - Pinheiros, São Paulo - SP, 05426-010",
  rating: 10
)
Location.create(
  name: "Allianz Parque",
  description: "Estádio do Palmeiras e um dos palcos mais frequentes para artistas internacionais na cidade.",
  address: "Avenida Francisco Matarazzo, 1705, R. Palestra Itália, 200 - Água Branca, São Paulo - SP, 05001-200",
  rating: 8
)
Location.create(
  name: "Museu do Ipiranga",
  description: "Museu com vasto acervo sobre o Brasil e o estado de São Paulo",
  address: "Parque da Independência - Ipiranga, São Paulo - SP, 04263-000",
  rating: 4
)
