# disposable-browser
Czysta, jednorazowa przeglądarka Chromium w kontenerze Docker (do testów, bezpiecznego otwierania linków).
Brak wolumenów = po zakończeniu nic nie zostaje.

    ./run.sh            # potem http://localhost:3000
    PORT=3001 ./run.sh  # inny port, równoległa sesja

Wymaga Dockera. Nasłuchuje tylko na 127.0.0.1.
