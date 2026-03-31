<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Добавление товара</title>
    <base href="${springMacroRequestContext.contextPath}/">
    <link rel="icon" href="static/img/alt_logo 1.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <style>
        @font-face {
            font-family: 'MontserratAlternates-Bold';
            src: url("/static/fonts/MontserratAlternates-Bold.ttf") format("truetype");
        }
        @font-face {
            font-family: 'MontserratAlternates-SemiBold';
            src: url("/static/fonts/MontserratAlternates-SemiBold.ttf") format("truetype");
        }
        @font-face {
            font-family: 'Montserrat-Medium';
            src: url("/static/fonts/Montserrat-Medium.ttf") format("truetype");
        }
        @font-face {
            font-family: 'Montserrat-Bold';
            src: url("/static/fonts/Montserrat-Bold.ttf") format("truetype");
        }
        body {
            font-family: 'MontserratAlternates-SemiBold', sans-serif;
        }
        .file-input-label {
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .file-input-label:hover {
            background-color: #D5552E !important;
            color: white !important;
        }
        .file-input-label:hover svg {
            stroke: white;
        }
        /* Стили для предпросмотра */
        #image-preview {
            transition: all 0.3s ease;
        }
    </style>
</head>
<body>
<header class="fixed h-30 w-full bg-[#D5552E] pt-2 pb-2 space-x-1 rounded-b-[24px] shadow-xl z-10">
    <div class="flex justify-center items-center w-full h-15">
        <img class="" src="/static/img/alt_logo 1.png">
        <p class="text-[20px] text-white"><a href="">Admin</a></p>
    </div>
    <div class="flex justify-center items-center mt-[24px] space-x-[64px] w-full h-15 bg-white">
        <a href="admin/users" style="font-family: 'MontserratAlternates-Bold';" class="bg-[#F0E4CB] text-[18px] shadow-lg w-[180px] text-center py-[4px] rounded-[4px] text-[#D5552E] cursor-pointer">Пользователи</a>
        <a href="admin/all_orders" style="font-family: 'MontserratAlternates-Bold';" class="bg-[#F0E4CB] text-[18px] shadow-lg w-[180px] text-center py-[4px] rounded-[4px] text-[#D5552E] cursor-pointer">Заказы</a>
        <a href="admin/products" style="font-family: 'MontserratAlternates-Bold';" class="bg-[#F0E4CB] text-[18px] shadow-lg w-[180px] text-center py-[4px] rounded-[4px] text-[#D5552E] cursor-pointer">Товары</a>
        <a href="admin/add/product" style="font-family: 'MontserratAlternates-Bold';" class="bg-[#D5552E] text-[18px] shadow-lg w-[180px] text-center py-[4px] rounded-[4px] text-white cursor-pointer">Добавить товар</a>
    </div>
</header>

<main class="w-full pt-40 px-6 pb-8 flex justify-center">
    <div class="w-full max-w-2xl">
        <div class="flex justify-between items-center mb-6">
            <h1 class="text-2xl text-[#2D2D2D]" style="font-family: 'Montserrat-Bold';">Добавление нового товара</h1>
        </div>

        <div class="bg-white rounded-xl shadow-lg overflow-hidden border border-[#E5D9C5] p-8">
            <form method="post" action="admin/add/product" enctype="multipart/form-data" class="space-y-6">
                <div>
                    <label for="name" class="block text-sm font-semibold text-[#2D2D2D] mb-2 uppercase tracking-wider" style="font-family: 'MontserratAlternates-Bold';">Название товара</label>
                    <input type="text" id="name" name="name" required
                           class="w-full px-4 py-3 border border-[#E5D9C5] rounded-lg focus:outline-none focus:ring-2 focus:ring-[#D5552E] focus:border-transparent"
                           style="font-family: 'Montserrat-Medium';">
                </div>

                <div>
                    <label for="category" class="block text-sm font-semibold text-[#2D2D2D] mb-2 uppercase tracking-wider" style="font-family: 'MontserratAlternates-Bold';">Категория</label>
                    <select id="category" name="category" required
                            class="w-full px-4 py-3 border border-[#E5D9C5] rounded-lg focus:outline-none focus:ring-2 focus:ring-[#D5552E] focus:border-transparent bg-white"
                            style="font-family: 'Montserrat-Medium';">
                        <option value="" disabled selected>Выберите категорию</option>
                        <option value="Бургер">Бургер</option>
                        <option value="Напиток">Напиток</option>
                        <option value="Снек">Снек</option>
                        <option value="Соус">Соус</option>
                    </select>
                </div>

                <div>
                    <label for="price" class="block text-sm font-semibold text-[#2D2D2D] mb-2 uppercase tracking-wider" style="font-family: 'MontserratAlternates-Bold';">Цена (₽)</label>
                    <input type="number" id="price" name="price" step="0.01" min="0" required
                           class="w-full px-4 py-3 border border-[#E5D9C5] rounded-lg focus:outline-none focus:ring-2 focus:ring-[#D5552E] focus:border-transparent"
                           style="font-family: 'Montserrat-Medium';">
                </div>

                <div>
                    <label class="block text-sm font-semibold text-[#2D2D2D] mb-2 uppercase tracking-wider" style="font-family: 'MontserratAlternates-Bold';">Изображение товара</label>
                    <div class="flex items-center justify-center w-full">
                        <label for="file1" class="file-input-label flex flex-col items-center justify-center w-full h-48 border-2 border-dashed border-[#E5D9C5] rounded-lg bg-[#F0E4CB] hover:bg-[#D5552E] transition-colors cursor-pointer">
                            <div class="flex flex-col items-center justify-center pt-5 pb-6">
                                <svg class="w-12 h-12 mb-3 text-[#D5552E] group-hover:text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
                                </svg>
                                <p class="mb-2 text-sm text-[#2D2D2D] file-input-label-text" style="font-family: 'Montserrat-Medium';">
                                    <span class="font-semibold">Нажмите для загрузки</span> или перетащите файл
                                </p>
                                <p class="text-xs text-[#4A4A4A] file-input-label-subtext" style="font-family: 'Montserrat-Medium';">PNG, JPG, JPEG (макс. 5 МБ)</p>
                            </div>
                            <input type="file" id="file1" name="file" accept="image/png, image/jpeg, image/jpg" class="hidden" required>
                        </label>
                    </div>
                    <div id="image-preview" class="mt-4 hidden">
                        <img id="preview-img" src="" alt="Превью" class="max-h-32 rounded-lg border border-[#E5D9C5]">
                        <p id="file-info" class="mt-2 text-sm text-[#4A4A4A]" style="font-family: 'Montserrat-Medium';"></p>
                    </div>
                </div>

                <div class="flex justify-end space-x-4 pt-4">
                    <a href="admin/products" class="px-6 py-3 bg-[#F0E4CB] text-[#D5552E] rounded-lg font-semibold hover:bg-[#e5d5b8] transition-colors" style="font-family: 'MontserratAlternates-Bold';">Отмена</a>
                    <button type="submit" class="px-6 py-3 bg-[#D5552E] text-white rounded-lg font-semibold hover:bg-[#b34425] transition-colors" style="font-family: 'MontserratAlternates-Bold';">Добавить товар</button>
                </div>
            </form>
        </div>
    </div>
</main>

<script src="/static/js/product_img.js">

</script>

</body>
</html>