<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Таблица товаров</title>
    <base href="${springMacroRequestContext.contextPath}/">
    <link rel="icon" href="static/img/alt_logo 1.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <style>
        @font-face {
            font-family: 'MontserratAlternates-Bold';
            src: url("static/fonts/MontserratAlternates-Bold.ttf") format("truetype");
        }
        @font-face {
            font-family: 'MontserratAlternates-SemiBold';
            src: url("static/fonts/MontserratAlternates-SemiBold.ttf") format("truetype");
        }
        @font-face {
            font-family: 'Montserrat-Medium';
            src: url("static/fonts/Montserrat-Medium.ttf") format("truetype");
        }
        @font-face {
            font-family: 'Montserrat-Bold';
            src: url("static/fonts/Montserrat-Bold.ttf") format("truetype");
        }
        body {
            font-family: 'MontserratAlternates-SemiBold', sans-serif;
        }
    </style>
</head>
<body>
<header class=" fixed h-30 w-full bg-[#D5552E] pt-2 pb-2 space-x-1 rounded-b-[24px] shadow-xl">
    <div class="flex justify-center items-center w-full h-15">
        <img class="" src="static/img/alt_logo 1.png">
        <p class="text-[20px] text-white"><a href="">Admin</a></p>
    </div>
    <div class="flex justify-center items-center mt-[24px] space-x-[64px] w-full h-15 bg-white">
        <a href="admin/users" style="font-family: 'MontserratAlternates-Bold';" class="bg-[#F0E4CB] text-[18px] shadow-lg w-[180px] text-center py-[4px] rounded-[4px] text-[#D5552E] cursor-pointer">Пользователи</a>
        <a href="admin/all_orders" style="font-family: 'MontserratAlternates-Bold';" class="bg-[#F0E4CB] text-[18px] shadow-lg w-[180px] text-center py-[4px] rounded-[4px] text-[#D5552E] cursor-pointer">Заказы</a>
        <a href="admin/products" style="font-family: 'MontserratAlternates-Bold';" class="bg-[#D5552E]  text-[18px] shadow-lg w-[180px] text-center py-[4px] rounded-[4px] text-[#ffffff] cursor-pointer">Товары</a>
        <a href="admin/add/product" style="font-family: 'MontserratAlternates-Bold';" class="bg-[#F0E4CB] text-[18px] shadow-lg w-[180px] text-center py-[4px] rounded-[4px] text-[#D5552E] cursor-pointer">Добавить товар</a>
    </div>
</header>
<main class="w-full pt-40 px-6 pb-8">
    <div class="flex justify-between items-center mb-6">
        <h1 class="text-2xl text-[#2D2D2D]" style="font-family: 'Montserrat-Bold';">Список товаров</h1>

    </div>

    <div class="bg-white rounded-xl shadow-lg overflow-hidden border border-[#E5D9C5]">
        <table class="min-w-full divide-y divide-[#E5D9C5]">
            <thead class="bg-[#F0E4CB]">
            <tr>
                <th scope="col" class="px-6 py-4 text-left text-sm font-semibold text-[#2D2D2D] uppercase tracking-wider" style="font-family: 'MontserratAlternates-Bold';">ID</th>
                <th scope="col" class="px-6 py-4 text-left text-sm font-semibold text-[#2D2D2D] uppercase tracking-wider" style="font-family: 'MontserratAlternates-Bold';">Название</th>
                <th scope="col" class="px-6 py-4 text-left text-sm font-semibold text-[#2D2D2D] uppercase tracking-wider" style="font-family: 'MontserratAlternates-Bold';">Категория</th>
                <th scope="col" class="px-6 py-4 text-left text-sm font-semibold text-[#2D2D2D] uppercase tracking-wider" style="font-family: 'MontserratAlternates-Bold';">Цена</th>
                <th scope="col" class="px-6 py-4 text-left text-sm font-semibold text-[#2D2D2D] uppercase tracking-wider" style="font-family: 'MontserratAlternates-Bold';">Действия</th>
            </tr>
            </thead>
            <tbody class="bg-white divide-y divide-[#F0E4CB]">
            <#list products as product>
            <tr class="table-row-hover">
                <td class="px-6 py-4 whitespace-nowrap text-sm text-[#4A4A4A]" style="font-family: 'Montserrat-Medium';">#${product.id}</td>
                <td class="px-6 py-4 whitespace-nowrap">${product.name}</td>
                <td class="px-6 py-4 whitespace-nowrap text-sm text-[#4A4A4A]" style="font-family: 'Montserrat-Medium';">${product.category}</td>
                <td class="px-6 py-4 whitespace-nowrap text-sm text-[#4A4A4A]" style="font-family: 'Montserrat-Medium';">${product.price}</td>
                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                    <div class="flex space-x-3">

                        <a href="admin/delete_product/${product.id}" class="flex justify-center items-center text-[#ffffff] bg-[#FF0000] w-[140px] text-[18px] h-[40px] rounded-[4px] cursor-pointer">
                            <svg class="h-5 w-5" fill="none" stroke="white" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path>
                            </svg>
                            <p style="font-family: 'MontserratAlternates-Bold';" class="">УДАЛИТЬ</p>
                        </a>
                    </div>
                </td>
            </tr>
        </#list>
    </table>
</div>
</main>
</body>
</html>