require("dotenv").config();
const express = require('express');
const app = express();
const port = 3000;

const clientesRoutes = require('./src/routes/clientes');
const pedidosRoutes = require('./src/routes/pedidos');

app.use(express.json());

app.use(clientesRoutes);
app.use(pedidosRoutes);

app.listen(port, () => {
    console.log('listening on ' + port);
})