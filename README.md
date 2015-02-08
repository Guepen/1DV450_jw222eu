# README

Projekt för kursen 1DV450 Webbramverk vid LNU våren 2015.

## Komma igång

*Jag förutsätter att Ruby, RubyGems samt Git är installerat och att man kan hantera Terminalen eller dylikt.*

1. Öppna Terminalen/kommandotolken. Gå till en bra mapp, `cd /någon/mapp/nånstans/`.
2. Klona repot med `git clone https://github.com/jwilsson/1DV450_jw222eu.git`.
3. Gå in i den nya mapp som Git skapar, `cd 1DV450_jw222eu`.
4. Kör `gem install bundle`.
5. Gå till den mapp där Rails-appen ligger och kör `bundle install`.
6. Kör `rake db:migrate` för att sätta upp databasen.
7. Starta en Rails-konsol med `rails c` och kör följande kommando för att skapa en ny admin-användare: `User.create(email: 'DIN EPOST', password: 'DITT LÖSENORD', name: 'DITT NAMN', is_admin: 1)`.
8. Gå ur Rails-konslen med `exit`.
9. Följ stegen i **Skapa en "Rails secret"** nedan.
9. Kör `rails s` för att starta en lokal server. Se **Digital Ocean** nedan om du kör där.
10. Gå till den adress där Rails säger att den kör och börja använd applikationen!

*Ger något kommando ett felmeddelande som nämner "permissions", prova igen med `sudo <kommando>`.*

## Skapa en "Rails secret"
1. Skapa en fil som heter `secrets.yml` i mappen `config`.
2. Lägg in följande i denna fil:
    ```
    development:
      secret_key_base:
    ```
    
3. Kör `rake secret` och kopiera värdet och lägg in efter `secret_key_base`.

### Digital Ocean
Om du använder en Droplet från guiden på [kurshemsidan](https://coursepress.lnu.se/kurs/webbramverk/publicering-av-applikation/) och använder Unicorn från deras guide behöver du
ändra `working_directory` som beskrivs [där](https://www.digitalocean.com/community/tutorials/how-to-use-the-1-click-ruby-on-rails-on-ubuntu-14-04-image#unicorn) till den mapp dit du klonade detta repo.

Du kan självklart också stoppa Unicorn med `service unicorn stop` och istället köra Rails inbyggda server med `rails s -b <SERVERNS IP>`.

#### Problem hos Digital Ocean
Efter att ha kört `bundle install` kan du få ett fel i stil med:

```
An error occurred while installing nokogiri (1.6.5), and Bundler cannot continue.
Make sure that `gem install nokogiri -v '1.6.5'` succeeds before bundling.
```

Jag löste det genom den metod som felmeddelandet tipsar om:

```
bundle config build.nokogiri --use-system-libraries
bundle install
```

Du kan också få problem med gem `sqlite3`. Jag löste det genom att helt enkelt installera det och sedan köra `bundle install` igen, exempelvis:

```
gem install sqlite3
bundle install
```

Dessa fel har jag dock bara råkat ut för på Digital Ocean.
