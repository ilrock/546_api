User.destroy_all
Comment.destroy_all
Restaurant.destroy_all





User.create(email: 'admin@admin.com', password: 'password')

Restaurant.create(name: 'LeWagonBistrot', address: 'Barcelona', user: User.first)

Restaurant.create(name: 'LeWagon Taverna', address: 'Madrid', user: User.first)

Comment.create(content: 'Great stuff', restaurant: Restaurant.first, user: User.first)