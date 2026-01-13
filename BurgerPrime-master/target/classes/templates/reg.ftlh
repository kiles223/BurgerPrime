<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <link rel="icon" href="../static/img/favicon.ico" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <title>BurgerPrime</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        @font-face {
            font-family: 'Lato';
            src: url("../static/fonts/Lato-Regular.ttf") format("truetype");
        }
        @font-face {
            font-family: 'Montserrat';
            src: url("../static/fonts/Montserrat-Regular.ttf") format("truetype");
        }
        body {
            font-family: 'Montserrat', sans-serif;
        }
    </style>
</head>
<body class=" text-zinc-800 w-full">
    <main class="flex bg-[url(../static/img/reg_bg.png)] justify-start items-center h-240 w-full mx-auto pt-40 ">
        <div class="border-4 border-zinc-400 bg-zinc-200 rounded-xl mb-45 h-200 w-200 rounded-lg ml-20">
            <img class="h-60 w-60 top-10 left-90 absolute" src="../static/img/logo.png">
            <p class="text-center font-bold mt-43 text-4xl">РЕГИСТРАЦИЯ</p>
            <form action="/registration" method="post" class="pt-5 w-200 h-125 grid justify-center">
                <p class="font-bold text-xl">Имя:</p>
                <input name="name" type="text" class="w-100 pl-2 bg-zinc-200 text-xl border-b-4 h-10 " placeholder="Введите имя">
                <p class="font-bold text-xl">Пароль:</p>
                <input name="password" type="password" class="w-100 text-xl bg-zinc-200 pl-2 h-10 border-b-4  " placeholder="Введите пароль">
                <button type="submit" class="bg-[#542d2d] text-white text-xl text-stone-800 mt-2 rounded border h-10 w-100">Зарегистрироваться</button>
                <p class="ml-3.5 font-bold text-xl">Если уже зарегистрированны:<a href="/login" class="text-[#34a615] hover:cursor-pointer"> Войти</a></p>
                <#if errorMessage??>
                    <h2 class="ml-10 mb-10 text-red-500 font-bold text-xl">${errorMessage}</h2>
                </#if>
                <p class="ml-20 font-bold text-xl">Есть вопросы? <a class="text-[#34a615] hover:cursor-pointer" href="https://vk.com/im?entrypoint=community_page&media=&sel=-235216715">Задать</a></p>
            </form>
        </div>

    </main>
    <footer class=" bg-zinc-400 h-115 pt-15 pb-10 text-white w-full">
        <div class="space-x-3 h-40 pb-15 flex items-center justify-center w-full ">
            <a href="/"><img class="h-30 w-39 mr-20" src="../static/img/alt_logo.png" alt="Иконка"></a>
            <div class="w-60 pt-12">
                <p class="text-2xl font-bold">Обратная связь:</p>
                <p>(мы свяжемся с вами в ближайшее время)</p>
            </div>
            <form>
                <input name="email" class="bg-zinc-200 pl-5 border border-zinc-400 border-4 h-12 w-200 rounded-3xl text-stone-800" type="email" placeholder="Email">
                <button  type="submit" class="bg-green-300 font-bold hover:bg-green-400 cursor-pointer h-10 pl-0.5 w-30 text-stone-800 rounded-3xl">Отправить</button>
            </form>
        </div>
        <hr class="border border-zinc-600 border-1 w-425 ml-25">
        <div class="flex justify-around pt-10 ">
            <div class="space-y-2">
                <h1 class="text-3xl font-bold">Режим работы: </h1>
                <p class="text-xl">Пн-Пт: 10:00 - 22:00</p>
                <p class="text-xl">Сб-Вс: 11:00 - 23:00</p>
            </div>
            <div class="space-y-2">
                <h1 class="text-3xl font-bold">Наши контакты:</h1>
                <p class="text-xl">+7 (999) 999-99-99</p>
                <p class="text-xl">+7 (999) 999-99-99</p>
                <p class="text-xl">+7 (999) 999-99-99</p>
            </div>
            <div class="space-y-2">
                <h1 class="text-3xl font-bold">Наши cоц. сети:</h1>
                <div class="flex items-center">
                    <a href="https://vk.com/burgerprime"><img class="cursor-pointer h-10 w-10" src="../static/img/vk_logo.png"></a>
                    <a href="https://vk.com/burgerprime" class="cursor-pointer text-xl ">Сообщество ВКонтакте</a>
                </div>
                <div class="flex pb-1 items-center">
                    <a href="https://vk.com/vkusniysnus"><img class="cursor-pointer h-10 w-10" src="../static/img/vk_logo.png"></a>
                    <a href="https://vk.com/vkusniysnus" class="cursor-pointer text-xl ">Администратор</a>
                </div>
                <div class="flex pl-2 items-center">
                    <a href="https://t.me/burgerprimerestraunt"><img class="cursor-pointer h-6 w-6" src="../static/img/tg_logo.png"></a>
                    <a href="https://t.me/burgerprimerestraunt" class="cursor-pointer text-xl ml-2">Канал в Telegram</a>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>