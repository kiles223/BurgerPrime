const address_btn = document.getElementById('address_btn');
const modal = document.getElementById('modal');
address_btn.addEventListener('click', () => {
    modal.style.display = 'block';
    document.body.style.overflow = 'hidden';
});
modal.addEventListener('click', (event) => {
    if (event.target === modal) {
        modal.style.display = 'none';
        document.body.style.overflow = '';
    }
});