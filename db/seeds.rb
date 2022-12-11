p '==================== customer create ===================='
Customer.create!(name: "Yamada Taro", email: "yamada.taro@gmail.com", password: "111111")
Customer.create!(name: "Sato Mamoru", email: "sato.mamoru@gmail.com", password: "111111")
Customer.create!(name: "Tanaka Saki", email: "tanaka.saki@gmail.com", password: "111111")
Customer.create!(name: "Hoshino Yui", email: "hoshino.yui@gmail.com", password: "111111")
Customer.create!(name: "Saito Kazuma", email: "saito.kazuma@gmail.com", password: "111111")

p '==================== admin create ===================='
Admin.create!(email: "admin@gmail.com", password: "1234qwer")

p '==================== product create ===================='
product1 = Product.new(
  name: "Wool Comfort Hat",
  description: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.", 
  price: 4200, 
  stock: 30
)
product1.image.attach(io: File.open(Rails.root.join('app/assets/images/hat.jpg')), filename: 'hat.jpg')
product1.save!

product2 = Product.new(
  name: "Blue Jacket",
  description: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.", 
  price: 24800, 
  stock: 21
)
product2.image.attach(io: File.open(Rails.root.join('app/assets/images/jacket.jpg')), filename: 'jacket.jpg')
product2.save!

product3 = Product.new(
  name: "Square Pants",
  description: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.", 
  price: 5780, 
  stock: 10
)
product3.image.attach(io: File.open(Rails.root.join('app/assets/images/pants.jpg')), filename: 'pants.jpg')
product3.save!

product4 = Product.new(
  name: "T-shirt",
  description: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.", 
  price: 3900, 
  stock: 12
)
product4.image.attach(io: File.open(Rails.root.join('app/assets/images/shirt.jpg')), filename: 'shirt.jpg')
product4.save!

product5 = Product.new(
  name: "Runner Shoes",
  description: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.", 
  price: 8900, 
  stock: 8
)
product5.image.attach(io: File.open(Rails.root.join('app/assets/images/shoes.jpg')), filename: 'shoes.jpg')
product5.save!

product6 = Product.new(
  name: "Black Skirt",
  description: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.", 
  price: 3200, 
  stock: 30
)
product6.image.attach(io: File.open(Rails.root.join('app/assets/images/skirt.jpg')), filename: 'skirt.jpg')
product6.save!
