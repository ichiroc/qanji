# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

image_file = Rails.root.join('db/seed_data/sample.jpg').open('rb').read
image = Image.create(file_name: 'test.jpg',
                     data: image_file,
                     content_type: 'image/jpeg')
Word.create(text: '山', image: image)
