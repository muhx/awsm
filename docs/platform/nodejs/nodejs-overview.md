---
title: Node.js dan Segala Cerita Tentangnya
tags:
    - nodejs
    - platform
---

Node.js merupakan salah satu _open-source_ , _cross-platform_, JavaScript runtime untuk membuat aplikasi berbasis server _(server-based)_ maupun _command line_.

## Jadi sebenarnya Node.js itu apa?

Node.js di desain untuk dipakai dalam proses pembuatan aplikasi berbasis jaringan yang _scalable_. Contoh code berikut dapat menghandle koneksi secara simultan. Untuk setiap koneksi, _callback_ akan dijalankan, namun jika tidak ada task/pekerjaan yang harus dilakukan, Node.js akan masuk dalam mode sleep.

``` js

const http = require('http');

const hostname = '127.0.0.1';
const port = 3000;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Hello World');
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});

```

Hal ini sangat kontras dengan model concurrency pada umumnya, yang berjalan di thread pada Sistem Operasi. Thread-based networking relatif kurang efisien dan sangat susah untuk digunakan. Selain itu, kalian sebagai pengguna Node.js gak perlu khawatir akan adanya proses _dead-locking,_ karena memang tidak ada lock di Node.js.

Hampir tidak ada fungsi di Node.js yang secara langsung melakukan I/O, sehingga tidak akan ada proses _blocking[^1]_ kecuali ketika I/O dilakukan menggunakan metode _synchronous_ . Karena tidak ada proses _blocking_, system yang direncanakan memiliki skalabilitas sangat tepat di kembangkan menggunakan Node.js.

Node.js secara desain mirip, dan terinspirasi oleh system seperti _Event Machine_ pada Ruby dan Twisted pada Python. HTTP merupakan _first-class citizen_ pada Node.js, di design dengan _streaming_ dan latensi yang rendah. Hal ini membuat Node.js sangat cocok dipakai sebagai pondasi dari sebuah _library_ web atau web _framework sekalipun.

Jujur, translate ginian capek juga ya.

## Informasi Resmi

- [x] [Website](https://nodejs.org/)
- [x] [Dokumentasi](https://nodejs.org/dist/latest/docs/api/)
- [x] [Repositori](https://github.com/nodejs/node)



[^1]: [Blocking vs Non-Blocking](https://nodejs.org/en/docs/guides/blocking-vs-non-blocking)
