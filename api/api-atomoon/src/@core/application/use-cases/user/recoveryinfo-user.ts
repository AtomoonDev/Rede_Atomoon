import { UserPropsOutput } from '@/@core/domain/entities'
import { Token } from '../../../domain/entities/Token'
import { UserGateway } from "@/@core/domain/gateways"



export class GetUserInformationUserCase {
    constructor(private userGateway: UserGateway) { }

    execute(data: Token): Promise<UserPropsOutput | null> {
        return this.userGateway.findByToken(data)
    }
}