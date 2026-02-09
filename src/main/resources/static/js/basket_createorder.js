function sendCart() {
    const productQuantities = {};

    document.querySelectorAll('.product-item').forEach(item => {
        const productId = item.getAttribute('data-product-id');
        const countElement = item.querySelector('.count');
        const quantity = parseInt(countElement.textContent);
        if (quantity > 0) {
            productQuantities[productId] = quantity;
        }
    });

    console.log('Sending order data:', productQuantities);

    fetch('/order', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(productQuantities)
    })
        .then(response => {
            if (response.redirected) {
                window.location.href = response.url;
            } else {
                return response.json();
            }
        })

}

const order_button = document.getElementById('order_button');
order_button.addEventListener('click', () => {
    sendCart();
});
