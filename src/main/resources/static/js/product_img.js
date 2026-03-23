
    document.addEventListener('DOMContentLoaded', function() {
    console.log('DOM загружен, инициализация скрипта...');

    const fileInput = document.getElementById('file1');
    const previewDiv = document.getElementById('image-preview');
    const previewImg = document.getElementById('preview-img');
    const fileInfo = document.getElementById('file-info');
    const labelText = document.querySelector('.file-input-label-text');
    const labelSubtext = document.querySelector('.file-input-label-subtext');

    console.log('fileInput:', fileInput);
    console.log('previewDiv:', previewDiv);
    console.log('previewImg:', previewImg);

    if (!fileInput || !previewDiv || !previewImg) {
    console.error('Не найдены необходимые элементы!');
    return;
}

    fileInput.addEventListener('change', function(event) {
    console.log('Событие change сработало!');

    const file = event.target.files[0];
    console.log('Выбран файл:', file);

    if (file) {
    if (!file.type.match('image.*')) {
    alert('Пожалуйста, выберите изображение');
    fileInput.value = '';
    previewDiv.classList.add('hidden');
    return;
}

    if (file.size > 5 * 1024 * 1024) {
    alert('Файл слишком большой. Максимальный размер 5 МБ');
    fileInput.value = '';
    previewDiv.classList.add('hidden');
    return;
}

    const reader = new FileReader();

    reader.onload = function(e) {
    console.log('Файл прочитан, обновляем превью');
    previewImg.src = e.target.result;
    previewDiv.classList.remove('hidden');

    if (labelText) {
    labelText.innerHTML = `<span class="font-semibold">Файл выбран:</span> ${file.name}`;
}
    if (labelSubtext) {
    labelSubtext.textContent = `${(file.size / 1024).toFixed(1)} КБ`;
}

    if (fileInfo) {
    fileInfo.textContent = `Имя: ${file.name} | Размер: ${(file.size / 1024).toFixed(1)} КБ | Тип: ${file.type}`;
}
};

    reader.onerror = function() {
    console.error('Ошибка чтения файла');
    alert('Ошибка при чтении файла');
};

    reader.readAsDataURL(file);
} else {
    previewDiv.classList.add('hidden');
    previewImg.src = '';

    // Восстанавливаем текст в лейбле
    if (labelText) {
    labelText.innerHTML = '<span class="font-semibold">Нажмите для загрузки</span> или перетащите файл';
}
    if (labelSubtext) {
    labelSubtext.textContent = 'PNG, JPG, JPEG (макс. 5 МБ)';
}
    if (fileInfo) {
    fileInfo.textContent = '';
}
}
});

    console.log('Обработчик события добавлен');
});
