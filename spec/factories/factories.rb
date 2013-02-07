Factory.define :order do |f|
  f.buyer_email       'user@mailer.com'
  f.buyer_name        'Homer Simpson'
  f.discount_amount   1.98
  f.weight            0.99
  f.freight_amount    1.78
  f.payment_method    'cartao_master'
  f.installments      3
  f.reference         'referencia-01'

  2.times { f.products << Factory(:product) }
  f.credit_card       Factory(:credit_card) 
  f.address           Factory(:address)
  f.phone             Factory(:phone)
end  

Factory.define :product do |f|
  f.code              '0001'
  f.name              'Produto Tabajara'
  f.quantity          1
  f.weight            2.5
  f.freight_amount    10.0
  f.discount_amount   1.99
  f.price             55.99
end

Factory.define :credit_card do |f|
  f.number            '5453010000066167'
  f.flag              'master'
  f.cvv               '123'
  f.expires_at        '05/2018'
  f.holder_name       'AUTORIZAR'
  f.holder_cpf        '13786614431'
  f.holder_phone      '1133331111'
end  

Factory.define :address do |f|
  f.postal_code       '03222000'
  f.street            'Evergreen Al.'
  f.number            '30'
  f.complement        'apto 23'
  f.neighborhood      'Centro'
  f.city              'London'
  f.state             'AC'
  f.kind              'residencial'
end  

Factory.define :phone do |f|
  f.kind              'residencial'
  f.number            '1133331111'
end  