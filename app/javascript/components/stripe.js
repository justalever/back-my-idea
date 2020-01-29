const StripeCharges = {
  initialize() {
    this.mountCard()
  },

  mountCard() {
    const stripe = Stripe(document.getElementById('payment-form').dataset.stripeKey);
    const elements = stripe.elements();

    const style = {
      base: {
        // Add your base input styles here. For example:
        fontSize: '16px',
        color: '#32325d',
      },
    };
    // Create an instance of the card Element.
    const card = elements.create('card', { style });

    // Add an instance of the card Element into the `card-element` <div>.

    if (card) {
      const form = document.getElementById('payment-form');
      card.mount('#card-element');
      this.generateToken(card, form);
    }
  },

  generateToken(card, form) {
    // Create a token or display an error when the form is submitted.
    form.addEventListener('submit', async (event) => {
      event.preventDefault();

      const { token, error } = await stripe.createToken(card);

      if (error) {
        // Inform the customer that there was an error.
        const errorElement = document.getElementById('card-errors');
        errorElement.textContent = error.message;
      } else {
        // Send the token to your server.
        this.tokenHandler(token, form);
      }
    });
  },

  tokenHandler(token, form) {
    // Insert the token ID into the form so it gets submitted to the server
    const hiddenInput = document.createElement('input');
    hiddenInput.setAttribute('type', 'hidden');
    hiddenInput.setAttribute('name', 'stripeToken');
    hiddenInput.setAttribute('value', token.id);
    form.appendChild(hiddenInput);

    // Submit the form
    form.submit();
  }
}

export default StripeCharges;
