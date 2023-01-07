//eventually remove all code to make this newest node-base
require('dotenv').config()
const express = require('express')
const app = express()
const bodyParser = require('body-parser')
//npm i body-parser express ejs dotenv
//npm i socket.io

//include mongoose base, from crud next time.

app.set('views', './views')
app.set('view engine', 'ejs')
app.use(express.static('public'))
app.use(express.urlencoded({ extended: true }))
app.use(bodyParser.urlencoded({ extended: false }))


let mysql = require('mysql'); //npm i mysql
let con = mysql.createConnection({
  host: '127.0.0.1',
  user: process.env.DB_user,
  password: process.env.DB_pw,
  database: 'e_commerce' //if DB alr created scenario
});

con.connect(function(err) {    //run connect once at top only, else cannot enqueue handshake err
  if (err) throw err; });  

// let sql = `Insert INTO Customer(Account_ID, Phone_no, Block_No, Street, Unit_No)
// VALUES ( 'A1', 80221111, 51,'Ang Mo Kio Avenue 1', 11)`;

// con.query(sql, function (err, result) {
//   if (err) throw err;
//   console.log("1 record inserted");
// });

let Account_ID


//login ====================== 
app.get('/', (req, res) => {
  let handphone = ''
  res.render('index', {handphone:handphone})
})


app.post('/', (req, res) => {
  let username =  req.body.username
  let password = req.body.password
  //Twilio OTP here
  //open twilio sublime text wide screen
  //import keys
  //install twilio
  //random OTP digit generator 'for testing', just hardcore '12' pw
  //implement test jest
  let handphone = ''
  res.render('index', { handphone: handphone })
})


//register ======================
app.get('/register', (req, res) => {

    con.query("SELECT * FROM customer",  function (err, result, fields) {
      if (err) throw err;
      let no_of_accounts =  result.length + 1 
      let Account_ID = 'A'.concat(no_of_accounts.toString())
      
      res.render('register', {Account_ID:Account_ID})
    });
  });

app.post('/register', (req, res) => {
  Account_ID = req.body.Account_ID
  let handphone = req.body.handphone
  let street = req.body.street
  let block = req.body.block
  let house_no = req.body.house_no
  console.log(Account_ID,handphone,block,house_no)


  let sql = `Insert INTO Customer(Account_ID, Phone_no, Block_No, Street, Unit_No)
  VALUES ( '${Account_ID}', ${handphone}, ${block},'${street}', ${house_no})`;

  con.query(sql, function (err, result) {
    if (err) throw err;
    console.log("1 record inserted");
  });
  res.redirect('/')
})



//select items ====================== 
app.get('/catalogue', (req, res) => {
  res.render('catalogue')
})

 

//confirm order ====================== 
app.post('/order', (req, res) => {
  let item1 =  req.body.fan
  let item2 = req.body.cup
  let item3 = req.body.tape
  // parse int?

 
  res.render('index', { item1: item1, item2: item2, item3: item3  })
})


//logout ====================== 
app.get('/', (req, res) => {
  let x = 1
  res.render('index', { x: x })
})

//chat-room ====================== 
app.get('/', (req, res) => {
  let x = 1
  res.render('index', { x: x })
})


//admin (update stock, chat) ====================== 
app.get('/', (req, res) => {
  let x = 1
  res.render('index', { x: x })
})


//function
//calculate bill

//return API,  python   https://api-ninjas.com/api/trivia  (food)

//



app.listen(3003, ()=>{
  console.log('listening port 3003!')
}) //use google chrome 
