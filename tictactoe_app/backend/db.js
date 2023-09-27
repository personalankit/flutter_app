import mongoose from 'mongoose';
import 'dotenv/config';

export const mongoDb = async () => {
    try {
        await mongoose.connect(process.env.CONNECTION_URL);
        console.log(`⚡️[DB]: db is connected`);
    } catch (error) {
        console.log(`⚡️[DB]: DB has some error`);
    }
};

