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
    <#list orders as order>
        <p class="text-center">Заказ номер: ${order.id}</p>
        <#list order.getProducts() as product>
            <p class="text-center">${product.name} ${product.price}₽</p>
        </#list>
        <p class="text-center">Итого: ${order.totalPrice()}₽</p>
        <hr>
    </#list>
</main>


</body>
</html>