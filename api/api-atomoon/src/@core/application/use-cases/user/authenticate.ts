import { Token } from '../../../domain/entities/Token'
import { UserGateway } from "@/@core/domain/gateways"
import { User } from "@/@core/domain/entities"

export interface IAuthenticateDTO {
    readonly email: User['email']
    readonly password: User['password']
}

export class AuthenticateUserUseCase {
    constructor(private userGateway: UserGateway) { }

    execute(data: IAuthenticateDTO): Promise<Token> {
        return this.userGateway.login(data.email, data.password)
    }
}