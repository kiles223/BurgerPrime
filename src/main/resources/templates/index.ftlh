<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <link rel="icon" href="../static/img/favicon.ico" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <title>BurgerPrime</title>
    <style>
        @font-face {
            font-family: 'Lato';
            src: url("../static/fonts/Lato-Regular.ttf") format("truetype");
        }
        @font-face {
            font-family: 'Montserrat';
            src: url("../static/fonts/Montserrat-Regular.ttf") format("truetype");
        }
        @font-face {
            font-family: 'Ruthless Scetch';
            src: url("../static/fonts/Italic-BurgerName.ttf") format("truetype");
        }
        body {
            font-family: 'Montserrat', sans-serif;
        }
    </style>
</head>
<body class="text-white">
<header class="flex justify-center items-center shadow-xl bg-zinc-400 w-full h-15 fixed top-0 z-50">

    <a href="http://192.168.0.101:8080/"><img class="h-10 absolute left-[5%] top-[17%]" src="../static/img/alt_logo.png"></a>
    <div class="flex relative items-center lg:w-[35%] w-[50%] h-full ">
        <form class="flex items-center h-full w-full">
            <input class="w-full h-[50%] bg-white border border-black rounded-xl text-stone-800 pl-2">
            <button class="absolute lg:w-[13%] lg:w-[10%] w-[40%] h-[47%] bg-green-300 right-0 rounded-xl text-stone-800 font-bold">Найти</button>
        </form>
    </div>

    <a id="login" class="absolute right-[5%]" href="http://192.168.0.101:8080/login">Войти</a>

</header>
<main class="w-full h-full min-h-screen pb-10 bg-zinc-200">
    <div class="grid px-auto xl:grid-cols-4 md:grid-cols-2 grid-cols-1 gap-y-10 w-full pt-20 lg:pt-35 h-full">
        <#list products as product>
        <a href="http://192.168.0.101:8080/product/${product.id}" class="cursor-pointer">
            <div class="h-110 w-80 bg-zinc-400 rounded-xl mx-auto">
                <div class="flex justify-center items-center h-55 w-full">
                    <img class="h-full" src="/images/${product.previewImageId}">
                </div>
                <div class="h-[40%] w-full pl-5">
                    <p style="font-family: 'Ruthless Scetch', sans-serif;" class="text-[200%] text-stone-800 font-bold">${product.name}</p>
                    <p class="text-stone-800 text-[100%]">${product.description}</p>
                    <p style="font-family: 'Ruthless Scetch', sans-serif" class=" mt-3 text-red-500 text-[200%] font-bold">${product.price}₽</p>
                </div>
            </div>
        </a>
        </#list>
    </div>
</main>
<footer class="bg-zinc-400 w-full h-full pb-5 pt-5 md:pb-10">
    <div class="space-x-3 h-full w-full ">
        <div class="flex justify-center items-center w-full pb-5 md:pb-10 lg:pb-15 md:pt-10 lg:pt-15 space-x-[2%]">
            <img class="w-[10%] " src="../static/img/alt_logo.png">
            <input class="w-[60%] h-6 md:h-8 lg:h-10 rounded-xl border">
            <button class="flex justify-center items-center cursor-pointer w-[15%] text-[50%] md:text-[80%] lg:text-[120%] h-6 md:h-8 lg:h-10 bg-green-300 rounded-xl text-stone-800 font-bold">Отправить</button>
        </div>
        <div class="flex justify-center">
            <hr class="w-[80%]">
        </div>

        <div class="flex justify-around w-full h-[60%] text-[70%] md:text-[120%] lg:text-[150%] pt-5 md:pt-10 lg:pt-15 lg:pb-5 ">

            <div>
                <h1 class="text-[100%] font-bold">Режим работы: </h1>
                <p class="">Пн-Пт: 10:00 - 22:00</p>
                <p class="">Сб-Вс: 11:00 - 23:00</p>
            </div>
            <div>
                <h1 class="font-bold">Наши контакты:</h1>
                <p class="">+7 (999) 999-99-99</p>
                <p class="">+7 (999) 999-99-99</p>
                <p class="">+7 (999) 999-99-99</p>
            </div>
            <div>
                <h1 class="font-bold">Наши cоц. сети:</h1>
                <div class="flex items-center">
                    <a href="https://vk.com/burgerprime"><img class="cursor-pointer h-3 lg:h-10" src="../static/img/vk_logo.png"></a>
                    <a href="https://vk.com/burgerprime" class="cursor-pointer">Сообщество ВКонтакте</a>
                </div>
                <div class="flex pb-1 items-center">
                    <a href="https://vk.com/vkusniysnus"><img class="cursor-pointer h-3 lg:h-10" src="../static/img/vk_logo.png"></a>
                    <a href="https://vk.com/vkusniysnus" class="cursor-pointer  ">Администратор</a>
                </div>
                <div class="flex items-center ml-0.5 lg:ml-2 lg:space-x-2">
                    <a href="https://t.me/burgerprimerestraunt"><img class="cursor-pointer h-2.5 lg:h-6 " src="../static/img/tg_logo.png"></a>
                    <a href="https://t.me/burgerprimerestraunt" class="cursor-pointer ">Канал в Telegram</a>
                </div>
            </div>
        </div>
    </div>
</footer>
</body>
</html>