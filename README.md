# Microcredit Service

### Пример CRUD приложения.

Используемые технологии:
- [Elixir](https://elixir-lang.org/)
- [Phoenix Framework](http://www.phoenixframework.org/)
- [Ecto](https://hex.pm/packages/phoenix_ecto/3.0.1)
- [HTTPotion](https://github.com/myfreeweb/httpotion)
- [Poison](https://github.com/devinus/poison)
- [Timex](https://github.com/bitwalker/timex)
- [PostgreSQL](https://www.postgresql.org/)
- [Bootstrap Material](http://fezvrasta.github.io/bootstrap-material-design/)

#### Запуск
```sh
mix deps.get
mix ecto.create  
mix ecto.migrate
mix phoenix.server
```

Открыть [`localhost:4000`](http://localhost:4000)


![Main_page](https://github.com/kkozlovsky/microcredit_service/blob/master/docs/clients.png)


#### ER-модель
![ER-модель](https://github.com/kkozlovsky/microcredit_service/blob/master/docs/ER_diagram.png)

#### ***Дополнительные условия:***
* Отклонять заявку, если она клиент в чёрного списке
* Необходимо определить IP клиента
* Отклонять заявки с одного IP, если прошло меньше минуты
* Возможность генерировать случайного пользователя