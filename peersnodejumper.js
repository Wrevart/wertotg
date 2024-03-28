const puppeteer = require('puppeteer');
const fs = require('fs');

(async () => {
    const browser = await puppeteer.launch({
        headless: true, 
        args: ['--no-sandbox', '--disable-setuid-sandbox']
    });
    const page = await browser.newPage();
    await page.goto('https://app.nodejumper.io/babylon-testnet/sync', { waitUntil: 'networkidle0' });

    await page.waitForSelector('span.token.string');
    let data = await page.$eval('span.token.string', element => element.innerText);

    // Удаляем кавычки
    data = data.replace(/["']/g, '');

    // Записываем данные в файл
    fs.appendFile('peers.txt', data + '\n', (err) => {
        if (err) {
            console.error('Ошибка при записи в файл:', err);
        } else {
            console.log('Данные успешно добавлены в файл peers.txt');
        }
    });

    await browser.close();
})();


