<!DOCTYPE html>
<html class="scroll-smooth" lang="ru">
    <head>
        <meta charset="UTF-8">
        <title>Вход</title>
        <link rel="icon" href="/static/img/alt_logo 1.png">
        <base href="${springMacroRequestContext.contextPath}/">
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
        </style>
    </head>
    <body>
        <header class="flex fixed justify-center items-center h-15 w-full bg-[#D5552E] pt-2 pb-2 space-x-1 rounded-b-[24px] shadow-xl">
            <img class="" src="/static/img/alt_logo 1.png">
            <p class="text-[20px] text-white"><a href="">BurgerPrime</a></p>
        </header>
        <main class="flex justify-center bg-[#FFF9EE] h-full min-h-screen w-full pt-15 pb-45">
            <div class="w-[361px] h-full">
                <div class="w-full mt-[114px] ">
                    <p style="font-family: 'MontserratAlternates-Bold';" class="text-[32px] text-[#D5552E] text-center">Вход</p>
                    <div class="bg-[#F0E4CB] w-full h-full mt-[16px] rounded-[24px] shadow-2xl py-[32px]">
                        <form method="POST" action="login" class="w-full space-y-[16px] px-[42px]">
                            <input name="name" style="font-family: 'Montserrat-Medium';" class="bg-white w-full h-[38px] rounded-[8px] shadow-2xl text-[18px] px-[16px] cursor-pointer" type="text" name="" id="" placeholder="Введите имя" required>
                            <input name="password" id="password_input" style="font-family: 'Montserrat-Medium';" class="bg-white w-full h-[38px] rounded-[8px] shadow-2xl text-[18px] px-[16px] cursor-pointer" type="password" name="" id="" placeholder="Введите пароль" required>
                            <button class="bg-[#1D342C] h-[38px] w-full rounded-[8px] shadow-2xl text-white text-[18px] cursor-pointer">Войти</button>
                        </form>
                        <div class="w-full space-y-[16px]"></div>
                            <p style="font-family: 'Montserrat-Bold';" class="text-[#D5552E] text-center text-[18px] mt-[16px]">или</p>
                            <a href="oauth2/authorization/google" class="flex justify-between items-center bg-[#1D342C] h-[38px] w-[277px] rounded-[4px] shadow-2xl text-white text-[18px] py-[8px] pl-[29px] pr-[36px] mx-auto mt-[16px]">Войти с помощью<img src="../static/img/google_icon.png"></a>
                            <p style="font-family: 'Montserrat-Bold';" class=" text-[18px] text-center text-[#D5552E] mt-[16px]">Не зарегистрированы?</p>
                            <div class="w-full flex justify-center">
                            <a style="font-family: 'Montserrat-Bold';" href="registration" class="text-[#1D342C] text-[18px] mt-[8px]">Зарегистрироваться</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <div class="flex justify-around items-center w-full h-15 bg-[#F0E4CB] fixed bottom-0 rounded-t-[16px] shadow-xl">
            <a href=""><img src="/static/img/main.png" alt=""></a>
            <a href="menu"><img src="/static/img/menu.png" alt=""></a>
            <a href="basket"><img src="/static/img/basket.png" alt=""></a>
            <a href="profile"><img src="/static/img/profile_active.png" alt=""></a>
        </div>
    </body>
</html>