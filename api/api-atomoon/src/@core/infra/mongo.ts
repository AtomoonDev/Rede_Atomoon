import { Db, MongoClient } from "mongodb"

if (!process.env.MONGODB_URL)
    throw new Error("MONGODB_URL enviroment variable must be defined");

const url = process.env.MONGODB_URL

class MongoDBConnection {
    private client!: MongoClient;
    private db!: Db;

    async connect(dbName: string): Promise<Db> {
        this.client = await MongoClient.connect(url)
        this.db = this.client.db(dbName)
        return this.db
    }

    async close(): Promise<void> {
        await this.client.close();
    }
}

const mongoConnection = new MongoDBConnection().connect('atomoon')

export const mongodb = await mongoConnection.then(mongoInstance => {
    console.log("MongoDB: Connected correctly to server");
    return mongoInstance
})
.catch(error => {
    throw new Error("MongoDB: Error connecting to server");
})