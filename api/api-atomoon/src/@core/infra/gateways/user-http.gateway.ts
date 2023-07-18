import { Session } from '@/@core/domain/entities';

import { AxiosInstance } from "axios";
import { User } from "../../domain/entities";
import { UserGateway } from "../../domain/gateways";

export class UserAxiosGateway implements UserGateway {
    constructor(public api: AxiosInstance) { }

    async findByEmail(email: string): Promise<User> {
        throw new Error("Method not implemented.");
    }
    async findAll(): Promise<User[] | []> {
        return this.api.get<User[]>('/users').then(
            (res) =>
                res.data.map(data =>
                    new User({
                        id: data.id,
                        name: data.name,
                        email: data.email,
                        password: data.password,
                        role: data.role,
                        createdAt: data.createdAt,
                        updatedAt: data.updatedAt
                    })
                )
        )
    }
    async findById(id: string): Promise<User> {
        throw new Error("Method not implemented.");
    }
    async login(email: string, password: string): Promise<Session> {
        throw new Error("Method not implemented.");
    }
    async create(user: User): Promise<boolean> {
        throw new Error("Method not implemented.");
    }
    async delete(user: User): Promise<boolean> {
        throw new Error('Method not implemented.');
    }

    async logOut(token: string): Promise<void> {
        throw new Error('Method not implemented.');
    }
}