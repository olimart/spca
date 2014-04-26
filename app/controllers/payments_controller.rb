class PaymentsController < ApplicationController

	def new
	end

	def create
		@payment = Payment.new(safe_params)

    # Amount in cents
    amount = 1500 #(@user.fees_amount.to_f * 100).to_i
    Stripe.api_key = ENV['STRIPE_API_KEY']
    token = params[:stripeToken]

    begin
      customer = Stripe::Customer.create(
        email: params[:stripeEmail],
        card:  token
      )

      charge = Stripe::Charge.create({
        customer:        customer.id,
        amount:          amount,
        description:     "Renouvellement licence",
        currency:        ENV['STRIPE_CURRENCY']#,
        # application_fee: (ENV['STRIPE_APPLICATION_FEE'].to_f / 100 * amount).to_i
      })

      @payment.amount = amount
      @payment.currency = ENV['STRIPE_CURRENCY']
      @payment.stripe_charge_id = charge.id
      @payment.stripe_customer_id = customer.id

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_payment_url
    end

    respond_to do |format|
      if @payment.save
        format.html { redirect_to root_url, notice: 'Paiement reçu. Merci de votre confiance.' }
      else
        format.html { render action: "new", alert: "#{t 'payments.error'}." }
      end
    end
  end

  private

    def safe_params
    	params.require(:payment).permit(:amount)
    end
end
