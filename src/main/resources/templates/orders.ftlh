<!DOCTYPE html>
<html lang="ru">
    <head>
        <meta charset="UTF-8">
        <title>История заказов</title>
        <link rel="icon" href="/static/img/alt_logo 1.png">
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
        </style>
    </head>
    <body>
        <header class="flex fixed justify-center items-center h-15 w-full bg-[#D5552E] pt-2 pb-2 space-x-1 rounded-b-[24px] shadow-xl">
            <a href="/profile"><img class="absolute top-[17px] left-[16px]" src="../static/img/reversed_arrow.png" alt=""></a>
            <img class="" src="/static/img/alt_logo 1.png">
            <p class="text-[20px] text-white"><a href="/">BurgerPrime</a></p>
        </header>
        <main class="flex justify-center bg-[#FFF9EE] h-full min-h-screen w-full pt-15 pb-45">
            <div class="w-[361px] h-full">
                <div class="grid w-full py-[16px] space-y-[32px] mt-[16px]">
                    <#list orders as order>
                        <div class="bg-[#F0E4CB] rounded-[24px] px-[16px] text-[20px] pb-[16px]">
                            <div style="font-family: 'MontserratAlternates-Bold';" class="flex justify-between items-center">
                                <#if order.status == "Выполнен">
                                    <p class="text-[#0BA615] mt-[8px]">${order.status}</p>
                                </#if>
                                <#if order.status == "В процессе доставки">
                                    <p class="text-[#D5552E] mt-[8px]">${order.status}</p>
                                </#if>
                                <#if order.status == "Отменен">
                                    <p class="text-[#FF0000] mt-[8px]">${order.status}</p>
                                </#if>
                                <span class="bg-[#D5552E] py-[6px] w-[81px] text-center rounded-[16px] text-white mt-[10px]">${order.id}</span>
                            </div>
                            <p style="font-family: 'Montserrat-Medium';" class="text-[18px]">${order.date}</p>
                            <p style="font-family: 'Montserrat-Medium';" class="text-[18px]">${order.address}</p>
                            <div class="w-full mt-[32px]">
                                <#list order.getProducts() as product>
                                    <div class="w-full flex justify-between">
                                        <p style="font-family: 'Montserrat-Medium';" class="text-[18px]">${product.name}</p>
                                        <p style="font-family: 'Montserrat-Medium';" class="text-[18px] text-[#D5552E]">${product.quantity} x ${product.price?int} руб.</p>
                                    </div>
                                </#list>
                            </div>
                            <div class="flex justify-between w-full mt-[32px]">
                                <p style="font-family: 'Montserrat-Bold';" class="text-[20px] text-[#1D342C]">Итого</p>
                                <p style="font-family: 'Montserrat-Bold';" class="text-[20px] text-[#1D342C]">${order.totalPrice()} руб.</p>
                            </div>
                        </div>
                    </#list>
                </div>
            </div>
        </main>
        <div class="flex justify-around items-center w-full h-15 bg-[#F0E4CB] fixed bottom-0 rounded-t-[16px] shadow-xl">
            <a href="/"><img src="/static/img/main.png" alt=""></a>
            <a href="/menu"><img src="/static/img/menu.png" alt=""></a>
            <a href="/basket"><img src="/static/img/basket.png" alt=""></a>
            <a href="/profile"><img src="/static/img/profile_active.png" alt=""></a>
        </div>
    </body>
</html>