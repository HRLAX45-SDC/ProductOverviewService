const express = require('express');
const cors = require('cors');
const router = require('./routers');

const port = process.env.API_PORT || 3000;

const app = express();
app.use(express.json());
app.use(cors());

// Begin Routing middleware //
app.use(express.static('./server/public/'));
app.use('/api', router);

const server = app.listen(port, () => console.log(`Connected on http://localhost:${port}`));

module.exports = { app, server };
