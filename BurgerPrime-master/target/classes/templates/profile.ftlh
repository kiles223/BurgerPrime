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
<body>
<header class="shadow-xl bg-zinc-400 w-full fixed top-0 z-50">
    <div class="flex justify-center px-4 py-3">

        <div class="flex-shrink-0 pr-110 pl-10">
            <a href="http://localhost:8080/"><img style="bottom: -1.1rem" class="hover:cursor-pointer absolute w-25 h-25 left-15" src="../static/img/logo.png" alt="Иконка"></a>
        </div>

        <div class="flex relative justify-center w-200 h-10 flex-1 mx-4">
            <input class="w-195 cursor-pointer h-10 absolute px-4 border rounded hover:border-stone-800" type="text" placeholder="Поиск товаров" />
            <button type="submit" class="border border-black hover:border-white cursor-pointer absolute ml-174 top-0 h-full px-4 bg-green-300 text-stone-800 rounded-lg">Нажать</button>
        </div>

        <div class="flex items-center space-x-2 flex-shrink-0 pl-95 pr-10">

            <p class="pt-1 text-xl"></p>
        </div>
    </div>
</header>
<main class="flex justify-center bg-stone-800 mt-15">
    <div class="w-430 h-300 bg-zinc-200">
        <div class="flex mt-10 justify-center space-x-10 w-full">
            <div>
                <div class="flex items-center justify-center h-50 w-50 rounded-[50%] border overflow-hidden">
                    <input type="image" value="" name="avatar" class="rounded-[50%] h-50 w-50 ">

                </div>
                <p class="text-3xl font-bold text-center mt-5">${account.name}</p>
            </div>
        </div>

        <p class="mt-10 mb-5 text-center text-3xl font-bold">История заказов</p>
        <hr class="border border-1 border-zinc-400 w-360 ml-35">
        <div class="flex justify-center mt-5 w-360 overflow-auto ml-35 space-x-20">
            <#list orders as order>
                <a href="http://localhost:8080/product/${order.getProduct().id}" class="cursor-pointer">
                    <div class="bg-zinc-200  h-full w-full rounded-xl border-4 border-zinc-400 border">
                        <div class="flex h-40 w-40 justify-center items-center rounded-lg bg-zinc-400">
                            <img class="h-40" src="/images/${order.getProduct().previewImageId}" alt="Иконка">
                        </div>
                        <p style="font-family: 'Ruthless Scetch', sans-serif" class="text-xl text-center mt-3 font-bold text-stone-800">${order.getProduct().name}</p>
                        <p style="font-family: 'Ruthless Scetch', sans-serif" class=" text-red-500 text-center text-xl font-bold">${order.getProduct().price}</p>
                        <p class=" text-stone-800 text-center pb-2 text-sm font-bold">${order.createdAt}</p>
                    </div>
                </a>
            </#list>
        </div>
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