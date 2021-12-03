const express = require("express");
const mysql = require("mysql2/promise");

let db = null;
const app = express();

app.use(express.json());


app.post('/create-user', async(req, res, next)=>{
  const name = req.body.name;
  const nic = req.body.nic;
  const contact = req.body.contact;
  const email = req.body.email;
  const password = req.body.password;

  //await db.query("INSERT INTO users (name,nic,contact,email,password) VALUES ?",[name],",?", [nic],",?", [contact],",?", [email],",?", [password],";"); 
  
  //await db.query("INSERT INTO users (name,nic,contact,email,password) VALUES ($1,$2,$3,$4,$5);",[name], [nic], [contact], [email], [password]); 
  var values =[[name], [nic], [contact], [email], [password]];
  await db.query("INSERT INTO users (name,nic,contact,email,password) VALUES (?,?,?,?,?)",values);
  res.json({status:"OK"}); 
  next();
});
app.get('/users', async (req, res, next) => {
 
  const [rows] = await db.query("SELECT * FROM users;");

  res.json(rows);
  next();
});

async function main(){
  db = await mysql.createConnection({
    host:"localhost",
    user: "root",
    password: "",
    database: "DB_AT",
    timezone: "+00:00",
    charset: "utf8mb4_general_ci",
  });

  app.listen(9000);
}

main();