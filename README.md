# GitCommunity
Git Commonity - приложение для просмотра фолловеров на гит хабе обладающеее функциональностью для просмотра веб страницы пользователя
и его фолловеров также позволяет добавлять пользователей в список фолловеров
<div align="center">
<img src="https://github.com/Maximercurius/GitCommunity/blob/main/Screen%20Shots/GCFollowers%201.png" width="300px"/>
<img src="https://github.com/Maximercurius/GitCommunity/blob/main/Screen%20Shots/GCFollowers%202.png" width="300px"/>
<img src="https://github.com/Maximercurius/GitCommunity/blob/main/Screen%20Shots/GCFollowers%203.png" width="300px"/>
<img src="https://github.com/Maximercurius/GitCommunity/blob/main/Screen%20Shots/GC%20Followers%204.png" width="300px"/>
<img src="https://github.com/Maximercurius/GitCommunity/blob/main/Screen%20Shots/GC%20Followers%205.png" width="300px"/>
<img src="https://github.com/Maximercurius/GitCommunity/blob/main/Screen%20Shots/GC%20Followers%206.png" width="300px"/>  
</div>

### О проекте:
Технологический стек: UIKit, MVC + N Architechure, NetworkLayer with GitHub API, safariServices,DiffableDataSource 
верстка UI только кодом, не использовано никаких сторонних библиотек

Возможности приложения:
- Просмотр профиля пользователя как в приложении так и в сети
- Добавлять фолловеров
- Просмотр фолловеров
- Прогрузка стаистики со страницы пользователя

### Решенные кейсы во время разработки приложения:
- Смещение фото пользователя за границы ячейки при переходе версии с 13 на 15
- Некорректное отображение даты(формат сервера приведен к более читаемому пользовательскому)
- Исправление дефолтных уведомлений об ошибках на кастомные
- Потребовался рефакторинг кода для выстраивания логики кода в работе экранов и запросов в сеть
- Наложение экранов при переходе из поиска к списку фолловеров
- Изменение положения клавиатуры и списка пользователей при работе с экранами 5S и с приближенным режимом на iPhone 8
