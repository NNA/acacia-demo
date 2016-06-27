# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.create([
	{name: 'Apiculture'},
	{name: 'Aquaculture & Pêche'},
	{name: 'Boissons alcoolisées'}, 
	{name: 'Boissons non alcoolisées'},
	{name: 'Elevage'}, 
	{name: 'Epicerie salée'}, 
	{name: 'Epicerie sucrée'}, 
	{name: 'Horticulture'}, 
	{name: 'Innovation'}, 
	{name: 'Nature & Environnement'},
	{name: 'Produits laitiers'},
	{name: 'Viticulture'}
])

Project.create([{
	name: 'Un projet qui pousse, un jardin en devenir', 
	description: "J'ai besoin d'investir dans du matériel afin d’élargir ma production de fleurs comestibles, jeunes pousses, aromatiques et légumes choisis.",
	place: 'Rochefort-sur-Loire, France',
	category_id: 1,
	amount: 3000
	},{
	name: 'Repêchage de la poissonnerie de Carbonne',
	description: "Participez à la sauvegarde de vos commerces de proximité: la Belle Marine veut rester à Carbonne!",
	place: 'Carbonne, France',
	category_id: 2,
	amount: 1500}
	]);