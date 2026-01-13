<!DOCTYPE html>
<html lang="en">
<head>
    <head>
        <meta charset="UTF-8" />
        <link rel="icon" href="../static/img/favicon.ico" type="image/x-icon">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
        <title>BurgerPrime</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
</head>
<body class="bg-mainColor text-white bg-zinc-300 w-full">
    <header class="border-b border-white-500 bg-neutral-700 w-full fixed top-0 z-50">
        <div class="flex items-center justify-between px-4 py-3">

            <div class="flex-shrink-0 pr-110 pl-10">
                <a><span class="w-10 h-10"><img src="../static/img/ico.png" alt="Иконка"></span></a>
            </div>

            <div class="flex relative justify-center w-200 h-10 flex-1 mx-4">
                <input class="w-195 cursor-pointer h-10 absolute px-4 border rounded hover:border-stone-800" type="text" placeholder="Поиск товаров" />
                <button type="submit" class="border border-black hover:border-white cursor-pointer absolute ml-174 top-0 h-full px-4 bg-green-300 text-stone-800 rounded-lg">Нажать</button>
            </div>

            <div class="flex items-center space-x-2 flex-shrink-0 pl-95 pr-10">
                <p class="pt-1 text-xl">Admin</p>
            </div>
        </div>
    </header>
    <main class="flex justify-center items-center w-full mx-auto pt-40">
        <div class="w-350 h-140">
            <form action="/add/product" enctype="multipart/form-data" method="post" class="grid grid-cols-2 bg-neutral-700 w-350 h-130 border border-white border-b border-1 rounded-lg">
                <div class="flex flex-col p-4 space-y-2">
                    <p class="text-2xl text-center">ДОБАВИТЬ ПРОДУКТ</p>
                    <p class="text-xl">Название товара</p>
                    <input name="name" class="pl-2 w-160 mb-1 cursor-pointer border rounded hover:border-stone-800" type="text" placeholder="Название" />

                    <p class="text-xl">Описание</p>
                    <textarea name="description" class="pl-2 w-160 cursor-pointer mb-1 border rounded hover:border-stone-800" rows="5" cols="50" placeholder="Вкус, состав, бжу и тд."></textarea>

                    <p class="text-xl">Категория товара</p>
                    <select name="category" class="text-center cursor-pointer w-80 mb-1 border rounded hover:border-stone-800">
                        <option class="text-black">Основное блюдо</option>
                        <option class="text-black">Дополнительное блюдо</option>
                        <option class="text-black">Напиток</option>
                    </select>



                    <p class="text-xl">Цена</p>
                    <input name="price" class="pl-2 w-160 mt-1 border cursor-pointer rounded hover:border-stone-800" type="number" placeholder="Цена в рублях" />
                    <input name="weight" class="pl-2 w-160 mt-1 border cursor-pointer rounded hover:border-stone-800" type="number" placeholder="Вес в граммах" />>
                    <br>
                </div>

                <div class="flex flex-col items-center justify-start p-4 space-y-2">
                    <p class="text-2xl">ЗАГРУЗИТЬ ИЗОБРАЖЕНИЯ</p>
                    <input name="file1" class="border border-black hover:border-white mt-1 w-70 text-stone-800 cursor-pointer bg-green-300 border border-black rounded" type="file" accept=".png, .jpeg .jpg"/>
                    <input name="file2" class="border border-black hover:border-white mt-1 w-70 text-stone-800 cursor-pointer bg-green-300 border border-black rounded" type="file" accept=".png, .jpeg .jpg"/>
                    <input name="file3" class="border border-black hover:border-white mt-1 w-70 text-stone-800 cursor-pointer bg-green-300 border border-black rounded" type="file" accept=".png, .jpeg .jpg"/>


                </div>
                <button type="submit" class=" mb-5 mr-40 cursor-pointer w-100 bg-green-300 text-stone-800 rounded-lg border border-black hover:border-white ml-auto">Добавить</button>
            </form>
            <a class="flex w-100 text-center justify-center  bg-green-300 hover:border-white ml-125 text-stone-800 rounded border" href="http://localhost:8080/">На главную</a>
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