<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <link rel="icon" href="../static/img/favicon.ico" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
    <title>Login</title>
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
<body class="lg:bg-[url(../static/img/login_bg.png)] bg-[url(../static/img/login_bg_for_mobile.png)] bg-no-repeat h-screen">
<main class="flex justify-center items-center w-full h-screen  ">
    <div class="bg-zinc-200/90 w-90 md:w-150 lg:w-200 h-155 md:h-200 md:h-150 md:mt-10 xl:w-150 mr-0.5 rounded-xl">
        <form class="flex grid" method="post" action="/registration">
            <div class="w-full h-full flex justify-center pt-5 lg:pt-10 pb-5">
                <img class="w-[25%] md:w-[20%] " src="../static/img/alt_logo.png">
            </div>
            <h1 class="text-[200%] md:text-[300%] text-center font-bold">Регистрация</h1>
            <div class="mt-10">
                <div class="flex justify-center w-full h-20 lg:h-30 items-center">
                    <input class="border-b-2 lg:text-[100%] w-[70%] h-[50%] lg:h-[50%] pl-3" type="text" name="name" placeholder="Введите имя">
                </div>
                <div class="flex justify-center w-full h-20 lg:h-30 items-center">
                    <input class="border-b-2 lg:text-[100%] w-[70%] h-[50%] lg:h-[50%] pl-3" type="password" name="password" placeholder="Введите пароль">
                </div>
                <div class="flex justify-center w-full h-30 items-center">
                    <button type="submit" class="cursor-pointer h-[40%] w-[70%] bg-green-300 text-[100%] md:text-[200%] rounded-xl font-bold">Зарегистрироваться</button>
                </div>
                <p class=" font-bold text-center mt-5">Если уже зарегистрированны:<a href="/login" class="text-[#34a615] hover:cursor-pointer"> Вход</a></p>
                <p class=" font-bold text-center mt-2">Есть вопросы? <a class="text-[#34a615] hover:cursor-pointer" href="https://vk.com/im?entrypoint=community_page&media=&sel=-235216715">Задать</a></p>
            </div>
        </form>
    </div>
</main>
</body>
</html>