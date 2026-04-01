<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Таблица заказов</title>
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
            <a href="admin/all_orders" style="font-family: 'MontserratAlternates-Bold';" class="bg-[#D5552E] text-[18px] shadow-lg w-[180px] text-center py-[4px] rounded-[4px] text-[#ffffff] cursor-pointer">Заказы</a>
            <a href="admin/products" style="font-family: 'MontserratAlternates-Bold';" class="bg-[#F0E4CB] text-[18px] shadow-lg w-[180px] text-center py-[4px] rounded-[4px] text-[#D5552E] cursor-pointer">Товары</a>
            <a href="admin/add/product" style="font-family: 'MontserratAlternates-Bold';" class="bg-[#F0E4CB] text-[18px] shadow-lg w-[180px] text-center py-[4px] rounded-[4px] text-[#D5552E] cursor-pointer">Добавить товар</a>
        </div>
    </header>
    <main class="w-full pt-40 px-6 pb-8">
        <div class="flex justify-between items-center mb-6">
            <h1 class="text-2xl text-[#2D2D2D]" style="font-family: 'Montserrat-Bold';">Список заказов</h1>

        </div>

        <div class="bg-white rounded-xl shadow-lg overflow-hidden border border-[#E5D9C5]">
            <table class="min-w-full divide-y divide-[#E5D9C5]">
                <thead class="bg-[#F0E4CB]">
                <tr>
                    <th scope="col" class="px-6 py-4 text-left text-sm font-semibold text-[#2D2D2D] uppercase tracking-wider" style="font-family: 'MontserratAlternates-Bold';">ID</th>
                    <th scope="col" class="px-6 py-4 text-left text-sm font-semibold text-[#2D2D2D] uppercase tracking-wider" style="font-family: 'MontserratAlternates-Bold';">Адрес</th>
                    <th scope="col" class="px-6 py-4 text-left text-sm font-semibold text-[#2D2D2D] uppercase tracking-wider" style="font-family: 'MontserratAlternates-Bold';">Дата заказа</th>
                    <th scope="col" class="px-6 py-4 text-left text-sm font-semibold text-[#2D2D2D] uppercase tracking-wider" style="font-family: 'MontserratAlternates-Bold';">Статус</th>
                    <th scope="col" class="px-6 py-4 text-left text-sm font-semibold text-[#2D2D2D] uppercase tracking-wider" style="font-family: 'MontserratAlternates-Bold';">ID Заказчика</th>
                    <th scope="col" class="px-6 py-4 text-left text-sm font-semibold text-[#2D2D2D] uppercase tracking-wider" style="font-family: 'MontserratAlternates-Bold';">Действия</th>
                </tr>
                </thead>
                <tbody class="bg-white divide-y divide-[#F0E4CB]">
                <#list orders as order>
                    <tr class="table-row-hover">
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-[#4A4A4A]" style="font-family: 'Montserrat-Medium';">#${order.id}</td>
                        <td class="px-6 py-4 whitespace-nowrap">
                            <div class="flex items-center">

                                <div class="ml-4">
                                    <div class="text-sm font-medium text-[#2D2D2D]" style="font-family: 'MontserratAlternates-SemiBold';">${order.address}</div>
                                </div>
                            </div>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-[#4A4A4A]" style="font-family: 'Montserrat-Medium';">${order.date}</td>
                        <td class="px-6 py-4 whitespace-nowrap">
                                <#if order.status == "В процессе доставки">
                                    <span class="px-3 py-1 inline-flex text-xs leading-5 font-semibold rounded-full bg-blue-100 text-[#D5552E]" style="font-family: 'Montserrat-Medium';">
                                        ${order.status}
                                    </span>
                                </#if>
                                <#if order.status == "Выполнен">
                                    <span class="px-3 py-1 inline-flex text-xs leading-5 font-semibold rounded-full bg-blue-100 text-[#0BA615]" style="font-family: 'Montserrat-Medium';">
                                                    ${order.status}
                                                </span>
                                </#if>
                                <#if order.status == "Отменен">
                                <span class="px-3 py-1 inline-flex text-xs leading-5 font-semibold rounded-full bg-blue-100 text-[#FF0000]" style="font-family: 'Montserrat-Medium';">
                                                        ${order.status}
                                                    </span>
                                </#if>
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-[#4A4A4A]" style="font-family: 'Montserrat-Medium';">${order.getAccount().id}</td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                            <div class="flex space-x-3">
                                <#if order.status == "В процессе доставки">
                                    <a href="admin/delivered/${order.id}" class="flex justify-center items-center text-[#ffffff] w-[160px] text-[18px] h-[40px] bg-[#0BA615] rounded-[4px] cursor-pointer">
                                        <p style="font-family: 'MontserratAlternates-Bold';" class="">ДОСТАВЛЕНО</p>
                                    </a>
                                    <a href="admin/cancel/${order.id}" class="flex justify-center items-center text-[#ffffff] bg-[#FF0000] w-[160px] text-[18px] h-[40px] rounded-[4px] cursor-pointer">
                                        <p style="font-family: 'MontserratAlternates-Bold';" class="">ОТМЕНИТЬ</p>
                                    </a>
                                </#if>
                            </div>
                        </td>
                    </tr>
                </#list>
            </table>
        </div>
    </main>
</body>
</html>