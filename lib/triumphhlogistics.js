const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const cors = require('cors');

const app = express();
const port = 3000;
app.use(cors());

const db = mysql.createConnection({
    host: 'triumphhlogistics-rds-instance-1.c9bkciincv3l.ap-southeast-2.rds.amazonaws.com',
    port: 3306,
    user: 'admin',
    password: 'g%pwPf?Z)5xj7Xu',
    database: 'triumphhlogistics',
    authSwitchHandler: (data, cb) => {
      if (data.pluginName === 'mysql_native_password') {
        cb(null, Buffer.from('caching_sha2_password'));
      }
    }
});

db.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
  } else {
    console.log('Connected to MySQL database');
  }
});

app.use(bodyParser.json());

app.post('/driver', (req, res) => {
  console.log('Received POST request to /driver');

  // Process the request and handle database operations
  // Insert the driver details into the database

  // Respond to the request
  res.status(200).json({ message: 'Driver details saved successfully' });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});

// Fetch and log the list of tables
db.query('SHOW TABLES', (err, results) => {
  if (err) {
    console.error('Error fetching tables:', err);
    return;
  }

  console.log('List of tables in the database:');
  for (const row of results) {
    console.log(row[`Tables_in_triumphhlogistics`]);
  }
});
