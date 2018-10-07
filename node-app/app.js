
const express = require('express');
const server = express();
const { Pool } = require('pg');
const os = require('os');

const PORT = process.env.PORT;
const PSQL_HOST = process.env.POSTGRES_HOST;
const PSQL_PORT = process.env.POSTGRES_PORT;
const PSQL_USER = process.env.POSTGRES_USER;
const PSQL_PASSWORD = process.env.POSTGRES_PASSWORD;
const PSQL_DBNAME = process.env.POSTGRES_DB;

console.log(`Connecting to postgres://${PSQL_USER}@${PSQL_HOST}:${PSQL_PORT}/${PSQL_DBNAME}`)

const pool = new Pool({
    connectionString: `postgres://${PSQL_USER}:${PSQL_PASSWORD}@${PSQL_HOST}:${PSQL_PORT}/${PSQL_DBNAME}`,
})

server.listen(PORT, () => console.log(`Server running on ${PORT}`));

server.get('/time', (req, reqRes, next) => {

    console.log('Got time request')
    pool.query('SELECT NOW() as now').then(res => {
        reqRes.status(200).send(`${os.hostname()}: time ${res.rows[0].now}`)
    }).catch(next)

});

server.get('/', (req, res) => {
    console.log('Got request')
    res.status(200).send('hello')
});
