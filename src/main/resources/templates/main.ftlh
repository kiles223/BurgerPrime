<!DOCTYPE html>
<html lang="ru">
    <head>
        <meta charset="UTF-8">
        <title>Главная</title>
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
            <img class="" src="/static/img/alt_logo 1.png">
            <p class="text-[20px] text-white">BurgerPrime</p>
        </header>
        <main class="flex justify-center bg-[#FFF9EE] h-screen w-full pt-15">
            <div class="w-[369px]">
                <#if isAuthenticated>
                    <div class="bg-[#F0E4CB] h-27 w-full mt-[32px] rounded-[24px] shadow-2xl">
                        <div class="flex h-full justify-center items-center">
                            <p style="font-family: 'MontserratAlternates-Bold';" class="text-[#D5552E] text-[32px]/5.5">Ваша скидка: <span class="text-[#1D342C]">${accountInformation.discount}%</span></p>
                        </div>
                    </div>
                    <#else>
                        <a href="/login">
                            <div class="bg-[#1D342C] h-27 w-full mt-[32px] rounded-[24px] shadow-2xl">
                                <div class="flex h-full justify-between items-center">
                                    <p class="text-white ml-[16px] text-[18px]/5.5">Авторизуйтесь для<br> получения скидки</p>
                                    <img class="mr-[16px]" src="../static/img/arrow.png">
                                </div>
                            </div>
                        </a>
                </#if>
                <div class="mt-[32px]">
                    <p style="font-family: 'MontserratAlternates-Bold'" class="text-[32px] text-[#D5552E]" style="font-family: 'Montserrat-Bold';">Акции</p>
                    <a href="/menu">
                        <div class="flex relative items-center h-[206px] bg-[url(../static/img/banner_bg.png)] mt-[16px] pl-[16px]">
                            <img class="absolute top-[16px]" src="../static/img/logo.png">
                            <p style="font-family: 'Montserrat-Bold';" class="text-[28px]/8 text-white">Приведи друга<br><span style="font-family: 'Montserrat-Medium';" class="text-[14px] text-white">Получи большую колу</span></p>
                        </div>
                    </a>
                </div>
            </div>
        </main>
        <div class="flex justify-around items-center w-full h-15 bg-[#F0E4CB] fixed bottom-0 rounded-t-[16px] shadow-xl">
            <a href="/"><img src="/static/img/main_active.png" alt=""></a>
            <a href="/menu"><img src="/static/img/menu.png" alt=""></a>
            <a href="/basket"><img src="/static/img/basket.png" alt=""></a>
            <a href="/profile"><img src="/static/img/profile.png" alt=""></a>
        </div>
    </body>
</html>