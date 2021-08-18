const express = require('express');
const cors = require('cors');
const path = require('path');
const router = require('./routers');

const port = 3000;

const app = express();
app.use(express.json());
app.use(cors());
app.get('/hello', (req, res) => { res.status(200).send('Hello from the test route!\n'); });

// Begin Routing middleware //
app.use(express.static('./server/public/'));
app.use('/api', router);

const server = app.listen(port, () => console.log(`Connected on http://localhost:${port}`));

module.exports = { app, server };
