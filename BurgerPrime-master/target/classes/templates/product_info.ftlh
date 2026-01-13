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
<body class="text-white bg-mainColor">
<header class="border-b border-white-500 bg-neutral-700 w-full fixed top-0 z-50">
    <div class="flex items-center justify-between px-4 py-3">

        <div class="flex-shrink-0 pr-110 pl-10">
            <a><span class="w-10 h-10"><img src="../static/img/ico.png" alt="Иконка"></span></a>
        </div>

        <div class="flex relative justify-center w-200 h-10 flex-1 mx-4">
            <input class="w-193 cursor-pointer h-10 absolute px-4 border rounded hover:border-stone-800" type="text" placeholder="Поиск товаров" />
            <button type="submit" class=" hover:bg-green-400 cursor-pointer absolute ml-174 top-0 h-full px-4 bg-green-300 text-stone-800 rounded-lg">Искать</button>
        </div>

        <div class="flex items-center space-x-2 flex-shrink-0 pl-95 pr-10">
            <p class="pt-1 text-xl"></p>
        </div>
    </div>
</header>
<main class="bg-[url('../static/img/info_bg.png')] h-400 text-stone-800">
    <h1 class="font-bold text-zinc-200 text-center pt-25 text-4xl">Информация о товаре</h1>
    <div class="w-400 ml-38 mt-7 rounded-lg border border-zinc-400 border-4 h-300 bg-zinc-200">
        <div class="flex h-125 w-250 ml-75 mt-10 space-x-5">
            <div class="relative w-250 h-124 overflow-hidden">
                <div class="flex">
                    <#list images as image>
                        <img src="/images/${image.id}" alt="image" class="h-125 w-125" />
                    </#list>
                </div>


            </div>
            <div class="ml-10 space-y-3">
                <p style="font-family: 'Ruthless Scetch', sans-serif" class="text-4xl font-bold">${product.name}</p>
                <p>⭐⭐⭐⭐⭐ (120 отзывов)</p>
                <p class="text-4xl font-bold text-red-500">${product.price} ₽</p>
                <p class="">Описание: ${product.description}</p>
                <form action="/order" method="post">
                    <input id="currentUrl" type="hidden" name="burgerID" value="">
                    <script>
                        document.addEventListener('DOMContentLoaded', () => {
                            let currentUrl = window.location.href;
                            let burgerIndex = currentUrl.indexOf('product/')
                            if (burgerIndex !== -1) {
                                let burgerId = currentUrl.substring(burgerIndex + 'product/'.length);
                                document.getElementById('currentUrl').value = parseInt(burgerId, 10);
                            }

                        });
                    </script>
                    <button type="submit" class="bg-green-300 font-bold hover:bg-green-400 cursor-pointer h-10 w-50 rounded-lg text-xl">Купить</button>
                </form>
                <p>Категория: ${product.category}</p>
                <p>Вес: ${product.weight}г</p>
            </div>
        </div>
        <h1 class="mt-15 text-center text-4xl">Отзывы</h1>
        <hr class="mt-5 border-zinc-400 border-1 center w-300 ml-50">
        <div class="w-full  mt-10">
            <h1 class="ml-60 font-bold text-2xl">Написать отзыв:</h1>
            <form class="mt-5 grid h-50" method="post" action="/feedback">
                <textarea name="feedback" class="ml-60 pl-2 w-200 cursor-pointer mb-1 border rounded" rows="5" cols="50" placeholder="Введите текст отзыва.."></textarea>
                <input type="hidden" name="rating" id="rating">
                <input id="currentUrl2" type="hidden" name="burgerID" value="">
                <script>
                    document.addEventListener('DOMContentLoaded', () => {
                        let currentUrl = window.location.href;
                        let burgerIndex = currentUrl.indexOf('product/')
                        if (burgerIndex !== -1) {
                            let burgerId = currentUrl.substring(burgerIndex + 'product/'.length);
                            document.getElementById('currentUrl2').value = parseInt(burgerId, 10);
                        }

                    });
                </script>
                <div class="flex ml-60 space-x-1 cursor-pointer" id="starRating">
                    <span data-value="1" class="text-gray-300 hover:text-yellow-400 transition-colors duration-200 text-4xl cursor-pointer">&#9733;</span>
                    <span data-value="2" class="text-gray-300 hover:text-yellow-400 transition-colors duration-200 text-4xl cursor-pointer">&#9733;</span>
                    <span data-value="3" class="text-gray-300 hover:text-yellow-400 transition-colors duration-200 text-4xl cursor-pointer">&#9733;</span>
                    <span data-value="4" class="text-gray-300 hover:text-yellow-400 transition-colors duration-200 text-4xl cursor-pointer">&#9733;</span>
                    <span data-value="5" class="text-gray-300 hover:text-yellow-400 transition-colors duration-200 text-4xl cursor-pointer">&#9733;</span>
                </div>

                <script>
                    const stars = document.querySelectorAll('#starRating span');
                    let currentRating = 0;

                    stars.forEach(star => {
                        star.addEventListener('mouseover', () => {
                            const val = parseInt(star.dataset.value);
                            stars.forEach(s => {
                                if (parseInt(s.dataset.value) <= val) {
                                    s.classList.add('text-yellow-400');
                                    s.classList.remove('text-gray-300');
                                } else {
                                    s.classList.remove('text-yellow-400');
                                    s.classList.add('text-gray-300');
                                }
                            });
                        });

                        star.addEventListener('mouseout', () => {
                            stars.forEach(s => {
                                if (parseInt(s.dataset.value) <= currentRating) {
                                    s.classList.add('text-yellow-400');
                                    s.classList.remove('text-gray-300');
                                } else {
                                    s.classList.remove('text-yellow-400');
                                    s.classList.add('text-gray-300');
                                }
                            });
                        });

                        star.addEventListener('click', () => {
                            currentRating = parseInt(star.dataset.value);
                            stars.forEach(s => {
                                if (parseInt(s.dataset.value) <= currentRating) {
                                    s.classList.add('text-yellow-400');
                                    s.classList.remove('text-gray-300');
                                    document.getElementById('rating').value = currentRating;
                                } else {
                                    s.classList.remove('text-yellow-400');
                                    s.classList.add('text-gray-300');
                                }
                            });
                        });
                    });
                </script>
                <button type="submit" class="ml-60 mt-3 bg-green-300 font-bold hover:bg-green-400 cursor-pointer h-10 w-50 rounded-lg text-xl">Отправить</button>
            </form>
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