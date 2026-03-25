<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Оставить отзыв</title>
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
        <a href="/profile"><img class="absolute top-[17px] left-[16px]" src="../static/img/reversed_arrow.png" alt=""></a>
        <img class="" src="/static/img/alt_logo 1.png">
        <p class="text-[20px] text-white"><a href="/">BurgerPrime</a></p>
    </header>
    <main class="flex justify-center bg-[#FFF9EE] h-full min-h-screen w-full pt-15 pb-45">
        <div class="w-[361px] h-full">
            <form action="/feedback" method="post">
                <p style="font-family: 'MontserratAlternates-Bold', sans-serif;" class="text-[32px] text-center text-[#D5552E] mt-[32px]">Оставьте отзыв</p>
                <div class="relative w-full h-[200px]">
                    <textarea name="feedback" class="w-full h-full rounded-[16px] bg-white mt-[16px] p-[16px] pb-[50px] shadow-xl" placeholder="Напишите ваш отзыв"></textarea>
                    <div class="absolute stars flex space-x-[8px] -bottom-3 left-[16px]">
                        <p class="text-black text-[32px]">&#9733;</p>
                        <p class="text-black text-[32px]">&#9733;</p>
                        <p class="text-black text-[32px]">&#9733;</p>
                        <p class="text-black text-[32px]">&#9733;</p>
                        <p class="text-black text-[32px]">&#9733;</p>
                    </div>
                    <input name="rating" id="rating" type="hidden">
                    <button class="w-full h-[40px] bg-[#1D342C] text-white text-[18px] mt-[18px] rounded-[10px]">Сохранить</button>
                </div>
            </form>
        </div>
        <script src="../static/js/feedback.js"></script>
    </main>
    <div class="flex justify-around items-center w-full h-15 bg-[#F0E4CB] fixed bottom-0 rounded-t-[16px] shadow-xl">
        <a href="/"><img src="/static/img/main.png" alt=""></a>
        <a href="/menu"><img src="/static/img/menu.png" alt=""></a>
        <a href="/basket"><img src="/static/img/basket.png" alt=""></a>
        <a href="/profile"><img src="/static/img/profile_active.png" alt=""></a>
    </div>
</body>
</html>