class StripeCharges {
  constructor({ form, key }) {
    this.form = form;
    this.key = key;
    this.stripe = Stripe(this.key)
  }

  initialize() {
    this.mountCard()
  }

  mountCard() {
    const elements = this.stripe.elements();

    const style = {
      base: {
        color: "#32325D",
        fontWeight: 500,
        fontSize: "16px",
        fontSmoothing: "antialiased",

        "::placeholder": {
          color: "#CFD7DF"
        },
        invalid: {
          color: "#E25950"
        }
      },
    };

    const card = elements.create('card', { style });
    if (card) {
      card.mount('#card-element');
      this.generateToken(card);
    }
  }

  generateToken(card) {
    let self = this;
    this.form.addEventListener('submit', async (event) => {
      event.preventDefault();

      const { token, error } = await self.stripe.createToken(card);

      if (error) {
        const errorElement = document.getElementById('card-errors');
        errorElement.textContent = error.message;
      } else {
        this.tokenHandler(token);
      }
    });
  }

  tokenHandler(token) {
    let self = this;
    const hiddenInput = document.createElement('input');
    hiddenInput.setAttribute('type', 'hidden');
    hiddenInput.setAttribute('name', 'stripeToken');
    hiddenInput.setAttribute('value', token.id);
    this.form.appendChild(hiddenInput);

    ["brand", "last4", "exp_month", "exp_year"].forEach(function (field) {
      self.addCardField(token, field);
    });
    this.form.submit();
  }

  addCardField(token, field) {
    let hiddenInput = document.createElement('input');
    hiddenInput.setAttribute('type', 'hidden');
    hiddenInput.setAttribute('name', "user[card_" + field + "]");
    hiddenInput.setAttribute('value', token.card[field]);
    this.form.appendChild(hiddenInput);
  }
}

// Kick it all off
document.addEventListener("turbolinks:load", () => {
  const form = document.querySelector('#payment-form')
  if (form) {
    const charge = new StripeCharges({
      form: form,
      key: form.dataset.stripeKey
    });
    charge.initialize()
  }
})
