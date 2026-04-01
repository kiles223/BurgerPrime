<!DOCTYPE html>
<html class="scroll-smooth" lang="ru">
    <head>
        <meta charset="UTF-8">
        <title>Меню</title>
        <link rel="icon" href="static/img/alt_logo 1.png">
        <base href="${springMacroRequestContext.contextPath}/">
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
        <header class="w-full h-[132px] bg-[#FFF9EE] fixed">
            <div class="flex justify-center items-center h-15 bg-[#D5552E] space-x-1 rounded-b-[24px]">
                <img class="" src="static/img/alt_logo 1.png">
                <p class="text-[20px] text-white"><a href="">BurgerPrime</a></p>
            </div>
            <div id="header_nav" class="flex my-[16px] space-x-[16px] mx-[16px] overflow-auto">
                <a href="#burgers" style="font-family: 'MontserratAlternates-Bold'; background-color: #D5552E; color: #ffffff" class="bg-[#F0E4CB] text-[#D5552E] px-[16px] py-[4px] rounded-[4px] text-[18px] shadow-lg">Бургеры</a>
                <a href="#drinks" style="font-family: 'MontserratAlternates-Bold';" class="bg-[#F0E4CB] text-[#D5552E] px-[16px] py-[4px] rounded-[4px] text-[18px] shadow-lg">Напитки</a>
                <a href="#snacks" style="font-family: 'MontserratAlternates-Bold';" class="bg-[#F0E4CB] text-[#D5552E] px-[16px] py-[4px] rounded-[4px] text-[18px] shadow-lg">Cнеки</a>
                <a href="#souses" style="font-family: 'MontserratAlternates-Bold';" class="bg-[#F0E4CB] text-[#D5552E] px-[16px] py-[4px] rounded-[4px] text-[18px] shadow-lg">Соусы</a>
            </div>
            <script src="static/js/menu_nav_panel.js"></script>
        </header>
        <main class="h-full min-h-screen bg-[#FFF9EE] pt-[132px] px-[16px] pb-20 ">
            <div class="w-full">
                <p id="burgers" style="font-family: 'MontserratAlternates-Bold';" class="text-[32px] text-[#D5552E] scroll-mt-31">Бургеры</p>
                <div class="grid grid-col-1 w-full mt-[16px]">
                    <#list products as product>
                        <#if product.category == "Бургер">
                            <div class="w-[361px] mx-auto h-[413px] bg-[#F0E4CB] rounded-[24px] shadow-xl mb-[32px]">
                                <img class="mx-auto my-[16px]" src="images/${product.previewImageId}">
                                <p style="font-family: 'MontserratAlternates-Bold';" class="text-center text-[#D5552E] text-[32px] mb-[16px]">${product.name}</p>
                                <div class="flex justify-center space-x-[50px] pb-[16px]">
                                    <#if isAuthenticated && discount != 0>
                                         <div class="flex space-x-[8px]">
                                             <s style="font-family: 'MontserratAlternates-Bold';" class="text-[32px] text-[#1D342C]">${product.price?int}</s>
                                             <p style="font-family: 'MontserratAlternates-Bold';" class="text-[32px] text-[#1D342C]">${(product.price * (1-(discount?double/100.0)))?int} руб.</p>
                                        </div>
                                        <#else>
                                        <p style="font-family: 'MontserratAlternates-Bold';" class="text-[32px] text-[#1D342C]">${product.price?int} руб.</p>
                                    </#if>
                                    <#if basketProductsId?has_content && basketProductsId?seq_contains(product.id)>
                                        <img src="static/img/ready.png ">
                                        <#else>
                                        <button class="plus cursor-pointer" data-product-id="${product.id}"><img src="static/img/plus.png" alt=""></button>
                                    </#if>
                                </div>
                            </div>
                        </#if>

                    </#list>
                </div>
                <p id="drinks" style="font-family: 'MontserratAlternates-Bold';" class="text-[32px] text-[#D5552E] scroll-mt-31">Напитки</p>
                <div class="grid grid-col-1 w-full mt-[16px]">
                    <#list products as product>
                        <#if product.category == "Напиток">
                    <div class="w-[361px] mx-auto h-[413px] bg-[#F0E4CB] rounded-[24px] shadow-xl mb-[32px]">
                        <img class="mx-auto my-[16px]" src="images/${product.previewImageId}">
                        <p style="font-family: 'MontserratAlternates-Bold';" class="text-center text-[#D5552E] text-[32px] mb-[16px]">${product.name}</p>
                        <div class="flex justify-center space-x-[50px] pb-[16px]">
                            <#if isAuthenticated && discount != 0>
                            <div class="flex space-x-[8px]">
                                <s style="font-family: 'MontserratAlternates-Bold';" class="text-[32px] text-[#1D342C]">${product.price?int}</s>
                                <p style="font-family: 'MontserratAlternates-Bold';" class="text-[32px] text-[#1D342C]">${(product.price * (1-(discount?double/100.0)))?int} руб.</p>
                            </div>
                            <#else>
                            <p style="font-family: 'MontserratAlternates-Bold';" class="text-[32px] text-[#1D342C]">${product.price?int} руб.</p>
                        </#if>
                        <#if basketProductsId?has_content && basketProductsId?seq_contains(product.id) && isAuthenticated>
                            <img src="static/img/ready.png">
                        <#else>
                            <button class="plus cursor-pointer" data-product-id="${product.id}"><img src="static/img/plus.png" alt=""></button>
                        </#if>
                </div>
    </div>
                        </#if>
                    </#list>
                </div>
                <p id="snacks" style="font-family: 'MontserratAlternates-Bold';" class="text-[32px] text-[#D5552E] scroll-mt-31">Снеки</p>
                <div class="grid grid-col-1 w-full mt-[16px]">
                    <#list products as product>
                        <#if product.category == "Снеки">
                    <div class="w-[361px] mx-auto h-[413px] bg-[#F0E4CB] rounded-[24px] shadow-xl mb-[32px]">
                        <img class="mx-auto my-[16px]" src="images/${product.previewImageId}">
                        <p style="font-family: 'MontserratAlternates-Bold';" class="text-center text-[#D5552E] text-[32px] mb-[16px]">${product.name}</p>
                        <div class="flex justify-center space-x-[50px] pb-[16px]">
                            <#if isAuthenticated && discount != 0>
                            <div class="flex space-x-[8px]">
                                <s style="font-family: 'MontserratAlternates-Bold';" class="text-[32px] text-[#1D342C]">${product.price?int}</s>
                                <p style="font-family: 'MontserratAlternates-Bold';" class="text-[32px] text-[#1D342C]">${(product.price * (1-(discount?double/100.0)))?int} руб.</p>
                            </div>
                            <#else>
                            <p style="font-family: 'MontserratAlternates-Bold';" class="text-[32px] text-[#1D342C]">${product.price?int} руб.</p>
                        </#if>
                        <#if basketProductsId?has_content && basketProductsId?seq_contains(product.id)>
                        <img src="static/img/ready.png">
                        <#else>
                        <button class="plus cursor-pointer" data-product-id="${product.id}"><img src="static/img/plus.png" alt=""></button>
                    </#if>
                </div>
