defmodule MicrocreditService.Repo.Migrations.PutClients do
  use Ecto.Migration
  alias MicrocreditService.Repo
  alias MicrocreditService.Client

  def change do
    %Client{
      last_name: "Алексеева",
      first_name: "Розина",
      path_name: "Федоровна",
      gender: "w",
      date: "10 марта 1985",
      postcode: "627355",
      city: "Партизанское",
      street: "Герцена",
      house: 73,
      apartment: 256,
      phone: "8-978-452-67-97",
      login: "AlekseevaRozina302",
      password: "0xw2c9hX8tv0",
      blacklist: false,
      userpic: "http://randus.ru/avatars/w/myAvatar14.png"
    } |> Repo.insert!

    %Client{
      last_name: "Кочеткова",
      first_name: "Лукерья",
      path_name: "Эдуардовна",
      gender: "w",
      date: "14 апреля 1979",
      postcode: "144700",
      city: "Новоржев",
      street: "Садовая",
      house: 42,
      apartment: 43,
      phone: "8-933-679-31-48",
      login: "KochetkovaLukerya297",
      password: "VgvZnnTAHYBg",
      blacklist: false,
      userpic: "http://randus.ru/avatars/w/myAvatar12.png"
    } |> Repo.insert!

    %Client{
      last_name: "Карпов",
      first_name: "Самсон",
      path_name: "Викторович",
      gender: "m",
      date: "19 августа 1976",
      postcode: "453402",
      city: "Невельск",
      street: "Авиаторов",
      house: 53,
      apartment: 183,
      phone: "8-954-421-87-69",
      login: "KarpovSamson305",
      password: "ZETPxy6Afg6Z",
      blacklist: false,
      userpic: "http://randus.ru/avatars/m/myAvatar14.png"
    } |> Repo.insert!

    %Client{
      last_name: "Дмитриев",
      first_name: "Иларион",
      path_name: "Давидович",
      gender: "m",
      date: "5 января 1969",
      postcode: "164583",
      city: "Палех",
      street: "Пушкина",
      house: 13,
      apartment: 45,
      phone: "8-914-511-46-16",
      login: "DmitrievIlarion290",
      password: "qMqlXtRAQhdD",
      blacklist: false,
      userpic: "http://randus.ru/avatars/m/myAvatar11.png"
    } |> Repo.insert!

    %Client{
      last_name: "Городнов",
      first_name: "Соломон",
      path_name: "Юрьевич",
      gender: "m",
      date: "27 февраля 1987",
      postcode: "353521",
      city: "Верх-Чебула",
      street: "Театральная",
      house: 11,
      apartment: 46,
      phone: "8-903-522-89-86",
      login: "GorodnovSolomon65",
      password: "5s80HcHsJZ6f",
      blacklist: false,
      userpic: "http://randus.ru/avatars/m/myAvatar7.png"
    } |> Repo.insert!

    %Client{
      last_name: "Давыдов",
      first_name: "Ипполит",
      path_name: "Денисович",
      gender: "m",
      date: "26 ноября 1974",
      postcode: "683018",
      city: "Мыски",
      street: "Айвазовского",
      house: 56,
      apartment: 207,
      phone: "8-948-546-28-96",
      login: "DavyidovIppolit55",
      password: "J7pEWaCagbBw",
      blacklist: false,
      userpic: "http://randus.ru/avatars/m/myAvatar2.png"
    } |> Repo.insert!

    %Client{
      last_name: "Васютин",
      first_name: "Евсей",
      path_name: "Святославович",
      gender: "m",
      date: "3 октября 1986",
      postcode: "665225",
      city: "Солнечная Долина",
      street: "Авиамоторная улица",
      house: 24,
      apartment: 298,
      phone: "8-924-587-33-38",
      login: "VasyutinEvsey17",
      password: "WJo1vV1xMLOS",
      blacklist: false,
      userpic: "http://randus.ru/avatars/m/myAvatar8.png"
    } |> Repo.insert!

    %Client{
      last_name: "Куколевская",
      first_name: "Жанна",
      path_name: "Викторовна",
      gender: "w",
      date: "28 марта 1990",
      postcode: "172461",
      city: "Кунгур",
      street: "Александра Завидова",
      house: 15,
      apartment: 160,
      phone: "8-946-240-75-14",
      login: "KukolevskayaJanna357",
      password: "IndnObxcY7IM",
      blacklist: false,
      userpic: "http://randus.ru/avatars/w/myAvatar20.png"
    } |> Repo.insert!

    %Client{
      last_name: "Кравченко",
      first_name: "Серафим",
      path_name: "Алексеевич",
      gender: "m",
      date: "21 июня 1969",
      postcode: "659540",
      city: "Приозерск",
      street: "Барвихинская",
      house: 80,
      apartment: 245,
      phone: "8-913-573-31-31",
      login: "KravchenkoSerafim343",
      password: "UvYiFgiEjkj2",
      blacklist: false,
      userpic: "http://randus.ru/avatars/m/myAvatar15.png"
    } |> Repo.insert!

    %Client{
      last_name: "Львов",
      first_name: "Назар",
      path_name: "Максимович",
      gender: "m",
      date: "25 октября 1980",
      postcode: "461160",
      city: "Венгерово",
      street: "Строителей",
      house: 11,
      apartment: 294,
      phone: "8-915-167-21-88",
      login: "LvovNazar164",
      password: "NtLpBdf3uQI8",
      blacklist: true,
      userpic: "http://randus.ru/avatars/m/myAvatar12.png"
    } |> Repo.insert!

    %Client{
      last_name: "Журавель",
      first_name: "Лада",
      path_name: "Ивановна",
      gender: "w",
      date: "13 декабря 1985",
      postcode: "433365",
      city: "Оренбург",
      street: "Лидии Базановой",
      house: 92,
      apartment: 291,
      phone: "8-935-356-89-63",
      login: "JuravelLada230",
      password: "Jnd3KiaWfrK1",
      blacklist: true,
      userpic: "http://randus.ru/avatars/w/myAvatar21.png"
    } |> Repo.insert!

  end
end
