# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

User.create(email: "admin@email.com", password: "admin1", password_confirmation: "admin1", admin: true)
User.create(email: "user@email.com", password: "password", password_confirmation: "password")

Image.create(title: "Trees", body:"Trees in a dim forest.", tags:["trees", "forest", "nature"], price:20.00, file_location:"/img/trees")