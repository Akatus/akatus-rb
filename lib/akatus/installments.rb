module Akatus
  class Installments

    SIMULATION_URI =

    def self.simulate(payment_method_code, amount)
      url = "#{Akatus.akatus_api_uri}/parcelamento/simulacao.json?email=#{Akatus.seller_email}&api_key=#{Akatus.seller_api_key}&payment_method=#{payment_method_code}&amount=#{amount}"
      request = HTTPI::Request.new
      request.url = url
      request.open_timeout = 10 # sec
      request.read_timeout = 30 # sec
      response = HTTPI.get request
      translate_installments_keys_to_english(response)
    end

    private

      def self.translate_installments_keys_to_english(response)
        parsed_response = JSON.parse(response.raw_body)['resposta']
        translated = {}
        translated[:description] = parsed_response['descricao']
        translated[:assumed_installments] = parsed_response['parcelas_assumidas']
        translated[:installments] = []
        parsed_response['parcelas'].each do |p|
          installment = {}
          installment[:installments_number] = p['quantidade'].to_i
          installment[:installments_amount] = p['valor'].to_f
          installment[:total_amount] = p['total'].to_f
          translated[:installments] << installment
        end
        translated
      end
  end
end
