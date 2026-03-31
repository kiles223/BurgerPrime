<!DOCTYPE html>
<html class="scroll-smooth" lang="ru">
    <head>
        <meta charset="UTF-8">
        <title>Корзина</title>
        <base href="${springMacroRequestContext.contextPath}/">
        <link rel="icon" href="static/img/alt_logo 1.png">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
        <style>
            @font-face {
                font-family: 'MontserratAlternates-Bold';
                src: url("../static/fonts/MontserratAlternates-Bold.ttf") format("truetype");
            }
            @font-face {
                font-family: 'MontserratAlternates-SemiBold';
                src: url("../static/fonts/MontserratAlternates-SemiBold.ttf") format("truetype");
            }
            @font-face {
                font-family: 'MontserratAlternates-Medium';
                src: url("../static/fonts/MontserratAlternates-Medium.ttf") format("truetype");
            }
            @font-face {
                font-family: 'Montserrat-Medium';
                src: url("../static/fonts/Montserrat-Medium.ttf") format("truetype");
            }
            @font-face {
                font-family: 'Montserrat-Bold';
                src: url("../static/fonts/Montserrat-Bold.ttf") format("truetype");
            }
            body {
                font-family: 'MontserratAlternates-SemiBold', sans-serif;
            }
            @keyframes 
                slideUp {
                    0% {
                        opacity: 1;
                        transform: translateY(0);
                    }
                    100% {
                        opacity: 0;
                        transform: translateY(-20px);
                    }
                }
            .animate-slide-up {
                animation: slideUp 0.2s forwards;
            }
            #results {
                border: 1px solid #ddd;
                border-radius: 8px;
                max-height: 400px;
                overflow-y: auto;
                display: none;
                background: white;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            }

            .result-item {
                padding: 12px 16px;
                border-bottom: 1px solid #eee;
                cursor: pointer;
                transition: background-color 0.2s;
            }

            .result-item:hover {
                background-color: #f5f5f5;
            }

            .result-item:last-child {
                border-bottom: none;
            }

            .result-item.active {
                background-color: #e8f0fe;
            }

            .address-street {
                font-weight: bold;
                color: #333;
                margin-bottom: 4px;
            }

            .address-location {
                color: #666;
                font-size: 14px;
            }

            .address-distance {
                color: #888;
                font-size: 12px;
                margin-top: 2px;
            }

            .loading {
                padding: 16px;
                text-align: center;
                color: #666;
            }

            .no-results {
                padding: 16px;
                text-align: center;
                color: #666;
            }

            .highlight {
                background-color: #fff9c4;
                padding: 1px 2px;
                border-radius: 2px;
            }
        </style>
    </head>
    <body>
        <header class="flex fixed justify-center items-center h-15 w-full bg-[#D5552E] pt-2 pb-2 space-x-1 rounded-b-[24px] shadow-xl">
            <img class="" src="/static/img/alt_logo 1.png">
            <p class="text-[20px] text-white"><a href="">BurgerPrime</a></p>
        </header>
        <main class="flex justify-center bg-[#FFF9EE] h-full min-h-screen w-full pt-15 pb-45">
            <div class="w-[361px] h-full">
                <div id="address_btn" class="flex items-center justify-between h-[107px] bg-[#1D342C] mt-[32px] rounded-[24px] shadow-2xl py-[16px] px-[16px] text-white">
                    <div class=" text-[18px]">
                        <p style="font-family: 'MontserratAlternates-Bold';">Доставим на ваш адрес</p>
                        <#if accountInformation?? && accountInformation.address??>
                            <p style="font-family: 'Montserrat-Medium';">${accountInformation.address}</p>
                            <#else>
                            <p style="font-family: 'Montserrat-Medium';">Введите адрес</p>
                        </#if>
                    </div>
                    <img src="../static/img/arrow.png" alt="">
                </div>
                <div id="products" class="w-full h-full mt-[32px] space-y-[32px]">
                    <#list products as product>
                        <div data-product-cost="${(product.price * (1-(discount?double/100.0)))?int}" data-product-id="${product.id}" class="flex items-start product-item justify-start h-[148px] bg-[#F0E4CB] rounded-[24px] shadow-2xl px-[16px] py-[16px] pb-[16px] space-x-[16px]">
                            <img class="h-[120px]" src="/images/${product.previewImageId}" alt="">
                            <div class="space-y-[8px] w-full">
                                <p style="font-family: 'MontserratAlternates-Bold';" class="text-[#D5552E] text-[19px]">${product.name}</p>
                                <div class="flex justify-around items-center -ml-3 mt-3 space-x-[10px] w-[103px]">
                                    <img class="minus_button h-[40px]" src="../static/img/minus.png" alt="">
                                    <p class="count text-[24px] mb-1">1</p>
                                    <img class="plus_button h-[40px] mr-7" src="../static/img/plus.png" alt="">
                                </div>
                                <div class="flex w-full space-x-[4px]">
                                    <p style="font-family: 'MontserratAlternates-Bold';" class="cost text-[#1D342C] text-[19px] -mt-1">${(product.price * (1-(discount?double/100.0)))?int} руб.</p>
                                </div>
                            </div>
                        </div>
                        <#else>
                            <p style="font-family: 'MontserratAlternates-Bold';" class="text-[32px] text-[#D5552E] text-center mt-[32px]">Корзина пуста</p>
                    </#list>
                    <script src="../static/js/basket_counter.js"></script>
                    <div class="flex justify-between items-center px-[16px] h-[76px] rounded-[24px] bg-[#F0E4CB] fixed bottom-[76px] w-[361px]">
                        <p id="final_cost" style="font-family: 'MontserratAlternates-Bold';" class="text-[24px] text-[#1D342C]">${(sum* (1-(discount?double/100.0)))?int} руб.</p>
                        <#if accountInformation.address??>
                            <button id="order_button" class="bg-[#1D342C] w-[126px] h-[46px] text-white rounded-[8px] text-[18px]">Заказать</button>
                            <#else>
                            <button id="fake_order_button" class="bg-[#1D342C] w-[126px] h-[46px] text-white rounded-[8px] text-[18px]">Заказать</button>
                        </#if>
                    </div>
                    <script src="../static/js/basket_createorder.js"></script>
                </div>
            </div>
        </main>
        <div id="modal" class="fixed flex justify-center items-center bg-black/50 w-screen min-h-screen hidden top-0 left-0">
            <div class=" flex justify-center items-center w-[361px] min-h-[172px] bg-[#F0E4CB] rounded-[20px] m-auto mt-[140px]">
                <div class="w-[254px] h-full">
                    <form action="profile/add_address" method="post">
                    <p style="font-family: 'Montserrat-Bold';" class="text-center text-[18px] text-[#D5552E] mt-[16px]">Добавить адрес доставки</p>
                    <div class="flex justify-center items-center mt-[16px] search-container">
                        <input name="address" style="font-family: 'Montserrat-Medium';" id="searchInput" type="text" class="w-full h-[30px] bg-white pl-[16px] rounded-[8px] shadow-xl" placeholder="Введите адрес">
                    </div>
                    <div id="results"></div>
                    <script src="../static/js/address_search.js"></script>
                    <div class="flex justify-end mt-[16px]">
                        <button type="submit" style="font-family: 'Montserrat-Bold';" class="bg-[#1D342C] w-full h-[30px] text-center text-white rounded-[8px] shadow-xl mb-[16px]">Сохранить</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>
        <script src="../static/js/basket_address.js"></script>
        <div class="flex justify-around items-center w-full h-15 bg-[#F0E4CB] fixed bottom-0 rounded-t-[16px] shadow-xl">
            <a href=""><img src="/static/img/main.png" alt=""></a>
            <a href="menu"><img src="/static/img/menu.png" alt=""></a>
            <a href="basket"><img src="/static/img/basket_active.png" alt=""></a>
            <a href="profile"><img src="/static/img/profile.png" alt=""></a>
        </div>
    </body>
</html>