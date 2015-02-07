# README

Projekt för kursen 1DV450 Webbramverk vid LNU våren 2015.

## Komma igång

*Jag förutsätter att Ruby, RubyGems samt Git är installerat och att man kan hantera Terminalen eller dylikt.*

1. Öppna Terminalen/kommandotolken. Gå till en bra mapp, `cd /någon/mapp/nånstans/`.
2. Klona repot med `git clone git@github.com:jwilsson/1DV450_jw222eu.git`.
3. Gå in i den nya mapp som Git skapar, `cd 1DV450_jw222eu`.
4. Kör `gem install bundle`.
5. Gå till den mapp där Rails-appen ligger och kör `bundle install`.
6. Kör `rake db:migrate` för att sätta upp databasen.
7. Starta en Rails-konsol med `rails c` och kör följande kommando för att skapa en ny admin-användare: `User.create(email: 'DIN EPOST', password: 'DITT LÖSENORD', is_admin: 1)`.
8. Kör `rails s` för att starta en lokal server.
9. Gå till den adress där Rails säger att den kör och börja använd applikationen!

*Ger något kommando ett felmeddelande som nämner "permissions", prova igen med `sudo <kommando>`.*
