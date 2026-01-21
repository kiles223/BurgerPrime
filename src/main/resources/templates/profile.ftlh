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
<body class="bg-zinc-200">
<header class="flex justify-center items-center shadow-xl bg-zinc-400 w-full h-15 fixed top-0 z-50">
    <a href="http://192.168.0.101:8080/"><img class="h-10 absolute left-[5%] top-[17%]" src="../static/img/alt_logo.png"></a>
    <div class="flex relative items-center lg:w-[35%] w-[50%] h-full ">
        <form class="flex items-center h-full w-full">
            <input class="w-full h-[50%] bg-white border border-black rounded-xl text-stone-800 pl-2">
            <button class="absolute lg:w-[13%] lg:w-[10%] w-[40%] h-[50%] bg-green-300 right-0 rounded-xl border border-black text-stone-800 font-bold">Найти</button>
        </form>
    </div>
    <div class="flex items-center justify-center absolute overflow-hidden rounded-[50%] h-10 w-10 right-[5%] top-[17%] bg-white">
        <a href="http://192.168.0.101:8080/profile">
            <#if account.avatarId??>
                <img class="h-10" src="/images/${account.avatarId}" alt="">
            </#if>
        </a>
    </div>
</header>
<main class="h-full w-full min-h-screen pt-30">
    <div class="grid w-full h-[30%]">
        <div class="flex justify-center w-full h-full">
            <div class="relative">
                <button id="form_btn" class="flex justify-center bg-white items-center z-20 absolute w-40 h-40 rounded-[50%] cursor-pointer overflow-hidden">
                    <#if account.avatarId??>
                        <img id="ava" class="h-full w-full" src="/images/${account.avatarId}" alt="">
                        <#else>
                        <img id="alt_ava" class="h-full w-full" src="../static/img/alt_logo.png" alt="">
                    </#if>
                </button>
                <form class="grid h-full w-40" method="post" action="/profile/edit_avatar" enctype="multipart/form-data">
                    <div class="relative h-40 w-40 rounded-[50%] border overflow-hidden">
                        <input id="getFile" class="absolute hidden h-full w-full cursor-pointer z-10" name="file" accept=".png, .jpeg .jpg" type="file">
                    </div>
                    <div class="w-full flex justify-center">
                        <button id="change_avatar_btn" class="h-10 hidden w-30 mt-3 rounded-xl bg-green-300 cursor-pointer ml-20" type="submit">Изменить</button>
                    </div>
                </form>
                <button id="close" style="left: -2.6rem" class="absolute hidden top-40  h-10 w-30 mt-3 rounded-xl bg-red-400 cursor-pointer" type="reset">Закрыть</button>
            </div>
            <script src="../static/js/add_avatar.js"></script>
        </div>
        <div id="name" class="flex justify-center items-center space-x-2 ml-5 ">
            <p class="text-center text-[200%]">${account.name}</p>
            <button id="edit_name"><img class="h-5 cursor-pointer" src="../static/img/pencil.png"></button>
        </div>
        <form id="edit_name_form" class="flex justify-center items-center hidden w-full space-x-2 mt-5" method="post" action="/profile/edit_name">
            <input name="new_name" class="w-[60%] h-7 border rounded-xl pl-2" type="text" value="${account.name}">
            <button class=" w-[30%] h-7 bg-green-300 rounded-xl" type="submit">Сохранить</button>
        </form>
        <script>
            const name = document.getElementById('name');
            const edit_name_btn = document.getElementById('edit_name');
            const edit_name_form = document.getElementById('edit_name_form');
            edit_name_btn.addEventListener('click', function() {
                if (edit_name_form.style.display === 'flex') {
                    edit_name_form.style.display = 'none';
                }
                else{
                    edit_name_form.style.display = 'flex';
                    name.style.display = 'none';
                }
            });
        </script>
        <div class="mt-10 space-y-5 pb-10">
            <div class="flex justify-center w-full h-50">
                <div class="flex items-start justify-center w-[90%] h-full bg-zinc-300 rounded-xl pt-5">
                    <a href="">
                        <p class="text-[120%]">Нынешний заказ</p>
                    </a>
                </div>
            </div>
            <div class="flex justify-center w-full h-30">
                <div class="flex items-center justify-center w-[90%] h-full bg-zinc-300 rounded-xl">
                    <div>
                        <p class="text-[100%] text-center">Колличество сьеденных каллорий:</p>
                        <p class="text-[200%] text-center text-red-500 font-bold">${kkal}</p>
                    </div>
                </div>
            </div>
            <div class="flex justify-center w-full h-20">
                <div class="flex items-center justify-center w-[90%] h-full bg-zinc-300 rounded-xl">
                    <a href="">
                        <p class="text-[120%]">Ваши заказы</p>
                    </a>
                </div>
            </div>
            <div class="flex justify-center w-full h-20">
                <div class="flex items-center justify-center w-[90%] h-full bg-zinc-300 rounded-xl">
                    <a href="">
                        <p class="text-[120%]">Ваши отзывы</p>
                    </a>
                </div>
            </div>
            <div class="flex justify-center w-full h-10">
                <div class="flex items-center justify-center w-[80%] h-full bg-red-500 rounded-xl">
                    <a href="/logout">
                        <div class="flex justify-center items-center space-x-2 ">
                            <p class="text-[120%] text-stone-800 font-bold">Выйти</p>
                            <img class="h-5" src="../static/img/exit.png">
                        </div>
                    </a>
                </div>
            </div>
        </div>

    </div>
</main>
</body>
</html>