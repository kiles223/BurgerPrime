document.getElementById('add-avatar').addEventListener('click', () => {
    document.getElementById('avatar-input').click();
});

document.getElementById('avatar-input').addEventListener('change', (event) => {
    const file = event.target.files[0];

    if (file) {
        document.getElementById('avatar-form').style.display = 'block';
        const reader = new FileReader();
        reader.onload = function(e) {
            document.getElementById('add-avatar').innerHTML = `<img src="${e.target.result}" class="" ">`;
        };
        reader.readAsDataURL(file);
    }
});