import { Token } from './../entities/Token'
import { User, UserPropsOutput } from "../entities/User"

export interface UserGateway {
    login(email: string, password: string): Promise<Token>
    create(user: User): Promise<boolean>
    delete(user: User): Promise<boolean>
    logOut(token: Token): Promise<void>
    findByToken(token: Token): Promise<UserPropsOutput | null>
    findById(id: string): Promise<User | null>
    findByEmail(email: string): Promise<User | null>
    findAll(): Promise<User[] | []>
}