</div>
                        </#if>
                    </#list>
                </div>
                <p id="souses" style="font-family: 'MontserratAlternates-Bold';" class="text-[32px] text-[#D5552E] scroll-mt-31">Соусы</p>
                <div class="grid grid-col-1 w-full mt-[16px]">
                    <#list products as product>
                        <#if product.category == "Соус">
                    <div class="w-[361px] mx-auto h-[413px] bg-[#F0E4CB] rounded-[24px] shadow-xl mb-[32px]">
                        <img class="mx-auto my-[16px]" src="images/${product.previewImageId}">
                        <p style="font-family: 'MontserratAlternates-Bold';" class="text-center text-[#D5552E] text-[32px] mb-[16px]">${product.name}</p>
                        <div class="flex justify-center space-x-[50px] pb-[16px]">
                            <#if isAuthenticated && discount != 0>
                            <div class="flex space-x-[8px]">
                                <s style="font-family: 'MontserratAlternates-Bold';" class="text-[32px] text-[#1D342C]">${product.price?int}</s>
                                <p style="font-family: 'MontserratAlternates-Bold';" class="text-[32px] text-[#1D342C]">${(product.price * (1-(discount?double/100.0)))?int} руб.</p>
                            </div>
                            <#else>
                            <p style="font-family: 'MontserratAlternates-Bold';" class="text-[32px] text-[#1D342C]">${product.price?int} руб.</p>
                        </#if>
                        <#if basketProductsId?has_content && basketProductsId?seq_contains(product.id)>
                        <img src="static/img/ready.png">
                        <#else>
                        <button class="plus cursor-pointer" data-product-id="${product.id}"><img src="static/img/plus.png" alt=""></button>
                    </#if>
                </div>
</div>
                        </#if>
                    </#list>
                </div>
            </div>
        </main>
        <div class="flex justify-around items-center w-full h-15 bg-[#F0E4CB] fixed bottom-0 rounded-t-[16px] shadow-xl">
            <a href=""><img src="static/img/main.png" alt=""></a>
            <a href="menu"><img src="static/img/menu_active.png" alt=""></a>
            <a href="basket"><img src="static/img/basket.png" alt=""></a>
            <a href="profile"><img src="static/img/profile.png" alt=""></a>
        </div>
        <#if isAuthenticated>
            <script src="static/js/menu_addtobasket.js"></script>
        </#if>
    </body>
</html>