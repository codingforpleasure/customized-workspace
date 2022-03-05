<!--ts-->
   * [Ngnix](#ngnix)

<!-- Added by: gil_diy, at: Sat 05 Mar 2022 12:20:12 IST -->

<!--te-->

# Ngnix

While Gunicorn is well-suited as an application server,
it's not a good idea to have it facing the internet because of security considerations and web request handling limitations.
A common pattern is to use Nginx as a reverse-proxy in front of Gunicorn for routing requests between services.