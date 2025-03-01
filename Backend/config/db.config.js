const mongoose = require('mongoose')
const dotenv = require('./env.config')
const MONGO_URI = dotenv.MONGO_URI

const connectDB = async () => {
    try{
        const conn = await mongoose.connect(MONGO_URI)
        console.log(`MongoDB Connected: ${conn.connection.host}`)
    }
    catch(err){
        console.error(`Error: ${err.message}`)
        process.exit(1)
    }
}

module.exports = connectDB