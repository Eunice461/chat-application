const express = require('express');
const app = express();
require('dotenv')
const router = express.Router();

const path = require('path')
const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');

const authRouter = require('./routes/authRoute')
const messengerRoute = require('./routes/messengerRoute');

app.use(bodyParser.json());
app.use(cookieParser());

app.use('/api/messenger',authRouter);
app.use('/api/messenger',messengerRoute);




app.get('/', (req, res)=>{
    res.send('This is from backend Sever');
})




module.exports = app;