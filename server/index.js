const express = require('express');
const cors = require('cors');
const path = require('path');
const port = 3000;

const router = require('./routers/index');

const app = express();
app.use(express.json());
app.use(cors());
app.use(express.static(path.join(__dirname, '../client/dist')));
app.get('/hello', (req, res) => { res.status(200).send('Hello from the test route!\n'); });
app.use('/api', router);

const server = app.listen(port, () => console.log(`Connected on http://localhost:${port}`));

module.exports = { app, server };
