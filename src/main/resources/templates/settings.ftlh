<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Настройки</title>
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
            font-family: 'MontserratAlternates-Medium';
            src: url("static/fonts/MontserratAlternates-Medium.ttf") format("truetype");
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
    <header class="flex fixed justify-center items-center h-15 w-full bg-[#D5552E] pt-2 pb-2 space-x-1 rounded-b-[24px] shadow-xl">
        <a href="profile"><img class="absolute top-[17px] left-[16px]" src="../static/img/reversed_arrow.png" alt=""></a>
        <img class="" src="static/img/alt_logo 1.png">
        <p class="text-[20px] text-white"><a href="">BurgerPrime</a></p>
    </header>
    <main class="flex justify-center bg-[#FFF9EE] h-screen w-full pt-15">
        <div class="w-[369px] pt-[32px]">
            <a class="w-full h-[57px]" href="logout">
                <div class="w-full h-[57px] rounded-[24px] bg-[#F0E4CB] flex justify-between items-center px-[16px] ">
                    <p style="font-family: 'MontserratAlternates-Bold'" class="text-[#D5552E] text-[18px]">Выйти из аккаунта</p>
                    <img src="static/img/alt_arrow.png">
                </div>
            </a>
            <a class="w-full h-[57px]" href="delete_account">
                <div class="w-full h-[57px] rounded-[24px] bg-[#FF0000] flex justify-between items-center px-[16px] mt-[16px]">
                    <p style="font-family: 'MontserratAlternates-Bold'" class="text-white text-[18px]">Удалить аккаунт</p>
                    <img src="static/img/arrow.png">
                </div>
            </a>
        </div>
    </main>
    <div class="flex justify-around items-center w-full h-15 bg-[#F0E4CB] fixed bottom-0 rounded-t-[16px] shadow-xl">
        <a href=""><img src="static/img/main.png" alt=""></a>
        <a href="menu"><img src="static/img/menu.png" alt=""></a>
        <a href="basket"><img src="static/img/basket.png" alt=""></a>
        <a href="profile"><img src="static/img/profile_active.png" alt=""></a>
    </div>
</body>
</html>