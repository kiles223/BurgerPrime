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
    <body class="lg:bg-[url(../static/img/login_bg.png)] bg-no-repeat h-full">
        <main class="flex justify-center items-center md:mb-40 lg:mb-27 w-full h-full  mb-27">
                <div class="bg-zinc-200 w-90 md:w-150 lg:w-200 h-155 md:h-200 md:h-150 mt-5 md:mt-10 xl:w-150 mr-0.5 rounded-xl">
                    <form class="flex grid" method="post" action="/login">
                        <div class="w-full h-full flex justify-center pt-5 lg:pt-10 pb-5">
                            <img class="w-[25%] md:w-[20%] " src="../static/img/alt_logo.png">
                        </div>
                        <h1 class="text-[200%] md:text-[300%] text-center font-bold">Вход</h1>
                        <div class="mt-10">
                            <div class="flex justify-center w-full h-20 lg:h-30 items-center">
                                <input class="border-b-2 lg:text-[100%] w-[70%] h-[50%] lg:h-[50%] pl-3" name="name" placeholder="Введите имя">
                            </div>
                            <div class="flex justify-center w-full h-20 lg:h-30 items-center">
                                <input class="border-b-2 lg:text-[100%] w-[70%] h-[50%] lg:h-[50%] pl-3" name="password" placeholder="Введите пароль">
                            </div>
                            <div class="flex justify-center w-full h-30 items-center">
                                <button type="submit" class="cursor-pointer h-[40%] w-[70%] bg-green-300 text-[100%] md:text-[200%] rounded-xl font-bold">Войти</button>
                            </div>
                            <p class=" font-bold text-center mt-5">Если еще не зарегистрированны:<a href="/registration" class="text-[#34a615] hover:cursor-pointer"> Войти</a></p>
                            <p class=" font-bold text-center mt-2">Есть вопросы? <a class="text-[#34a615] hover:cursor-pointer" href="https://vk.com/im?entrypoint=community_page&media=&sel=-235216715">Задать</a></p>
                        </div>

                    </form>
                </div>
        </main>
        <footer class="bg-zinc-200 w-full h-full pb-5 pt-5 md:pb-10">
            <div class="space-x-3 h-full w-full ">
                <div class="flex justify-center items-center w-full pb-5 md:pb-10 lg:pb-15 md:pt-10 lg:pt-15 space-x-[2%]">
                    <img class="w-[10%] " src="../static/img/alt_logo.png">
                    <input class="w-[60%] h-6 md:h-8 lg:h-10 rounded-xl border">
                    <button class="flex justify-center items-center cursor-pointer w-[15%] text-[45%] md:text-[80%] lg:text-[120%] h-6 md:h-8 lg:h-10 bg-green-300 rounded-xl">Отправить</button>
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