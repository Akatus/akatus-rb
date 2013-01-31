Factory.define :product do |f|
  f.code '0001'
  f.name 'Produto Tabajara'
  f.quantity 1
  f.weight 2.5
  f.freight_amount 10.0
  f.discount_amount  1.99
  f.price 55.99
end

Factory.define :order do |f|
  f.buyer_email 'user@mailer.com'
  f.buyer_name 'Homer Simpson'
  f.discount_amount 0
  f.weight 0
  f.freight_amount 0
  f.payment_method 'cartao_master'
  f.installments 3
end  