# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

	Product.create(name:"zach", unit_price: 9.99, category_id: 2)
	Product.create(name:"lamp", unit_price: 19.99, category_id: 1)
	Product.create(name:"apple", unit_price: 139.99, category_id: 3)

	User.create(name: "admin", email: "admin@admin.com", admin: true, password: "admin123")