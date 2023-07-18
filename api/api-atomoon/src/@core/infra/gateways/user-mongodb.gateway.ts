import { ConflictError, InternalServerError } from '@/@core/application/responses';
import { BadRequestError } from '../../application/responses/errors/bad-request'
import { Token } from './../../domain/entities/Token'
import { Db } from "mongodb"
import { UserGateway } from "../../domain/gateways"
import { User, UserPropsOutput } from "../../domain/entities"
import { v4 as uuid } from 'uuid'
import { hashPassword, comparePassword } from '../../infra/providers'
import { generateToken, verifyToken } from '../../infra/providers/JWT'


export class UserRepositoryMongo implements UserGateway {
    private db!: Db;

    constructor(mongoDBConnection: Db) {
        this.db = mongoDBConnection
    }

    async findAll(): Promise<User[]> {
        const users = await this.db.collection('users').find().toArray()

        return users.map((data) => {
            return new User({
                id: data.id,
                name: data.name,
                email: data.email,
                password: data.password,
                role: data.role,
                createdAt: data.createdAt,
                updatedAt: data.updatedAt,
            })
        })
    }

    async findById(id: string): Promise<User | null> {
        const user = await this.db.collection('users').findOne({ id })
        if (user) {
            return new User({
                id: user.id,
                name: user.name,
                email: user.email,
                password: user.password,
                role: user.role,
                createdAt: user.createdAt,
                updatedAt: user.updatedAt,
            });
        }

        return null;
    }

    async findByEmail(email: string): Promise<User | null> {
        const user = await this.db.collection('users').findOne({ email });
        if (user) {
            return new User({
                id: user.id,
                name: user.name,
                email: user.email,
                password: user.password,
                role: user.role,
                createdAt: user.createdAt,
                updatedAt: user.updatedAt,
            });
        }

        return null;
    }

    async findByToken(token: Token): Promise<UserPropsOutput> {
        const decoded = verifyToken(token)

        if (!decoded)
            throw new BadRequestError('Token inválido')

        let userMongo = await this.db.collection('users').findOne({ id: decoded.id })

        if (!userMongo)
            throw new BadRequestError('Usuário não encontrado')

        const userOutput: UserPropsOutput = {
            name: userMongo.name,
            email: userMongo.email,
            role: userMongo.role,
            createdAt: userMongo.createdAt,
        }

        return userOutput
    }


    async login(email: string, password: string): Promise<Token> {
        const user = await this.findByEmail(email)
        if (!user)
            throw new BadRequestError('Usuário não encontrado')

        const isValidPassword = await comparePassword(password, user.password)
        if (!isValidPassword)
            throw new BadRequestError('Senha inválida')

        const token = generateToken({ id: user.id, role: user.role })

        return token
    }

    async create(userReceived: User): Promise<boolean> {
        if (!userReceived.name || !userReceived.email || !userReceived.password) {
            throw new BadRequestError('Campos de preenchimento obrigatório não foram preenchidos')
        }

        const userExists = await this.db.collection('users').findOne({ email: userReceived.email });
        if (userExists)
            throw new ConflictError('Usuário já cadastrado')

        const criptPassword = await hashPassword(userReceived.password)

        const userProps = new User({
            id: uuid(),
            name: userReceived.name,
            email: userReceived.email,
            password: criptPassword,
            role: 'user',
            createdAt: new Date(),
            updatedAt: new Date()
        })

        await this.db.collection('users').insertOne(userProps.toJSON()).catch((_err) => {
            throw new InternalServerError('Erro ao cadastrar usuário')
        })

        return true
    }

    async delete(user: User): Promise<boolean> {
        if (!user.id)
            throw new BadRequestError('Usuário não encontrado')

        await this.db.collection('users').deleteOne({ id: user.id }).catch((_err) => {
            throw new InternalServerError('Erro ao deletar usuário')
        })

        return true
    }

    async logOut(token: Token): Promise<void> {
        // Is not a valid token
        if (!verifyToken(token)) {
            return
        }

        // Is a valid token, but is already logged out
        const session = await this.db.collection('invalid-tokens').findOne({ token })
        if (session) {
            return
        }

        this.db.collection('invalid-tokens').insertOne({ token }).catch(() => {
            throw new InternalServerError('Erro ao fazer logOut')
        })
    }
}