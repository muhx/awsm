---
title: Node.js dan Segala Cerita Tentangnya
tags:
    - nodejs
    - platform
---

Node.js merupakan salah satu _open-source_ , _cross-platform_, JavaScript runtime untuk membuat aplikasi berbasis server _(server-based)_ maupun _command line_.

## Tentang Node.js

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

Hal ini sangat kontras dengan model concurrency pada umumnya yang berjalan pada thread di Sistem Operasi. Thread-based networking relatif kurang efisien dan sangat susah untuk digunakan.
