module Akatus
  class Transactions
    def process(order)
      xml = prepare_xml_to_send order
    end

    def self.status(akatus_uuid)
      url = "#{akatus_api_uri}/transacao-simplificada/#{akatus_uuid}.json?email=#{seller_email}&api_key=#{seller_api_key}"
      request = HTTPI::Request.new
      request.url = url
      request.open_timeout = 10 # sec
      request.read_timeout = 30 # sec
      @response ||= HTTPI.get request
      #TODO Finish to implement this
    end

    private

      def prepare_xml_to_send(order)
        builder = Nokogiri::XML::Builder.new do |xml|
          xml.carrinho {
            xml.recebedor {
              xml.api_key seller_api_key
              xml.email seller_email
            }
            xml.pagador {
              xml.nome order.buyer_name
              xml.email order.buyer_email
            }
            xml.produtos {
              order.products.each do |product|
                xml.produto {
                  xml.codigo product.code
                  xml.descricao product.name
                  xml.quantidade product.quantity || 1
                  xml.peso product.weight || 0.0
                  xml.frete product.freight_amount || 0.0
                  xml.preco product.price
                }
              end
            }

            xml.transacao {
              xml.desconto_total order.discount_amount || 0.0
              xml.peso_total order.weight || 0.0
              xml.frete_total order.freight_amount || 0.0
              xml.moeda 'BRL'
              xml.meio_de_pagamento order.payment_method
              xml.parcelas order.installments
            }
          }
        end
      end
  end
end
