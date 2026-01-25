

const form_btn = document.getElementById('form_btn');
const fileInput = document.getElementById('getFile');
const change_avatar_btn = document.getElementById('change_avatar_btn');
const close_btn = document.getElementById('close');
const ava = document.getElementById('ava');
const alt_ava = document.getElementById('alt_ava');


form_btn.addEventListener('click', () => {
    fileInput.click();
});

fileInput.addEventListener('change', () => {
    if (fileInput.files.length > 0) {
        change_avatar_btn.style.display = 'block';
        close_btn.style.display = 'block';
        const file = fileInput.files[0];
        const reader = new FileReader();

        reader.onload = function(e) {
            ava.src = e.target.result;
            alt_ava.src = e.target.result;
        };

        reader.readAsDataURL(file);
    }
});
close_btn.addEventListener('click', () => {
    ava.src = "/images/${account.avatarId}";
    change_avatar_btn.style.display = 'none';
    close_btn.style.display = 'none';
    fileInput.value = '';
    location.reload();

});