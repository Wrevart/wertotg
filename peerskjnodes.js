const axios = require('axios');
const cheerio = require('cheerio');
const fs = require('fs');

async function fetchData(url) {
  try {
    const { data } = await axios.get(url);
    const $ = cheerio.load(data);
    
    const selectedData = $('html > body > div > div > div > main > div > div').text();

    const peersRegex = /peers="([^"]+)/;
    const matches = peersRegex.exec(selectedData);

    if (matches && matches.length > 1) {
      const peers = matches[1];

      // Сохраняем данные в файл
      fs.writeFile('peers.txt', peers, (err) => {
        if (err) {
          console.error('Ошибка при записи файла:', err);
        } else {
          console.log('Список пиров успешно сохранён в файл peers.txt');
        }
      });
    } else {
      console.log('Пиры не найдены');
    }
  } catch (error) {
    console.error(`Произошла ошибка при запросе данных: ${error.message}`);
  }
}

// Убедитесь, что URL корректен
fetchData('https://services.kjnodes.com/testnet/babylon/');

