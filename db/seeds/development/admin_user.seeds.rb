AdminUser.where(email: 'admin@example.com').destroy_all
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
