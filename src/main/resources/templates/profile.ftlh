<!DOCTYPE html>
<html lang="ru">
    <head>
        <meta charset="UTF-8">
        <title>Профиль</title>
        <link rel="icon" href="static/img/alt_logo 1.png">
        <base href="${springMacroRequestContext.contextPath}/">
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
            <img class="" src="/static/img/alt_logo 1.png">
            <p class="text-[20px] text-white"><a href="">BurgerPrime</a></p>
        </header>
        <main class="flex justify-center bg-[#FFF9EE] h-full min-h-screen w-full pt-15 pb-45">
            <div class="w-[361px] h-full">
                <div class="w-full">
                    <div class="flex justify-center w-full">
                        <div class="flex justify-center items-center mt-[64px] bg-grey-300 h-[130px] w-[130px] rounded-[50%] overflow-hidden">
                            <#if accountInformation.avatar??>
                                <button class="bg-white flex justify-center items-center cursor-pointer overflow-hidden h-full w-full" id="add-avatar"><img class="" src="/images/${accountInformation.avatar.id}"></button>
                            <#else>
                                <button class="bg-white justify-center items-center cursor-pointer overflow-hidden h-full w-full" id="add-avatar"></button>
                            </#if>
                        </div>
                    </div>
                    <div id="avatar-form" class="flex justify-center items-center mt-[16px] hidden w-full">
                        <form enctype="multipart/form-data" action="profile/edit_avatar" method="post">
                            <input id="avatar-input" accept="image/png, image/jpeg, image/jpg" class="hidden" type="file" name="file">
                            <button class="bg-[#1D342C] w-[126px] h-[46px] text-white rounded-[8px] text-[18px] ml-[117px] cursor-pointer">Сохранить</button>
                        </form>
                    </div>
                    <script src="../static/js/add_avatar.js"></script>
                    <p style="font-family: 'MontserratAlternates-Bold';" class="text-center text-[20px] mt-[16px] text-[#D5552E]">${accountInformation.displayed_name}</p>
                    <div class="w-full flex justify-center">
                        <div class="w-[300px] flex justify-between mt-[16px] space-x-[16px]">
                            <a href="profile/datas">
                                <div>
                                    <div class="w-full flex justify-center mb-[8px]">
                                        <img src="../static/img/datas.png" alt="">
                                    </div>
                                    <p class="text-[18px]" style="font-family: 'MontserratAlternates-SemiBold';">Ваши данные</p>
                                </div>
                            </a>
                            <a href="profile/settings">
                                <div>
                                    <div class="w-full flex justify-center mb-[8px]">
                                        <img src="../static/img/settings.png" alt="">
                                    </div>
                                    <p class="text-[18px]" style="font-family: 'MontserratAlternates-SemiBold';">Настройки</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="grid w-full mt-[16px] space-y-[16px]">
                        <#if account.getRoleString() == "[ADMIN]">
                            <a href="admin/users">
                                <div class="flex justify-between items-center px-[16px] bg-[#1D342C] w-full h-[57px] rounded-[24px] shadow-lg">
                                    <p style="font-family: 'MontserratAlternates-Bold';" class="text-[18px] text-[#FFFFFF]">Админ панель</p>
                                    <img src="../static/img/arrow.png" alt="">
                                </div>
                            </a>
                        </#if>
                        <a href="orders">
                            <div class="flex justify-between items-center px-[16px] bg-[#F0E4CB] w-full h-[57px] rounded-[24px] shadow-lg">
                                <p style="font-family: 'MontserratAlternates-Bold';" class="text-[18px] text-[#D5552E]">Ваши заказы</p>
                                <img src="../static/img/alt_arrow.png" alt="">
                            </div>
                        </a>
                        <a href="https://vk.ru/im/convo/-235216715?entrypoint=community_page&tab=all">
                            <div class="flex justify-between items-center px-[16px] bg-[#F0E4CB] w-full h-[57px] rounded-[24px] shadow-lg">
                                <p style="font-family: 'MontserratAlternates-Bold';" class="text-[18px] text-[#D5552E]">Нужна помощь?</p>
                                <img src="../static/img/alt_arrow.png" alt="">
                            </div>
                        </a>
                        <a href="feedback">
                            <div class="flex justify-between items-center px-[16px] bg-[#F0E4CB] w-full h-[57px] rounded-[24px] shadow-lg">
                                <p style="font-family: 'MontserratAlternates-Bold';" class="text-[18px] text-[#D5552E]">Оценить сайт</p>
                                <img src="../static/img/alt_arrow.png" alt="">
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </main>
        <div class="flex justify-around items-center w-full h-15 bg-[#F0E4CB] fixed bottom-0 rounded-t-[16px] shadow-xl">
            <a href=""><img src="/static/img/main.png" alt=""></a>
            <a href="menu"><img src="/static/img/menu.png" alt=""></a>
            <a href="basket"><img src="/static/img/basket.png" alt=""></a>
            <a href="profile"><img src="/static/img/profile_active.png" alt=""></a>
        </div>
    </body>
</html>