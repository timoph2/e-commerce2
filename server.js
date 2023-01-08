//eventually remove all code to make this newest node-base
require('dotenv').config()
const express = require('express')
const app = express()
const bodyParser = require('body-parser')
//npm i body-parser express ejs dotenv
//npm i socket.io python-shell amqplib
const {PythonShell}=require('python-shell')
var amqp = require('amqplib/callback_api');


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
let handphone
let randomN_otp //left out Twilio to save money


//login ====================== 
app.get('/', (req, res) => {
  // if (!handphone) {
  //   handphone = ''
  // }
  console.log(handphone)

  // if handphone type of null.. then assign ''
  // handphone = req.query.handphone

  res.render('index', {handphone:handphone})
})


app.post('/', (req, res) => {
  let handphone =  req.body.username
  let password = req.body.password
  //Twilio OTP here
  //open twilio sublime text wide screen
  //import keys
  //install twilio
  //random OTP digit generator 'for testing', just hardcore '12' pw
  //implement test jest
  console.log(randomN_otp)

  //include SELECT check if the user is even registered. (do it as a function)
  //so can use it here, AND during SEND OTP button

  // if (randomN_otp == password) {
  if (password == 1) {
    console.log('log in success')
    res.redirect('/catalogue')
    return //MUST TERMINATE REDIRECT if theres .render below
  }


  res.send('wrong otp!')
})

app.post('/otp', (req, res) => {
  handphone = req.body.handphone
  
  //check if user exist
  // con.query(`SELECT * FROM customer WHERE phone_no=${handphone}`,  
  // function (err, result, fields) {
  //   if (err) {throw err};
  //   if (result.length == 0) {result = false}  //cant put a res.send within this SQL query
  //   });

  //how res.send.... CANNOT SEND HEADER error
//[ERR_HTTP_HEADERS_SENT]: Cannot set headers after they are sent to the client
    
  randomN_otp = Math.floor(Math.random() * 90000) + 10000; //random 5 digit code
  console.log(randomN_otp) //OTP that is supposed to go mobile phone

  // client.messages
  // .create({
  //    body: randomN_otp,
  //    from: process.env.TWILIO_TEST_NUMBER,
  //    to: handphone
  //  })
  // .then(message => console.log(message.sid, "hi"));

  //this sends out the SMS
  //but how to scale this for concurrent requests? ('correct' OTP will keep switching.)
  //1 way is save the OTP value to HP_no Key, key_values[handphone] = randomN_otp
  //then save into a session that expire after 5min

  res.redirect('/?handphone=' + handphone)
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

  res.render('catalogue', {handphone:handphone})
})

 

//confirm order ====================== 
app.post('/order', async (req, res) => {
  let item1 =  parseInt(req.body.fan) //5
  let item2 = parseInt(req.body.cup) //10
  let item3 = parseInt(req.body.tape) //15
  let total_cost =  item1*5 + item2*10 + item3*15 




  
//trigger python API call
  let options ={
    scriptPath: "C:/Users/phuat/OneDrive/Desktop/e-commerce"
  }
  //https://www.youtube.com/watch?v=xS3goPDIh84
  // 5min mark to send param
  
  PythonShell.run('API.py', options, (err,res)=>{
    if (err) console.log(err);
    if (res) console.log(res);
  })



  //AMQP retrieval
  let quote = ''

  amqp.connect('amqp://localhost', (error0, connection) => {
    if (error0) { throw error0; }

    connection.createChannel((error1, channel) => {
        if (error1) { throw error1; }
// initliase queue.
        var queue = 'hello';
        channel.assertQueue(queue, {
            durable: false
        });
// begin listening
        console.log(" [*] Waiting for messages in %s. To exit press CTRL+C", queue);
        channel.consume(queue, (msg) => {
// succesfully retrieved message from queue. 
// output message
            console.log(" [x] Received %s", msg.content.toString());
            quote = msg.content.toString()
            //assign msg as variable 
        }, {
            noAck: true
        });
    });
});
  
await new Promise(r => setTimeout(r, 2900));
console.log('hi', quote)



 
  res.render('order', { item1: item1, item2: item2, item3: item3, total_cost:total_cost, quote:quote})
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

 

//sometimes encounter this kind of issues...
//might be 1-off, may not be.
//and it will always be in the context of 'pushing for sooner deadline'
//so do you persist or abandon?
//and if abaondon, train yourself to let it be.
//for now as a junior i can just backlog it as questions to ask. 
//but now the immediate moment, i am rushing so just continue, dont brk momentum




