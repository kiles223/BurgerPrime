document.querySelectorAll('.plus').forEach(btn => {
    btn.addEventListener('click', () => {
        const productId = parseInt(btn.getAttribute('data-product-id'), 10);

        fetch('/basket/add_product?productId=' + encodeURIComponent(productId), {
            method: 'POST'
        })
    });
});